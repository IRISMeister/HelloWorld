Class MyApps.Installer
{

XData setup [ XMLNamespace = INSTALLER ]
{
<Manifest>
  <Namespace Name="${Namespace}" Create="yes" Code="${Namespace}" Ensemble="1" Data="${Namespace}">
    <Configuration>
      <Database Name="${Namespace}" Dir="${Namespace}" Create="yes" Resource="%DB_${Namespace}"/>
    </Configuration>
    <CSPApplication Url="/csp/${Namespace}" Directory="${CSPDIR}${Namespace}" Resource=""/>
    <Import File="${SRCDIR}/HelloWorld/" Flags="ck" Recurse="true"/>
    <Production Name="HelloWorld.Production" AutoStart="1">
    </Production>
  </Namespace>
</Manifest>
}

ClassMethod setupMethod(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
  Quit ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "setup")
}

ClassMethod setup(ByRef tVars) As %Status
{
  Set tSC='$$$OK
  Try {
    Set Namespace="HELLOWORLD"
    Set webapp="/csp/"_Namespace

    If '$D(tVars("Namespace")) { Set tVars("Namespace")=Namespace }
    If '$D(tVars("SRCDIR")) { Set tVars("SRCDIR")="/home/irisowner/src" }

    Set tSC=..setupMethod(.tVars)
    $$$ThrowOnError(tSC)

    Set oldns=$NAMESPACE
    New $NAMESPACE
    Set $NAMESPACE="%SYS"

    Set tSC = ##Class(Security.Applications).Get(webapp,.props)
    $$$ThrowOnError(tSC)
    Set props("DeepSeeEnabled")=1
    Set tSC = ##Class(Security.Applications).Modify(webapp,.props)
    $$$ThrowOnError(tSC)

    #; Loading into USER because there is an ODBC DSN already.
    Set $NAMESPACE="USER"
    Set tSC=..runSQL()
    Set tSC=..LoadCSV()

    Set $NAMESPACE=oldns

  } Catch(e) {
	  Set tSC=e.AsStatus()
    zw tSC
  }
  Return tSC
}

ClassMethod runSQL() As %Status
{
  Set stmt=##class(%SQL.Statement).%New()
  Set status = stmt.%PrepareClassQuery("%Library.File","FileSet")
  Set rs=stmt.%Execute("/home/irisowner/sql","*.sql")
  While(rs.%Next()) {
    Do $SYSTEM.SQL.Schema.ImportDDL(rs.%CurrentResult.Name,"/home/irisowner/import_Errors.log")
  }

  Return $$$OK
}

ClassMethod LoadCSV() As %Status
{
  Set opt={"from": {"file": {"header": true,"charset": "UTF-8"}}}.%ToJSON()

  Set sql="LOAD DATA FROM FILE '/home/irisowner/csv/worldcities.csv' INTO worldcities USING "_opt

  set stmt = ##class(%SQL.Statement).%New()
  Set tSC=stmt.%Prepare(sql)
  set rs = stmt.%Execute()
  if rs.%SQLCODE > 0 {
    zw rs
    Return '$$$OK
  } else {
    Return $$$OK
  }
  Return $$$OK
}

}

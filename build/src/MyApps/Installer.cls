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

  <Namespace Name="USER" Create="no">
    <Import File="${SRCDIR}/Sample/" Flags="ck" Recurse="true"/>
    <Invoke Class="Sample.Utils" Method="Generate" CheckStatus="false">
    </Invoke>
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

    Set $NAMESPACE=oldns

  } Catch(e) {
	  Set tSC=e.AsStatus()
    zw tSC
  }
  Return tSC
}

}

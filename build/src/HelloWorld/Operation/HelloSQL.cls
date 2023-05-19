/// 
Class HelloWorld.Operation.HelloSQL Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method Execute(pRequest As HelloWorld.Request.SayHello, Output pResponse As HelloWorld.Response.SayHello) As %Status
{
   Set rowid=pRequest.BodyText
   Set tSC = ..Adapter.ExecuteQuery(.tResult,"select city_ascii from worldcities where ID1=?",rowid)
 
   //Get the result
   do tResult.Next()

   Set pResponse=##class(HelloWorld.Response.SayHello).%New()
   Set pResponse.BodyText="Hello, "_ tResult.GetData(1)_" !"
   Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="HelloWorld.Request.SayHello"> 
		<Method>Execute</Method>
	</MapItem>
</MapItems>
}

}

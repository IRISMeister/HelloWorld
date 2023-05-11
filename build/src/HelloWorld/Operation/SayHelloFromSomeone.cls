/// 
Class HelloWorld.Operation.SayHelloFromSomeone Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method Execute(pRequest As HelloWorld.Request.SayHello, Output pResponse As HelloWorld.Response.SayHello) As %Status
{
   Set rowid=pRequest.BodyText
   Set tSC = ..Adapter.ExecuteQuery(.tResult,"Select Name from Sample.Person where ID=?",rowid)
 
   //Get the result
   do tResult.Next()

   Set pResponse=##class(HelloWorld.Response.SayHello).%New()
   Set pResponse.BodyText="Hello World, I am "_ tResult.GetData(1)
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

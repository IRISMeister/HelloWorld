/// 
Class HelloWorld.Operation.SayHello Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter INVOCATION = "Queue";

Method Execute(pRequest As HelloWorld.Request.SayHello, Output pResponse As HelloWorld.Response.SayHello) As %Status
{
	Set sc=..DeferResponse(.token)
	Set result="Hello World, I am "_pRequest.BodyText

	Set id=$INCREMENT(^Result)
	Set ^Result(id,"data")=result
	Set ^Result(id,"token")=token

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

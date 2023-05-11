/// 
Class HelloWorld.Operation.SayHello Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter INVOCATION = "Queue";

Method Execute(pRequest As HelloWorld.Request.SayHello, Output pResponse As HelloWorld.Response.SayHello) As %Status
{

	Set pResponse=##class(HelloWorld.Response.SayHello).%New()
	Set pResponse.BodyText="Hello World, I am "_pRequest.BodyText
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

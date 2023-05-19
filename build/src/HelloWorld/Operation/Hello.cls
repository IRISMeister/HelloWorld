/// 
Class HelloWorld.Operation.Hello Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Parameter INVOCATION = "Queue";

Method Execute(pRequest As HelloWorld.Request.SayHello, Output pResponse As HelloWorld.Response.SayHello) As %Status
{

	Set pResponse=##class(HelloWorld.Response.SayHello).%New()
	Set pResponse.BodyText="Hello, "_pRequest.BodyText_" !"
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

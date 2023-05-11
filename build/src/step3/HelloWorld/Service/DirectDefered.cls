Class HelloWorld.Service.DirectDefered Extends Ens.BusinessService [ ProcedureBlock ]
{

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
	Set pResponseBody=##class(HelloWorld.Response.SayHello).%New()
	Set pResponseBody.BodyText=pInput.Result
	Set sc = ..SendDeferredResponse(pInput.Token, pResponseBody)
	Quit $$$OK
}

}

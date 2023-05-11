Class HelloWorld.Service.File Extends Ens.BusinessService [ ProcedureBlock ]
{

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Method OnProcessInput(pFileStream As %FileCharacterStream, pOutput As %RegisteredObject) As %Status
{

	Set tSC=$$$OK
	Try {
		Set tLine=pFileStream.ReadLine()

	  	Set tRequest = ##class(HelloWorld.Request.SayHello).%New()
	  	Set tRequest.BodyText = tLine 
		Set tSC = ..SendRequestSync("Capitalize",tRequest,.pOutput)

		Quit
	} 
	Catch(e) {
		Set tSC=$$$EnsSystemError
	}
	Quit tSC
}

}

/// 
Class HelloWorld.Service.Direct Extends Ens.BusinessService [ ProcedureBlock ]
{

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
	Try {
		Set tSC = ..SendRequestSync("Capitalize",pInput,.pOutput) Quit:$$$ISERR(tSC)
	}
	Catch e {
			Set $ZT="",tSC=$$$EnsSystemError
	}
	Quit tSC
}

}

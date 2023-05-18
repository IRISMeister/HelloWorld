/// 
Class HelloWorld.Service.DirectRouter Extends Ens.BusinessService [ ProcedureBlock ]
{

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
	Try {
		Set tSC = ..SendRequestSync("RoutingEngine",pInput,.pOutput) Quit:$$$ISERR(tSC)
	}
	Catch e {
			Set $ZT="",tSC=$$$EnsSystemError
	}
	Quit tSC
}

}

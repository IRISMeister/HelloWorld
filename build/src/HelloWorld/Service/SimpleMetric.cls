/// 
Class HelloWorld.Service.SimpleMetric Extends Ens.BusinessMetric [ ProcedureBlock ]
{

Property TotalTimes As Ens.DataType.Metric(UNITS = "times");

Method OnCalculateMetrics() As %Status
{
	&sql(SELECT COUNT(*) 
			INTO :tT
			FROM HelloWorld_Response.SayHello
	)	
	Set ..TotalTimes = tT
	Quit $$$OK
}

}

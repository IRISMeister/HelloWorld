/// 
Class HelloWorld.Dashboard.SimpleDashboard Extends Ens.Dashboard
{

XData Dashboard
{
<Dashboard RefreshRate="2000" Metric="SimpleMetric">
  <FuelGauge Label="TotalTimes" 
               Property="TotalTimes" RangeLower="0" RangeUpper="100"
               ThresholdLower="10" ThresholdUpper="90"/>
</Dashboard>
}

}

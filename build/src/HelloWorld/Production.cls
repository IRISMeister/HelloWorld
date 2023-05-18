/// 
Class HelloWorld.Production Extends Ens.Production [ ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="HelloWorld.Production" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Hello" Category="" ClassName="HelloWorld.Operation.Hello" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" InactivityTimeout="0" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="Capitalize" Category="" ClassName="HelloWorld.Process.Capitalize" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" InactivityTimeout="0" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
  </Item>
  <Item Name="Direct" Category="" ClassName="HelloWorld.Service.Direct" PoolSize="0" Enabled="true" Foreground="false" DisableErrorTraps="false" InactivityTimeout="0" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="DirectRouter" Category="" ClassName="HelloWorld.Service.DirectRouter" PoolSize="0" Enabled="true" Foreground="false" DisableErrorTraps="false" InactivityTimeout="0" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
  </Item>
  <Item Name="HelloSQL" Category="" ClassName="HelloWorld.Operation.HelloSQL" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" InactivityTimeout="0" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="DSN">Userunixodbc</Setting>
    <Setting Target="Adapter" Name="Credentials"></Setting>
    <Setting Target="Adapter" Name="JDBCDriver"></Setting>
    <Setting Target="Adapter" Name="JDBCClasspath"></Setting>
    <Setting Target="Adapter" Name="ConnectionAttributes"></Setting>
    <Setting Target="Adapter" Name="JGService"></Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
  </Item>
  <Item Name="File" Category="" ClassName="HelloWorld.Service.File" PoolSize="1" Enabled="true" Foreground="false" InactivityTimeout="0" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/home/irisowner/file/in</Setting>
    <Setting Target="Adapter" Name="ArchivePath">/home/irisowner/file/out</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.txt</Setting>
  </Item>
  <Item Name="RoutingEngine" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="0" Enabled="true" Foreground="false" InactivityTimeout="0" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">HelloWorld.Process.Capitalize.MsgRuleSimple</Setting>
    <Setting Target="Host" Name="ResponseFrom">*</Setting>
  </Item>
  <Item Name="SimpleMetric" Category="" ClassName="HelloWorld.Service.SimpleMetric" PoolSize="1" Enabled="true" Foreground="false" InactivityTimeout="0" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
</Production>
}

}

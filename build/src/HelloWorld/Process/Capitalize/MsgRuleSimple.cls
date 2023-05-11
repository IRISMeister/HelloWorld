/// 
Class HelloWorld.Process.Capitalize.MsgRuleSimple Extends Ens.Rule.Definition [ ProcedureBlock ]
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<constraint name="msgClass" value="HelloWorld.Request.SayHello"></constraint>
<when condition="(Matches(Document.BodyText,&quot;.N&quot;))" comment="">
<send transform="" target="SayHelloFromSomeone"></send>
<return></return>
</when>
</rule>
<rule name="">
<constraint name="msgClass" value="HelloWorld.Request.SayHello"></constraint>
<when condition="1" comment="">
<send transform="HelloWorld.Transform.Capitalize" target="SayHello"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}

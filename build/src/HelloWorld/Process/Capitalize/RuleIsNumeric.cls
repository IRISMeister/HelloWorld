/// 
Class HelloWorld.Process.Capitalize.RuleIsNumeric Extends Ens.Rule.Definition [ ProcedureBlock ]
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="HelloWorld.Process.Capitalize.Context" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<when condition="((Matches(tmpRequest.BodyText,&quot;.N&quot;))=(1))" comment="">
<return>1</return>
</when>
</rule>
<return>0</return>
</ruleSet>
</ruleDefinition>
}

}

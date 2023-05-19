Class HelloWorld.Process.Capitalize Extends Ens.BusinessProcessBPL [ ClassType = persistent ]
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='HelloWorld.Request.SayHello' response='HelloWorld.Response.SayHello' height='2000' width='2000' >
<context>
<property name='Document' type='HelloWorld.Request.SayHello' >
</property>
<property name='RuleResult' type='%Integer' >
</property>
<property name='WFResult' type='%String' >
</property>
</context>
<sequence xend='550' yend='1050' >
<trace name='logging' value='"Capitalizeが呼ばれました"' xpos='550' ypos='200' />
<transform name='DT' class='HelloWorld.Transform.Capitalize' source='request' target='context.Document' xpos='550' ypos='300' />
<rule name='IsNumeric' rule='RuleIsNumeric'  resultLocation='context.RuleResult' xpos='550' ypos='400' >
</rule>
<if name='IsRuleApplied' condition='context.RuleResult' xpos='550' ypos='500' xend='550' yend='950' >
<annotation>ルールは真か？</annotation>
<true>
<call name='WF Ask manager' target='Management' async='1' xpos='820' ypos='650' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Actions" value="&quot;許可,却下&quot;" action="set" />
<assign property="callrequest.%Subject" value="&quot;アクセス許可申請&quot;" action="set" />
<assign property="callrequest.%Message" value="&quot;許可ねがいます&quot;" action="set" />
<assign property="callrequest.%FormFields" value="&quot;Comment&quot;" action="set" />
</request>
<response type='EnsLib.Workflow.TaskResponse' >
<assign property="context.WFResult" value="callresponse.%Action" action="set" />
</response>
</call>
<sync name='sync12' calls='WF Ask manager' type='all' xpos='820' ypos='750' />
<call name='Say Hello From Someone' target='SayHelloFromSomeone' async='0' xpos='820' ypos='850' >
<annotation>Say Hello From Someone
</annotation>
<request type='HelloWorld.Request.SayHello' >
<assign property="callrequest.BodyText" value="context.Document.BodyText" action="set" />
</request>
<response type='HelloWorld.Response.SayHello' >
<assign property="response.BodyText" value="callresponse.BodyText" action="set" />
</response>
</call>
</true>
<false>
<call name='Say Hello' target='SayHello' async='0' xpos='550' ypos='650' >
<annotation>Say Hello</annotation>
<request type='HelloWorld.Request.SayHello' >
<assign property="callrequest.BodyText" value="context.Document.BodyText" action="set" />
</request>
<response type='HelloWorld.Response.SayHello' >
<assign property="response.BodyText" value="callresponse.BodyText" action="set" />
</response>
</call>
</false>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}

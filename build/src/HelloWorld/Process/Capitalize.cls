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
</context>
<sequence xend='550' yend='850' >
<trace name='logging' value='"Capitalizeが呼ばれました"' xpos='550' ypos='200' />
<transform name='DT' class='HelloWorld.Transform.Capitalize' source='request' target='context.Document' xpos='550' ypos='300' />
<rule name='IsNumeric' rule='RuleIsNumeric'  resultLocation='context.RuleResult' xpos='550' ypos='400' >
</rule>
<if name='IsRuleApplied' condition='context.RuleResult' xpos='550' ypos='500' xend='550' yend='750' >
<annotation>ルールは真か？</annotation>
<true>
<call name='Say HelloSQL' target='HelloSQL' async='0' xpos='820' ypos='650' >
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
<call name='Say Hello' target='Hello' async='0' xpos='550' ypos='650' >
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

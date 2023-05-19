/// 
Class HelloWorld.Process.Capitalize Extends Ens.BusinessProcessBPL [ ClassType = persistent ]
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='HelloWorld.Request.SayHello' response='HelloWorld.Response.SayHello' height='2000' width='2000' >
<context>
<property name='Document' type='HelloWorld.Request.SayHello' instantiate='0' />
<property name='RuleResult' type='%Integer' instantiate='0' />
</context>
<sequence xend='200' yend='1000' >
<trace name='logging' value='"Capitalizeが呼ばれました"' xpos='200' ypos='250' />
<assign name="context.Document" property="context.Document" value="request" action="set" xpos='200' ypos='350' >
<annotation><![CDATA[requestをcontext.Documentにアサイン]]></annotation>
</assign>
<rule name='IsNumeric' rule='RuleIsNumeric'  resultLocation='context.RuleResult' xpos='200' ypos='450' >
</rule>
<if name='IsRuleApplied' condition='context.RuleResult' xpos='200' ypos='550' xend='200' yend='900' >
<annotation><![CDATA[ルールは真か？]]></annotation>
<true>
<call name='Say HelloSQL' target='HelloSQL' async='0' xpos='200' ypos='700' >
<request type='HelloWorld.Request.SayHello' >
<assign property="callrequest.BodyText" value="context.Document.BodyText" action="set" />
</request>
<response type='HelloWorld.Response.SayHello' >
<assign property="response.BodyText" value="callresponse.BodyText" action="set" />
</response>
</call>
</true>
<false>
<transform name='DT' class='HelloWorld.Transform.Capitalize' source='request' target='context.Document' xpos='470' ypos='700' />
<call name='Say Hello' target='Hello' async='0' xpos='470' ypos='800' >
<annotation><![CDATA[Say Hello]]></annotation>
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

}

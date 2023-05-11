/// 
Class HelloWorld.Request.SayHello Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Property BodyText As %String;

Storage Default
{
<Data name="SayHelloDefaultData">
<Subscript>"SayHello"</Subscript>
<Value name="1">
<Value>BodyText</Value>
</Value>
</Data>
<DefaultData>SayHelloDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

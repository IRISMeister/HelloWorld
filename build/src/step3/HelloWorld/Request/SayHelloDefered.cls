/// 
Class HelloWorld.Request.SayHelloDefered Extends Ens.Request [ ClassType = persistent, ProcedureBlock ]
{

Property Result As %String;

Property Token As %String;

Storage Default
{
<Data name="SayHelloDeferedDefaultData">
<Subscript>"SayHelloDefered"</Subscript>
<Value name="1">
<Value>Result</Value>
</Value>
<Value name="2">
<Value>Token</Value>
</Value>
</Data>
<DefaultData>SayHelloDeferedDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

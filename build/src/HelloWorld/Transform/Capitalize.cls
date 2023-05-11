Class HelloWorld.Transform.Capitalize Extends Ens.DataTransformDTL  [ DependsOn = HelloWorld.Request.SayHello ] 
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<?xml version="1.0" ?>
<transform targetClass='HelloWorld.Request.SayHello' sourceClass='HelloWorld.Request.SayHello' create='new' language='objectscript'>
<assign property='target.BodyText' value='..ToUpper(source.BodyText)' action='set'/>
</transform>
}

}

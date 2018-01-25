/// Use or operation of this code is subject to acceptance of the license available in the code repository for this code.
Class Sample.Customer Extends %SerialObject
{

Property Name As %String(TRUNCATE = 1);

Property MailingAddresses As list Of Address(JAVATYPE = "java.util.List");

Property Addresses As array Of Address(JAVATYPE = "java.util.Map");

Property MyAddress As Address;

Property Status As %String(TRUNCATE = 1);

Property TS As %TimeStamp;

/// This callback method is invoked by the <METHOD>%New</METHOD> method to 
/// provide notification that a new instance of an object is being created.
/// 
/// <P>If this method returns an error then the object will not be created.
Method %OnNew(initvalue As %CacheString) As %Status [ Private ]
{
	Do ..SetDefault()
	Quit $$$OK
}

Method SetDefault()
{
	Do ..MailingAddresses.Clear()
	Do ..Addresses.Clear()
	
	Set l = $listbuild("One Memorial Dr.","Cambridge","MA","02142")
	Set l1 = $listbuild(l,"Sample.Address")
	Set a = ##class(Sample.Address).%Open(l1)
	Do ..MailingAddresses.Insert(a)
	
	Set l = $listbuild("768 Beacon St.","Brookline","MA","02446")
	Set l1 = $listbuild(l,"Sample.Address")
	Set a = ##class(Sample.Address).%Open(l1)
	Do ..MailingAddresses.Insert(a)
	
	Set l = $listbuild("825 Third Ave.","New York","NY","10022")
	Set l1 = $listbuild(l,"Sample.Address")
	Set a = ##class(Sample.Address).%Open(l1)
	Do ..Addresses.SetAt(a, "Residence")
	
	Set l = $listbuild("7722 Main St.","Detroit","MI","48224")
	Set l1 = $listbuild(l,"Sample.Address")
	Set a = ##class(Sample.Address).%Open(l1)
	Do ..Addresses.SetAt(a, "Business")
	
	Set l = $listbuild("25 Glen Ave","Newton","MA","02459")
	Set l1 = $listbuild(l,"Sample.Address")
	Set a = ##class(Sample.Address).%Open(l1)
	
	Set ..MyAddress = a
	Set ..Name = "Joe Doe, Jr."
	Set ..Status = "Prospect"
}

Storage Default
{
<Data name="CustomerState">
<Value name="1">
<Value>Addresses</Value>
</Value>
<Value name="2">
<Value>MailingAddresses</Value>
</Value>
<Value name="3">
<Value>MyAddress</Value>
</Value>
<Value name="4">
<Value>Name</Value>
</Value>
<Value name="5">
<Value>Status</Value>
</Value>
<Value name="6">
<Value>TS</Value>
</Value>
</Data>
<State>CustomerState</State>
<StreamLocation>^Sample.CustomerS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}


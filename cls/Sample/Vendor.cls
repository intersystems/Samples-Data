/// Use or operation of this code is subject to acceptance of the license available in the code repository for this code.
/// The Vendor class is a persistent class 
/// containing vendor information.<br>
/// This class demonstrates how to use the %CacheSQLStorage storage 
/// class to provide custom storage for a persistent class. Typically the 
/// %CacheSQLStorage storage class is used to provide object access 
/// to previously existing storage structures.
Class Sample.Vendor Extends (%Persistent, %Populate, %XML.Adaptor) [ SqlRowIdName = Vendor, StorageStrategy = SQLStorage ]
{

/// Name Index
Index IndexNName On Name;

/// Vendor name.
Property Name As %String(POPSPEC = "Company()");

/// Vendor address.
Property Address As Address(POPSPEC = "##class(Address).PopulateSerial()");

/// Name of primary vendor contact.
Property Contact As %String(POPSPEC = "Name()");

/// Discount rate.
Property DiscRate As %Float(MAXVAL = 100, MINVAL = 0);

/// Discount days.
Property DiscDays As %Integer(MAXVAL = 999, MINVAL = 0);

/// Net days.
Property NetDays As %Integer(MAXVAL = 999, MINVAL = 0);

/// Days clear.
Property DaysClear As %Integer(MAXVAL = 999, MINVAL = 0);

/// Payment Flag
Property PayFlag As %String(DISPLAYLIST = ",Never,Minimum", VALUELIST = ",N,M");

/// Minimum Payment.
Property MinPayment As %Float(MAXVAL = 999999, MINVAL = 0);

/// Last Invoice Date.
Property LastInvDate As %Date(MAXVAL = "", MINVAL = "");

/// Last Payment Date.
Property LastPayDate As %Date(MAXVAL = "", MINVAL = "");

/// Balance.
Property Balance As %Float(MAXVAL = 999999999, MINVAL = -999999999);

/// Vendor tax reporting status.
Property TaxReporting As %String(DISPLAYLIST = ",Exempt,Required", VALUELIST = ",E,");
}


codeunit 99500 TestCodeunit
{
    Subtype = Test;

    [Test]
    procedure TestCreateCustomer()
    var
        Customer: Record Customer;
        LibraryAssert: Codeunit "Library Assert";
        MyJsonManagment: Codeunit "My Json Managment";
        JsonString: Text;
        Counter: Integer;
    begin
        //GIVEN - We have an JSON string with Type Customer
        Customer.SetRange(Name, 'My Test Cust');
        Counter := Customer.Count();
        JsonString := '{ "Type": "Customer", "Name": "My Test Cust" }';
        //WHEN - Passed to function
        MyJsonManagment.ReadJson(JsonString);
        //THEN - It will create a customer
        Customer.SetRange(Name, 'My Test Cust');
        LibraryAssert.AreEqual(Customer.Count(), Counter + 1, 'Create Customer');
    end;

    [Test]
    procedure TestCreateVendor()
    var
        Vendor: Record Vendor;
        LibraryAssert: Codeunit "Library Assert";
        JsonString: Text;
        MyJsonManagment: Codeunit "My Json Managment";
        Counter: Integer;
    begin
        //GIVEN - We have an JSON string with Type Vendor
        Vendor.SetRange(Name, 'My Test Vendor');
        Counter := Vendor.Count();
        JsonString := '{ "Type": "Vendor", "Name": "My Test Vendor" }';
        //WHEN - Passed to function
        MyJsonManagment.ReadJson(JsonString);
        //THEN - It will create a vendor
        Vendor.SetRange(Name, 'My Test Vendor');
        LibraryAssert.AreEqual(Vendor.Count(), Counter + 1, 'Create Vendor');
    end;

    [Test]
    procedure TestCreateInVaildType()
    var
        LibraryAssert: Codeunit "Library Assert";
        JsonString: Text;
        MyJsonManagment: Codeunit "My Json Managment";
        Counter: Integer;
    begin
        //GIVEN - We have an JSON string with Type InVaild
        JsonString := '{ "Type": "InVaild", "Name": "In Vaild" }';
        //WHEN - Passed to function
        asserterror MyJsonManagment.ReadJson(JsonString);
        //THEN - It will fail        
        LibraryAssert.AreEqual(GetLastErrorText(), 'InVaild is not a vaild type', 'Wrong error message');
    end;


}
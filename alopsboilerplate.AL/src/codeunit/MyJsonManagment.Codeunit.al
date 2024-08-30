codeunit 50100 "My Json Managment"
{
    procedure ReadJson(JsonText: Text)
    var
        JObject: JsonObject;
        JToken: JsonToken;
    begin
        JObject.ReadFrom(JsonText);
        JObject.Get('Type', JToken);
        case JToken.AsValue().AsText() of
            'Customer':
                CreateCustomer(JObject);
            'Vendor':
                CreateVendor(JObject);
            else
                Error(JToken.AsValue().AsText() + ' is not a vaild type');
        end;
    end;

    local procedure CreateCustomer(JObject: JsonObject)
    var
        Customer: Record Customer;
        JToken: JsonToken;
    begin
        Customer.Insert(true);
        JObject.get('Name', JToken);
        Customer.Validate(Name, JToken.AsValue().AsText());
        Customer.Modify();
    end;

    local procedure CreateVendor(JObject: JsonObject)
    var
        Vendor: Record Vendor;
        JToken: JsonToken;
    begin
        Vendor.Insert(true);
        JObject.get('Name', JToken);
        Vendor.Validate(Name, JToken.AsValue().AsText());
        Vendor.Modify();
    end;
}
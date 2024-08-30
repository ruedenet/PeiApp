table 10048654 "Pei Option"
{
    Caption = 'Pei Option';

    fields
    {
        field(1; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,G/L Account,Item,Resource,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,Resource,"Fixed Asset","Charge (Item)";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if (Type = const(" ")) "Standard Text"
            else
            if (Type = const("G/L Account")) "G/L Account"
            else
            if (Type = const(Item)) Item
            else
            if (Type = const(Resource)) Resource
            else
            if (Type = const("Fixed Asset")) "Fixed Asset"
            else
            if (Type = const("Charge (Item)")) "Item Charge";
        }
        field(3; Group; Text[30])
        {
            Caption = 'Group'; //Ekki nota þennan reit!
            Editable = false;
        }
        field(4; Optional; Boolean)
        {
            Caption = 'Optional';
        }
        field(5; "Default picked"; Boolean)
        {
            Caption = 'Default picked';
        }
        field(6; GroupType; Text[30])
        {
            Caption = 'Group';
        }
    }

    keys
    {
        key(Key1; Type, "No.")
        {
        }
    }

    fieldgroups
    {
    }
}

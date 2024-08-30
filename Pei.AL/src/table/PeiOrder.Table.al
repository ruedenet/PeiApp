table 10048651 "Pei Order"
{
    // version PEI103

    Caption = 'Pei Order';

    fields
    {
        field(1; Id; Integer)
        {
            AutoIncrement = true;
            Caption = 'Id';
        }
        field(2; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Success,Error';
            OptionMembers = Success,Error;
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
        }
        field(4; Time; Time)
        {
            Caption = 'Time';
        }
        field(6; "Order Id"; Text[100])
        {
            Caption = 'Order Id';
        }
        field(7; "Sales Header No."; Code[20])
        {
            Caption = 'Sales Header No.';
            TableRelation = "Sales Header"."No." WHERE("Document Type" = CONST(Invoice));
        }
        field(10; "Sales Inv. Header No."; Code[20])
        {
            Caption = 'Sales Inv. Header No.';
            TableRelation = "Sales Invoice Header"."No.";
        }
        field(11; MerchantId; Integer)
        {
            Caption = 'MerchantId';
        }
        field(20; "Error Message"; Text[250])
        {
            Caption = 'Error Message';
        }
        field(30; Paid; Boolean)
        {
            Caption = 'Paid';
            Editable = false;
        }
        field(40; "Pei Status"; Option)
        {
            Caption = 'Pei Status';
            Editable = true;
            OptionCaption = 'Not sent,Waiting for Confirmation,Confirmed,Cancelled';
            OptionMembers = "Not sent","Waiting for Confirmation",Confirmed,Cancelled;

            // trigger OnValidate()
            // var
            //     PeiEvents: Codeunit 10040288;
            // begin

            //     IF Rec."Pei Status" <> xRec."Pei Status" THEN
            //         PeiEvents.OnAfterOrderStatusChanged(Rec, xRec);
            // end;
        }
        field(41; "Pei Gateway Url"; Text[200])
        {
        }
        field(50; "Pei Payment Method"; Option)
        {
            InitValue = " ";
            OptionMembers = " ",Claims,PaymentCard,CreditCard,DebitCard;
        }

    }

    keys
    {
        key(Key1; Id)
        {
        }
        key(Key2; "Sales Header No.")
        {
        }
        key(Key3; "Order Id")
        {
        }
    }

    fieldgroups
    {
    }
}


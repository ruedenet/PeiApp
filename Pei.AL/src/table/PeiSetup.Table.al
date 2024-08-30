table 10048650 "Pei Setup"
{

    Caption = 'Pei Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; "Base URL"; Text[200])
        {
        }
        field(3; "Authentication URL"; Text[200])
        {
        }
        field(4; ClientId; Text[50])
        {
        }
        field(5; ClientSecret; Text[50])
        {
            ExtendedDatatype = Masked;
        }
        field(6; MerchantId; Integer)
        {
        }
        field(7; "Wait for Confirmation"; Boolean)
        {
            Caption = 'Wait for Confirmation';
        }
        field(8; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method".Code;
        }
        field(9; "Message Text 1"; Text[250])
        {
            Caption = 'Message Text 1';
        }
        field(10; "Message Text 2"; Text[250])
        {
            Caption = 'Message Text 2';
        }
        field(11; "Sales Header Field a [SHa]"; Integer)
        {
            Caption = 'Sales Header Field a [SHa]';
            TableRelation = Field."No." where(TableNo = filter(36));
        }
        field(12; "Sales Header Field a [SHb]"; Integer)
        {
            Caption = 'Sales Header Field b [SHb]';
            TableRelation = Field."No." where(TableNo = filter(36));
        }
        field(15; "Dummy Bank Account"; Code[20])
        {
            Caption = 'Dummy Bank Account';
            TableRelation = "Bank Account"."No.";
        }
        field(16; "Bank Account"; Code[20])
        {
            Caption = 'Bank Account';
            TableRelation = "Bank Account"."No.";
        }
        field(20; "Cost G/L Account"; Code[10])
        {
            Caption = 'Cost G/L Account';
            TableRelation = "G/L Account"."No." where("Account Type" = const(Posting));
        }
        field(30; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Gen. Journal Template";
        }
        field(31; "Gen. Journal Batch"; Code[10])
        {
            Caption = 'Gen. Journal Batch';
            TableRelation = "Gen. Journal Batch";
        }
        field(40; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(50; "Pei Enabled"; Boolean)
        {
            Caption = 'Pei Enabled';
        }
        field(51; "Threshold Amount"; Integer)
        {
            Caption = 'Threshold Amount';
        }
        field(52; "Standard Text"; Text[50])
        {
            Caption = 'Standard Text';
        }
        field(55; "Post Invoices When Paid"; Boolean)
        {
            Caption = 'Post Invoices When Paid with Pei';
        }
        field(60; "Customer SSN Field"; Integer)
        {
            Caption = 'Customer SSN Field';
            TableRelation = Field."No." where(TableNo = filter(18));
        }
        field(61; "Customer Phone Field"; Integer)
        {
            Caption = 'Customer Phonenumber Field';
            TableRelation = Field."No." where(TableNo = filter(18));
        }
        field(65; "No. Series Filter"; Text[100])
        {
            Caption = 'No. Series Filter';
        }
        field(66; "Paying Customer"; Option)
        {
            Caption = 'Paying Customer';
            OptionCaption = 'Bill-to Customer,Sell-to Customer';
            OptionMembers = "Bill-to Customer","Sell-to Customer";
        }
        field(67; "Combined Item Description"; Text[50])
        {
            Caption = 'Combined Item Description';
        }
        field(75; "Pei Customer"; Code[20])
        {
            Caption = 'Pei Customer';
            TableRelation = Customer."No.";
        }
        field(150; "Check Order Status Interval"; Decimal)
        {
            Caption = 'Check Order Status Interval';
        }
        field(151; "Process P. Sales Inv. Interval"; Decimal)
        {
            Caption = 'Process P. Sales Inv. Interval';
        }
        field(152; "Process Sales Inv. Interval"; Decimal)
        {
        }
        field(153; "Get Settlements Interval"; Decimal)
        {
        }
        field(154; "Post Conf. Invoices Interval"; Decimal)
        {
        }
        field(155; "Booking Proccess Type"; Option)
        {
            Caption = 'What type of booking';
            OptionCaption = 'Use Social Number,Use Dummy Account';
            OptionMembers = "UseSocialNumber","UseDummyAccount";
        }
        field(156; "Pei Debit Customer"; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(157; "Pei Credit Customer"; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(180; "Cash Payment Method Code"; Code[10])
        {
            Caption = 'Cash Payment Method Code';
            TableRelation = "Payment Method".Code;
        }
        field(181; "Claim Payment Method Code"; Code[10])
        {
            Caption = 'Claim Payment Method Code';
            TableRelation = "Payment Method".Code;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        PaymentMethod: Record "Payment Method";
    begin

        PaymentMethod.SetRange(Code, 'PEI');
        if not PaymentMethod.FindSet() then begin
            PaymentMethod.Init();
            PaymentMethod.Validate(Code, 'PEI');
            PaymentMethod.Validate(Description, 'Pei');
            PaymentMethod.Validate("Bal. Account Type", PaymentMethod."Bal. Account Type"::"G/L Account");

            PaymentMethod.Insert(true);

        end;
        "Customer SSN Field" := 1;
        "Customer Phone Field" := 9;
    end;

    trigger OnModify()
    var
        PaymentMethod: Record "Payment Method";
        PeiSetup: Record "Pei Setup";
    begin

        PaymentMethod.SetRange(Code, 'PEI');
        if PaymentMethod.FindSet() then begin
            if Rec."Booking Proccess Type" = Rec."Booking Proccess Type"::UseDummyAccount then begin
                PaymentMethod.Validate("Bal. Account Type", PaymentMethod."Bal. Account Type"::"Bank Account");
                PaymentMethod.Validate("Bal. Account No.", PeiSetup."Dummy Bank Account");
                if rec."Dummy Bank Account" = '' then
                    Error('Dummy Bank Account cannot be empty');
                if rec."Bank Account" = '' then
                    Error('Bank Account cannot be empty');
                if rec."Cost G/L Account" = '' then
                    Error('Cost G/L Account cannot be empty');
            end;

            PaymentMethod.Modify(true);

        end;

    end;
}


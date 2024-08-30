table 10048653 "Pei Settlement Transaction"
{
    Caption = 'Pei Settlement Transaction';
    // version PEI103

    fields
    {
        field(1; "Settlement No."; Text[10])
        {
            Caption = 'Settlement No.';
        }
        field(2; "Merchant ID"; Integer)
        {
            Caption = 'Merchant ID';
        }
        field(3; "Settlement Date"; Text[30])
        {
            Caption = 'Settlement Date';
        }
        field(4; Account; Text[30])
        {
            Caption = 'Account';
        }
        field(5; "Payment Method"; Integer)
        {
            Caption = 'Payment Method';
        }
        field(6; "Kaup ID"; Integer)
        {
            Caption = 'Kaup ID';
        }
        field(7; "Order ID"; Text[100])
        {
            Caption = 'Order ID';
        }
        field(8; "Payment Number"; Text[100])
        {
            Caption = 'Payment Number';
        }
        field(9; "Due Date"; Text[30])
        {
            Caption = 'Due Date';
        }
        field(10; "Final Due Date"; Text[30])
        {
            Caption = 'Final Due Date';
        }
        field(11; BuyerSSN; Text[20])
        {
            Caption = 'BuyerSSN';
        }
        field(12; "Bill Number"; Text[100])
        {
            Caption = 'Bill Number';
        }
        field(13; "Payment Date"; Text[30])
        {
            Caption = 'Payment Date';
        }
        field(14; Principal; Integer)
        {
            Caption = 'Principal';
        }
        field(15; "Cancelled Amount"; Decimal)
        {
            Caption = 'Cancelled Amount';
        }
        field(16; Interest; Decimal)
        {
            Caption = 'Interest';
        }
        field(17; Discount; Integer)
        {
            Caption = 'Discount';
        }
        field(18; "Capital Income Tax"; Decimal)
        {
            Caption = 'Capital Income Tax';
        }
        field(19; "Deposit Amount"; Decimal)
        {
            Caption = 'Deposit Amount';
        }
        field(20; "Even Transaction"; Boolean)
        {
            InitValue = false;
            Caption = 'Even Transaction';
        }
        field(21; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(22; Reference; Text[30])
        {
            Caption = 'Reference';
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}

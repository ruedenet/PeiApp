table 92003 "Pei Reminder Message"
{
    Caption = 'Pei Reminder Message';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Id; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Message Text 1"; Text[250])
        {
            Caption = 'Message Text 1';
            DataClassification = CustomerContent;
        }
        field(3; "Message Text 2"; Text[250])
        {
            Caption = 'Message Text 2';
            DataClassification = CustomerContent;
        }
        field(4; "Sales Header Field a [SHa]"; Integer)
        {
            Caption = 'Sales Header Field a [SHa]';
            DataClassification = CustomerContent;
            TableRelation = Field."No." WHERE(TableNo = FILTER(36));
        }
        field(5; "Sales Header Field a [SHb]"; Integer)
        {
            Caption = 'Sales Header Field a [SHb]';
            DataClassification = CustomerContent;
            TableRelation = Field."No." WHERE(TableNo = FILTER(36));
        }
        field(6; "Days til reminder"; Integer)
        {
            Caption = 'Days til reminder ';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Id")
        {
            Clustered = true;
        }
    }
}

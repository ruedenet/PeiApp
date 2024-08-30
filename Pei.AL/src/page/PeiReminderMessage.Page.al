page 92005 "Pei Reminder Message"
{
    ApplicationArea = All;
    Caption = 'Pei Reminder Message';
    PageType = ListPart;
    SourceTable = "Pei Reminder Message";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Days til reminder"; Rec."Days til reminder")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Days til reminder  field.';
                }
                field("Message Text 1"; Rec."Message Text 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Message Text 1 field.';
                }
                field("Message Text 2"; Rec."Message Text 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Message Text 2 field.';
                }
                field("Sales Header Field a [SHa]"; Rec."Sales Header Field a [SHa]")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Header Field a [SHa] field.';
                }
                field("Sales Header Field a [SHb]"; Rec."Sales Header Field a [SHb]")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Header Field a [SHb] field.';
                }
            }
        }
    }
}

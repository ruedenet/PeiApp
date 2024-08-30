page 92003 "Pei Options"
{
    PageType = List;
    SourceTable = "Pei Option";
    UsageCategory = Documents;
    ApplicationArea = All;
    Caption = 'Pei Options';

    layout
    {
        area(Content)
        {
            repeater(group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                }
                field(GroupType; Rec.GroupType)
                {
                    ApplicationArea = All;
                }
                field(Optional; Rec.Optional)
                {
                    ApplicationArea = All;
                }
                field("Default Picked"; Rec."Default picked")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
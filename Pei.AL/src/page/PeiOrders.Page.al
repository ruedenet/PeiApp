page 92001 "Pei Orders"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Pei Order";
    UsageCategory = Documents;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Id; Rec.Id)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field("Order Id"; Rec."Order Id")
                {
                    ApplicationArea = All;
                }
                field("Sales Header No"; Rec."Sales Header No.")
                {
                    ApplicationArea = All;
                }
                field("Sales Inv. Header No"; Rec."Sales Inv. Header No.")
                {
                    ApplicationArea = All;
                }
                field(MerchantId; Rec.MerchantId)
                {
                    ApplicationArea = All;
                }
                field("Error Message"; Rec."Error Message")
                {
                    ApplicationArea = All;
                }
                field(Paid; Rec.Paid)
                {
                    ApplicationArea = All;
                }
                field("Pei Status"; Rec."Pei Status")
                {
                    ApplicationArea = All;
                }
                field("Pei Payment Method"; Rec."Pei Payment Method")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}


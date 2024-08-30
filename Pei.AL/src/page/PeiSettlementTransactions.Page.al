page 10048653 "Pei Settlement Transactions"
{
    // version PEI100

    PageType = ListPart;
    SourceTable = "Pei Settlement Transaction";
    UsageCategory = Documents;
    SourceTableView = where("Even Transaction" = const(false));
    ApplicationArea = All;
    Caption = 'Pei Settlement Transactions';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Settlement No."; Rec."Settlement No.")
                {
                    ApplicationArea = All;
                }
                field("Merchant ID"; Rec."Merchant ID")
                {
                    ApplicationArea = All;
                }
                field("Settlement Date"; Rec."Settlement Date")
                {
                    ApplicationArea = All;
                }
                field(Account; Rec.Account)
                {
                    ApplicationArea = All;
                }
                field("Payment Method"; Rec."Payment Method")
                {
                    ApplicationArea = All;
                }
                field("Kaup ID"; Rec."Kaup ID")
                {
                    ApplicationArea = All;
                }
                field("Order ID"; Rec."Order ID")
                {
                    ApplicationArea = All;
                }
                field("Payment Number"; Rec."Payment Number")
                {
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                }
                field("Final Due Date"; Rec."Final Due Date")
                {
                    ApplicationArea = All;
                }
                field(BuyerSSN; Rec.BuyerSSN)
                {
                    ApplicationArea = All;
                }
                field("Bill Number"; Rec."Bill Number")
                {
                    ApplicationArea = All;
                }
                field("Payment Date"; Rec."Payment Date")
                {
                    ApplicationArea = All;
                }
                field(Principal; Rec.Principal)
                {
                    ApplicationArea = All;
                }
                field("Cancelled Amount"; Rec."Cancelled Amount")
                {
                    ApplicationArea = All;
                }
                field(Interest; Rec.Interest)
                {
                    ApplicationArea = All;
                }
                field(Discount; Rec.Discount)
                {
                    ApplicationArea = All;
                }
                field("Capital Income Tax"; Rec."Capital Income Tax")
                {
                    ApplicationArea = All;
                }
                field("Deposit Amount"; Rec."Deposit Amount")
                {
                    ApplicationArea = All;
                }
                field("Even Transaction"; Rec."Even Transaction")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

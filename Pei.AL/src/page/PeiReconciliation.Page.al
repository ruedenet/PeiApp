page 92002 "Pei Reconciliation"
{
    ApplicationArea = All;
    // version PEI100

    PageType = List;
    SourceTable = "Bank Account Ledger Entry";
    SourceTableView = where("Even Transaction" = const(false));
    UsageCategory = Documents;
    Caption = 'Pei Reconciliation';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                Caption = 'Group';
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = All;
                }
                field(Open; Rec.Open)
                {
                    ApplicationArea = All;
                }
                field("Even Transaction"; Rec."Even Transaction")
                {
                    ApplicationArea = All;
                }
            }
            fixed(Group2)
            {
                Caption = 'Group2';
                part(Transactions; "Pei Settlement Transactions")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Pei)
            {
                Caption = 'Pei';
                Image = Post;
            }
            action(EvenTransactions)
            {
                Caption = 'Even Transaction';
                Image = Process;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Even Transaction action.';
                Visible = isHidden;
                ApplicationArea = All;

                trigger OnAction()
                var
                    PeiModule: Codeunit "Pei Module Utility";
                begin
                    PeiModule.EvenTransactions(Rec);
                end;
            }
        }
    }
    var
        isHidden: Boolean;

    trigger OnOpenPage()
    var
        PeiSetup: Record "Pei Setup";
    begin
        if (not PeiSetup.Get()) or (not PeiSetup."Pei Enabled") then
            Error('Pei Setup not enabled');
        if PeiSetup."Booking Proccess Type" = PeiSetup."Booking Proccess Type"::UseDummyAccount then begin
            Rec.SetRange("Bank Account No.", PeiSetup."Dummy Bank Account");
            isHidden := false;
        end else begin
            isHidden := true;
            Error('This page is not needed for this type of booking');
        end;
        Rec.FindSet();
    end;
}

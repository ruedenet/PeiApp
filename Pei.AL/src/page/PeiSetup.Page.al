page 10048650 "Pei Setup"
{
    // version PEI100
    UsageCategory = Administration;
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Pei Setup";
    Caption = 'Pei Setup';

    layout
    {
        area(Content)
        {
            group("Booking Type")
            {
                field("Booking Proccess Type"; Rec."Booking Proccess Type")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                    begin

                        if Rec."Booking Proccess Type" = Rec."Booking Proccess Type"::UseDummyAccount then begin

                            hideDummy := true;
                            hideBilling := false;
                        end else begin
                            hideDummy := false;
                            hideBilling := true;
                        end;
                    end;
                }
            }
            group(General)
            {
                Caption = 'General';
                field("Pei Enabled"; Rec."Pei Enabled")
                {
                    ApplicationArea = All;
                }
                field("Threshold Amount"; Rec."Threshold Amount")
                {
                    ApplicationArea = All;
                }
                field("Standar text"; Rec."Standard Text")
                {
                    ApplicationArea = All;
                }
                field("Base URL"; Rec."Base URL")
                {
                    ApplicationArea = All;
                }
                field("Authentication URL"; Rec."Authentication URL")
                {
                    ApplicationArea = All;
                }
                field("Wait for Confirmation"; Rec."Wait for Confirmation")
                {
                    ApplicationArea = All;
                }
                field("Post Invoices When Paid"; Rec."Post Invoices When Paid")
                {
                    ApplicationArea = All;
                }
                field(ClientId; Rec.ClientId)
                {
                    ApplicationArea = All;
                }
                field(ClientSecret; Rec.ClientSecret)
                {
                    ApplicationArea = All;
                    ExtendedDatatype = Masked;
                }
                field("Customer SSN Field"; Rec."Customer SSN Field")
                {
                    ApplicationArea = All;
                }
                field("Customer Phone Field"; Rec."Customer Phone Field")
                {
                    ApplicationArea = All;
                }
                field("Paying Customer"; Rec."Paying Customer")
                {
                    ApplicationArea = All;
                    Enabled = hideBilling;
                }
                field("Combined Item Description"; Rec."Combined Item Description")
                {
                    ApplicationArea = All;
                }
                // field("Pei Customer"; "Pei Customer")
                // {
                //     Enabled = hideBilling;
                // ApplicationArea = All;
                // }
                // field("Pei Debit Customer"; "Pei Debit Customer")
                // {
                //     Enabled = hideBilling;
                // ApplicationArea = All;
                // }
                // field("Pei Credit Customer"; "Pei Credit Customer")
                // {
                //     Enabled = hideBilling;
                // ApplicationArea = All;
                // }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Message Text 1"; Rec."Message Text 1")
                {
                    ApplicationArea = All;
                }
                field("Message Text 2"; Rec."Message Text 2")
                {
                    ApplicationArea = All;
                }
                field("Sales Header Field a [SHa]"; Rec."Sales Header Field a [SHa]")
                {
                    ApplicationArea = All;
                }
                field("Sales Header Field a [SHb]"; Rec."Sales Header Field a [SHb]")
                {
                    ApplicationArea = All;
                }
            }
            group(Reminders)
            {
                part(PeiReminderMessage; "Pei Reminder Message")
                {
                    ApplicationArea = All;
                }
            }
            group(Posting)
            {
                Caption = 'Posting';
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = All;
                }
                field("Claim Payment Method Code"; Rec."Claim Payment Method Code")
                {
                    ApplicationArea = All;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                }
                field("No. Series Filter"; Rec."No. Series Filter")
                {
                    ApplicationArea = All;
                }
                field("Gen. Journal Batch"; Rec."Gen. Journal Batch")
                {
                    ApplicationArea = All;
                    Enabled = hideDummy;
                }
                field("Journal Template Name"; Rec."Journal Template Name")
                {
                    ApplicationArea = All;
                    Enabled = hideDummy;
                }
                field("Cost G/L Account"; Rec."Cost G/L Account")
                {
                    ApplicationArea = All;
                    Enabled = hideDummy;
                }
                field("Bank Account"; Rec."Bank Account")
                {
                    ApplicationArea = All;
                    Enabled = hideDummy;
                }
                field("Dummy Bank Account"; Rec."Dummy Bank Account")
                {
                    ApplicationArea = All;
                    Enabled = hideDummy;
                }
                field("Cash Payment Method Code"; Rec."Cash Payment Method Code")
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
            action("Pei valkvæm gildi")
            {
                Caption = 'Pei Options';
                Image = Process;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = page "Pei Options";
            }
            action("Pei pantanir")
            {
                Caption = 'Pei Orders';
                Promoted = true;
                PromotedIsBig = true;
                RunObject = page "Pei Orders";
            }
            action("Pei uppgjör")
            {
                Caption = 'Pei Reconciliation';
                Promoted = true;
                PromotedIsBig = true;
                RunObject = page "Pei Reconciliation";
            }
        }
    }
    var
        hideDummy: Boolean;
        hideBilling: Boolean;

    trigger OnOpenPage()
    var
        PaymentMethod: Record "Payment Method";
        PeiSetup: Record "Pei Setup";

    begin
        PaymentMethod.SetRange(Code, 'PEI');

        hideDummy := false;
        hideBilling := false;
        if PeiSetup.FindLast() then
            case PeiSetup."Booking Proccess Type" of
                PeiSetup."Booking Proccess Type"::UseDummyAccount:
                    hideDummy := true;
                PeiSetup."Booking Proccess Type"::UseSocialNumber:
                    hideBilling := true;
                else
                    hideDummy := true;
                    hideBilling := true;
            end;
    end;
}

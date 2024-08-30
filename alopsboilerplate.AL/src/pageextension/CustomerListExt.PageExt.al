pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addlast(processing)
        {
            action(BlockUnblock)
            {
                ApplicationArea = All;
                Caption = 'Block/Unblock Customer';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = CloseDocument;

                trigger OnAction()
                var

                begin
                    Message('test');
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetFilter(Blocked, '<>%1', Rec.Blocked::All);
    end;
}

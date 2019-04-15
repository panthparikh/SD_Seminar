page 50141 "CSD My Seminars"
{
    Caption = 'My Seminars';
    PageType = ListPart;
    SourceTable = "CSD My Seminars";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Seminar No."; "Seminar No.")
                {

                }
                field(Name; Seminar.Name)
                {

                }
                field(Duration; "Seminar No.")
                {

                }
                field(Price; Seminar."Seminar Price")
                {

                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Open)
            {
                trigger OnAction();
                begin
                    OpenSeminarCard;
                end;
            }
        }
    }
    var
        Seminar: Record "CSD Seminar";

    trigger OnOpenPage();
    begin
        SetRange("User Id", UserId);
    end;

    trigger OnAfterGetRecord();
    begin
        if Seminar.Get("Seminar No.") then;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        Clear(Seminar);
    end;

    local procedure OpenSeminarCard();
    begin
        if Seminar."No." <> '' then
            Page.Run(Page::"CSD Seminar Card", Seminar);
    end;
}
page 50104 "CSD Seminar Manager Activities"
{
    Caption = 'Seminar Manager Activities';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Cue";
    Editable = false;

    layout
    {
        area(Content)
        {
            cuegroup(Registrations)
            {
                field(Planned; Planned)
                {
                    ApplicationArea = All;
                }
                field(Registered; Registered)
                {
                    ApplicationArea = All;
                }

                actions
                {
                    action(New)
                    {
                        Caption = 'New';
                        RunObject = page "Seminar Registration";
                        RunPageMode = Create;
                    }

                }
            }
            Cuegroup("For Posting")
            {
                field(Closed; Closed)
                {

                }

            }
        }
    }

    trigger OnOpenPage()
    begin
        if not get then begin
            Init();
            Insert();
        end;
    end;
}
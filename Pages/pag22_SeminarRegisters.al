page 50122 "CSD Seminar Registers"
// CSD1.0 2019-04-09 D.E.Veloper
// Chapter 7 - Lab 2-11
{
    Caption = 'Seminar Registers';
    PageType = List;
    Editable = false;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seminar Register";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; "No.")
                {

                }
                field("Creation Date"; "Creation Date")
                {

                }
                field("User ID"; "User ID")
                {

                }
                field("Source Code"; "Source Code")
                {

                }
                field("Journal Batch Name"; "Journal Batch Name")
                {

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Navigation)
        {
            action("Seminar Ledgers")
            {
                Image = WarrantyLedger;
                RunObject = codeunit "CSD SeminarRegShowLedger";
            }
        }
    }
}
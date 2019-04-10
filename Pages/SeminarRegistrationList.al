page 50130 "Seminar Registration List"
{
    // CSD1.00 - 2019-04-10 - D. E. Veloper
    //   Chapter 7 - Lab 4-8

    Caption = 'Seminar Registration List';
    CardPageID = "Seminar Registration";
    Editable = false;
    PageType = List;
    SourceTable = "Seminar Registration Header";
    UsageCategory = lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                }
                field("Starting Date"; "Starting Date")
                {
                }
                field("Seminar No."; "Seminar No.")
                {
                }
                field("Seminar Name"; "Seminar Name")
                {
                }
                field(Status; Status)
                {
                }
                field(Duration; Duration)
                {
                }
                field("Maximum Participants"; "Maximum Participants")
                {
                }
                field("Room Resource Code"; "Room Resource Code")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart("Links"; Links)
            {
            }
            systempart("Notes"; Notes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Seminar Registration")
            {
                Caption = '&Seminar Registration';
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = Page 50106;
                    RunPageLink = "No." = Field ("No.");
                    RunPageView = where ("Table Name" = const ("Seminar Registration Header"));
                }
                action("&Charges")
                {
                    Caption = '&Charges';
                    Image = Costs;
                    RunObject = Page 50127;
                    RunPageLink = "Document No." = Field ("No.");
                }

                action("&Post")
                {
                    Caption = '&Post';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    ShortcutKey = F9;
                    RunObject = codeunit "Seminar-Post (Yes/No)";
                }
            }
        }
    }
}


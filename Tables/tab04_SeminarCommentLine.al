table 50104 "CSD Seminar Comment Line"
// CSD1.00 - 2019-04-09 - D.E.Veloper
// Chapter 5 - Lab 2-1
// Chapter 7 - Lab 3-2

{
    Caption = 'Seminar Comment Line';
    LookupPageId = "CSD Seminar Comment List";
    DrillDownPageId = "CSD Seminar Comment List";

    fields
    {
        field(10; "Table Name"; Option)
        {
            Caption = 'Table Name';
            OptionMembers = "Seminar","Seminar Registration Header","Posted Seminar Reg. Header";
            OptionCaption = 'Seminar, Seminar Registration, Posted Seminar Registration';

        }
        field(20; "Document Line No"; Integer)
        {
            Caption = 'Document Line No.';

        }

        field(30; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if ("Table Name" = CONST (Seminar))
                                "CSD Seminar"
            else
            if ("Table Name" = const ("Seminar Registration Header"))
                            "Seminar Registration Header"
            else
            if ("Table Name" = const ("Posted Seminar Reg. Header"))
                            "CSD Posted Seminar Reg. Header";
        }
        field(40; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(50; Date; Date)
        {
            Caption = 'Date';
        }
        field(60; Code; Code[10])
        {
            Caption = 'Code';
        }
        field(70; Comment; Text[80])
        {
            Caption = 'Comment';
        }

    }

    keys
    {
        key(PK; "Table Name", "Document Line No", "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
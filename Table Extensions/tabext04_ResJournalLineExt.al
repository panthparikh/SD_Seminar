tableextension 50104 "CSD ResJournalLineExt" extends "Res. Journal Line"
// CSD1.00 - 2019-04-10 - D.E.Veloper
// Chapter 7 - Lab 4-2
{
    fields
    {
        field(50100; "CSD Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            TableRelation = "CSD Seminar";
        }
        field(50101; "CSD Seminar Registration No."; Code[20])
        {
            Caption = 'Seminar Registration No.';
            TableRelation = "Seminar Registration Header";
        }
    }

    var
        myInt: Integer;
}
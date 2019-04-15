table 50141 "CSD My Seminars"
// CSD1.00 - 2019-04-15 - D.E.Veloper
// Chapter 10 - Lab 1-3
// - created new page
{
    Caption = 'My Seminar';
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "User Id"; Code[50])
        {
            Caption = 'User Id';
            TableRelation = User;
            DataClassification = ToBeClassified;
        }

        field(20; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            TableRelation = "CSD Seminar";
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "User Id", "Seminar No.")
        {
            Clustered = true;
        }
    }
}
codeunit 50131 "CSD Seminar Jnl.-CheckLine"
// CSD1.00 = 2019-04-08 - D.E.Veloper
//Chapter 7 - Lab 2-1
{
    TableNo = "Seminar Journal Line";
    trigger OnRun()
    begin
        RunCheck(Rec);

    end;

    var
        GlSetup: Record "General Ledger Setup";
        UserSetup: Record "User Setup";
        AllowPostingForm: Date;
        AllowPostingTo: Date;
        ClosingDateTxt: Label 'cannot be a closing date.';
        PostingDateTxt: label 'is not within your range of allowed posting dates.';

    procedure RunCheck(var SemJnLine: Record "Seminar Journal Line")
    var
        myInt: Integer;
    begin
        with SemJnLine do begin
            if EmptyLine then
                exit;
            TestField("Posting Date");
            TestField("Instructor Resource No.");
            TestField("Seminar No.");
            case "Charge Type" of
                "Charge Type"::Instructor:
                    TestField("Instructor Resource No.");
                "Charge Type"::Room:
                    TestField("Room Resource No.");
                "Charge Type"::Participant:
                    TestField("Participant Contact No.");
            end;

            if Chargeable then
                TestField("Bill-to Customer No.");

            if "Posting Date" = ClosingDate("Posting Date") then
                FieldError("Posting Date", ClosingDateTxt);

            if (AllowPostingForm = 0D) and (AllowPostingTo = 0D) then begin
                if UserId <> '' then
                    if UserSetup.Get(UserId) then begin
                        AllowPostingForm := UserSetup."Allow Posting From";
                        AllowPostingTo := UserSetup."Allow Posting To";
                    end;

                if (AllowPostingForm = 0D) and (AllowPostingTo = 0D)
                then begin
                    GlSetup.Get;
                    AllowPostingForm := GlSetup."Allow Posting From";
                    AllowPostingTo := GlSetup."Allow Posting To";
                end;

                if AllowPostingTo = 0D then
                    AllowPostingTo := DMY2Date(31, 12, 9999);
            end;

            if ("Posting Date" < AllowPostingForm) OR ("Posting Date" > AllowPostingTo) then
                FieldError("Posting Date", PostingDateTxt);

            if ("Document Date" <> 0D) then
                if ("Document Date" = ClosingDate("Document Date")) then
                    FieldError("Document Date", PostingDateTxt);

        end;

    end;

}
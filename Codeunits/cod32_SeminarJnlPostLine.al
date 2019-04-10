codeunit 50132 "CSD Seminar Jnl.-PostLine"
// CSD1.00 - 2019-04-09 D.E.Veloper
// Chapter 7 - Lab 2-8
{
    TableNo = "Seminar Journal Line";
    trigger OnRun()
    begin

    end;

    var
        SeminarJnlLine: Record "Seminar Journal Line";
        SeminarLedgerEntry: Record "Seminar Ledger Entry";
        SeminarRegister: Record "Seminar Register";
        SeminarJnlCheckLine: Codeunit "CSD Seminar Jnl.-CheckLine";
        NextEntryNo: Integer;

    procedure RunWithCheck(var SeminarJnlLine2: Record "Seminar Journal Line")
    var
        myInt: Integer;
    begin
        with SeminarJnlLine2 do begin
            SeminarJnlLine := SeminarJnlLine2;
            Code();
            SeminarJnlLine2 := SeminarJnlLine;
        end;

    end;

    local procedure Code()
    var
        myInt: Integer;
    begin
        with SeminarJnlLine do begin
            if NextEntryNo = 0 then begin
                SeminarLedgerEntry.LockTable;
                if SeminarLedgerEntry.FindLast then
                    NextEntryNo := SeminarLedgerEntry."Entry No.";
                NextEntryNo := NextEntryNo + 1;

                if SeminarRegister."No." = 0 then begin
                    SeminarRegister.LockTable;
                    if (not SeminarRegister.FindLast) or (SeminarRegister."To Entry No." <> 0) then begin
                        SeminarRegister.INIT;
                        SeminarRegister."No." := SeminarRegister."No." + 1;
                        SeminarRegister."From Entry No." := NextEntryNo;
                        SeminarRegister."To Entry No." := NextEntryNo;
                        SeminarRegister."Creation Date" := Today;
                        SeminarRegister."Source Code" := "Source Code";
                        SeminarRegister."Journal Batch Name" := "Journal Batch Name";
                        SeminarRegister."User ID" := UserId;
                        SeminarRegister.Insert;
                    end;
                    SeminarRegister."To Entry No." := NextEntryNo;
                    SeminarRegister.Modify;

                    SeminarLedgerEntry.Init;
                    SeminarLedgerEntry."Seminar No." := "Seminar No.";
                    SeminarLedgerEntry."Posting Date" := "Posting Date";
                    SeminarLedgerEntry."Document Date" := "Document Date";
                    SeminarLedgerEntry."Entry Type" := "Entry Type";
                    SeminarLedgerEntry."Document No." := "Document No.";
                    SeminarLedgerEntry.Description := Description;
                    SeminarLedgerEntry."Bill-to Customer No." := "Bill-to Customer No.";
                    SeminarLedgerEntry."Charge Type" := "Charge Type";
                    SeminarLedgerEntry.Type := Type;
                    SeminarLedgerEntry.Quantity := Quantity;
                    SeminarLedgerEntry."Unit Price" := "Unit Price";
                    SeminarLedgerEntry."Total Price" := "Total Price";
                    SeminarLedgerEntry."Participant Contact No." := "Participant Contact No.";
                    SeminarLedgerEntry."Participant Name" := "Participant Name";
                    SeminarLedgerEntry.Chargeable := Chargeable;
                    SeminarLedgerEntry."Room Resource No." := "Room Resource No.";
                    SeminarLedgerEntry."Instructor Resource No." := "Instructor Resource No.";
                    SeminarLedgerEntry."Starting Date" := "Starting Date";
                    SeminarLedgerEntry."Seminar Registration No." := "Seminar Registration No.";
                    SeminarLedgerEntry."Res. Ledger Entry No." := "Res. Ledger Entry No.";
                    SeminarLedgerEntry."Source Type" := "Source Type";
                    SeminarLedgerEntry."Source No." := "Source No.";
                    SeminarLedgerEntry."Journal Batch Name" := "Journal Batch Name";
                    SeminarLedgerEntry."Source Code" := "Source Code";
                    SeminarLedgerEntry."Reason Code" := "Reason Code";
                    SeminarLedgerEntry."Posting No. Series" := "Posting No. Series";
                    SeminarLedgerEntry."Entry No." := NextEntryNo;
                    NextEntryNo += 1;
                    SeminarLedgerEntry.Insert;

                end;
            end;

        end;
    end;
}
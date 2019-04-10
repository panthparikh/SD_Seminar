codeunit 50134 "CSD SeminarRegShowLedger"
// CSD1.0 2019-04-09 D.E.Veloper
// Chapter 7 - Lab 2-10
{
    TableNo = "Seminar Register";
    trigger OnRun()
    begin
        SeminarLedgerEntry.SetRange("Entry No.", "From Entry No.", "To Entry No.");
        Page.Run(Page::"CSD Seminar Ledger Entry", SeminarLedgerEntry);

    end;

    var
        SeminarLedgerEntry: Record "Seminar Ledger Entry";
}
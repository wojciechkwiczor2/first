codeunit 72055003 "Ex. Jnl.-Post Line Rasmus"
{
  TableNo=72050013;

  trigger OnRun();
  begin
    RunWithCheck(Rec);
  end;

  var
    NextEntryNo : Integer;

  PROCEDURE RunWithCheck(VAR ExJnlLine2 : Record 72050013);
  begin
    ExJnlLine.COPY(ExJnlLine2);
    Code;
    ExJnlLine2 := ExJnlLine;
  end;

  LOCAL PROCEDURE "Code"();
  var
    ExJnlLine : Record 72050013;
    ExLedgEntry : Record 72050011;
    ExJnlCheckLine : Codeunit 72050002;
  begin
    IF ExJnlLine.EmptyLine THEN
      EXIT;    
    ExJnlCheckLine.RunCheck(ExJnlLine);
    GetNextLedgerEntryNo;
    InsertExampleRegisterEntry(ExJnlLine);
    InsertExampleLedgerEntry(ExJnlLine);
  end;

  local procedure GetNextLedgerEntryNo();
  var
  begin
    IF NextEntryNo = 0 THEN BEGIN
      ExLedgEntry.LOCKTABLE;
      IF ExLedgEntry.FINDLAST THEN
        NextEntryNo := ExLedgEntry."Entry No.";
    END;
    NextEntryNo := NextEntryNo + 1;
  end;

  local procedure InsertExampleRegisterEntry(ExJnlLine : Record 72050013);
  var
    ExReg : Record 72050015;
  begin
    IF ExReg."No." = 0 THEN BEGIN
      ExReg.LOCKTABLE;
      IF (NOT ExReg.FINDLAST) OR (ExReg."To Entry No." <> 0) THEN BEGIN
        ExReg.INIT;
        ExReg."No." := ExReg."No." + 1;
        ExReg."From Entry No." := NextEntryNo;
        ExReg."To Entry No." := NextEntryNo;
        ExReg."Creation Date" := TODAY;
        ExReg."Source Code" := ExJnlLine."Source Code";
        ExReg."Journal Batch Name" := ExJnlLine."Journal Batch Name";
        ExReg."User ID" := USERID;
        ExReg.INSERT;
      END;
    END;
    ExReg."To Entry No." := NextEntryNo;
    ExReg.MODIFY;
  end;


  local procedure PopulateAndInsertExampleLedgerEntry(ExJnlLine : Record 72050013);
  var
  begin  
    with ExJnlLine do begin
      IF "Document Date" = 0D THEN
        "Document Date" := "Posting Date";

      IF "Entry Type" = "Entry Type"::Sale then
        Quantity := -Quantity;

      ExLedgEntry.INIT;
      ExLedgEntry."Entry No." := NextEntryNo;
      ExLedgEntry."User ID" := USERID;
      ExLedgEntry."Entry Type" := "Entry Type";
      ExLedgEntry."Document No." := "Document No.";
      ExLedgEntry."Posting Date" := "Posting Date";
      ExLedgEntry."Document Date" := "Document Date";
      ExLedgEntry."Example Person No." := "Example Person No.";
      ExLedgEntry."Example Product No." := "Example Product No.";
      ExLedgEntry.Description := Description;
      ExLedgEntry.Quantity := Quantity;
      ExLedgEntry."Global Dimension 1 Code" := "Shortcut Dimension 1 Code";
      ExLedgEntry."Global Dimension 2 Code" := "Shortcut Dimension 2 Code";
      ExLedgEntry."Dimension Set ID" := "Dimension Set ID";
      ExLedgEntry."Source Code" := "Source Code";
      ExLedgEntry."Journal Batch Name" := "Journal Batch Name";
      ExLedgEntry."Reason Code" := "Reason Code";
      ExLedgEntry."Gen. Bus. Posting Group" := "Gen. Bus. Posting Group";
      ExLedgEntry."Gen. Prod. Posting Group" := "Gen. Prod. Posting Group";
      ExLedgEntry."No. Series" := "Posting No. Series";
      ExLedgEntry.INSERT;
    end;
  end;
}


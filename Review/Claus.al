codeunit 72051003 "Ex. Jnl.-Post Line Claus"
{
  // version Exercise 3

  TableNo=72050013;

  trigger OnRun();
  begin
    //GetGLSetup;
    RunWithCheck(Rec);
  end;

  var
    ExJnlLine : Record 72050013;
    ExLedgEntry : Record 72050011;
    ExReg : Record 72050015;
    NextEntryNo : Integer;
    GLSetupRead : Boolean;

  PROCEDURE GetExReg(VAR NewExReg : Record 72050015);
  begin
    NewExReg := ExReg;
  end;

  PROCEDURE RunWithCheck(VAR ExJnlLine2 : Record 72050013);
  begin
    ExJnlLine.COPY(ExJnlLine2);
    Code;
    ExJnlLine2 := ExJnlLine;
  end;

  LOCAL PROCEDURE "Code"();
  begin
    WITH ExJnlLine DO BEGIN
      IF EmptyLine THEN
        EXIT;

      CheckJournalLine;
      LockExLedgerEntryAndFindNextEntryNoIfNextEntryNoIsZero;
      SetDocumentDateEqualPostingDateIfDocumentDateisBlank;
      CreateExRegisterIfNotAlreadyCreated;
      UpdateRegister;
      InitAndUpdateResourceLedgerEntry;
      InsertExampleLedgerEntry;
      UpdateNextEntryNo;
    END;
  end;

  Local procedure CheckJournalLine();
  var
      ExJnlCheckLine : Codeunit 72050002;
  begin
    ExJnlCheckLine.RunCheck(ExJnlLine);
  end;
    
  local procedure LockExLedgerEntryAndFindNextEntryNoIfNextEntryNoIsZero();
  begin
    IF NextEntryNo = 0 THEN BEGIN
      ExLedgEntry.LOCKTABLE;
      IF ExLedgEntry.FINDLAST THEN
        NextEntryNo := ExLedgEntry."Entry No.";
      NextEntryNo := NextEntryNo + 1;
    END;
  end;

  Local procedure SetDocumentDateEqualPostingDateIfDocumentDateisBlank();
  begin
        IF "Document Date" = 0D THEN
        "Document Date" := "Posting Date";  
  end;

  Local procedure CreateExRegisterIfNotAlreadyCreated();
  begin
      IF ExReg."No." = 0 THEN BEGIN
        ExReg.LOCKTABLE;
        IF (NOT ExReg.FINDLAST) OR (ExReg."To Entry No." <> 0) THEN BEGIN
          ExReg.INIT;
          ExReg."No." := ExReg."No." + 1;
          ExReg."From Entry No." := NextEntryNo;
          ExReg."To Entry No." := NextEntryNo;
          ExReg."Creation Date" := TODAY;
          ExReg."Source Code" := "Source Code";
          ExReg."Journal Batch Name" := "Journal Batch Name";
          ExReg."User ID" := USERID;
          ExReg.INSERT;
        END;
      END;    
  end;

  Local procedure UpdateRegister();
  begin
      ExReg."To Entry No." := NextEntryNo;
      ExReg.MODIFY;
  end;

  Local procedure InitAndUpdateResourceLedgerEntry();
  begin
      ExLedgEntry.INIT;
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
      //GetGLSetup;

      WITH ExLedgEntry DO BEGIN
        IF "Entry Type" = "Entry Type"::Sale THEN
          Quantity := -Quantity;
        "User ID" := USERID;
        "Entry No." := NextEntryNo;
      END;
  
  end;

local procedure InsertExampleLedgerEntry();
begin
      ExLedgEntry.INSERT;
end;

local procedure UpdateNextEntryNo();
begin
      NextEntryNo := NextEntryNo + 1;
end;

}


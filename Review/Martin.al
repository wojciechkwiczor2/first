codeunit 72052003 "Ex. Jnl.-Post Line Martin"
{
  // version Exercise 3

  TableNo=72050013;

  trigger OnRun();
  begin
    //GetGLSetup;
    TestNear(Rec);
    TestFar();
    Code(Rec);
  end;

  var
    ExJnlLine : Record 72050013;
    ExLedgEntry : Record 72050011;
    ExReg : Record 72050015;
    ExJnlCheckLine : Codeunit 72050002;
    NextEntryNo : Integer;

  procedure TestNear(var ExJnlLine2: record 72050013);
  begin
    ExJnlLine.COPY(ExJnlLine2);
    WITH ExJnlLine DO BEGIN
      IF EmptyLine THEN
        EXIT;
    END;
  end;

  procedure TestFar();
  begin
    ExJnlCheckLine.RunCheck(ExJnlLine);
  end;

  procedure Code(var ExJnlLine2 : record 72050013);
  var
    
  begin
    with ExJnlLine DO BEGIN;
      GetNextEntryNo;

      IF "Document Date" = 0D THEN
        "Document Date" := "Posting Date";

      CreateExreg();
      CreateExledgEntry();  
      
      NextEntryNo := NextEntryNo + 1;
      ExJnlLine2 := ExJnlLine;
    end;
  end;

  procedure GetNextEntryNo();
  begin
    IF NextEntryNo = 0 THEN BEGIN
        ExLedgEntry.LOCKTABLE;
        IF ExLedgEntry.FINDLAST THEN
          NextEntryNo := ExLedgEntry."Entry No.";
        NextEntryNo := NextEntryNo + 1;
    END;
  end;

  procedure CreateExReg();
  begin
    with ExJnlLine Do begin
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
      ExReg."To Entry No." := NextEntryNo;
      ExReg.MODIFY;
    end;
  end;

  procedure CreateExLedgEntry();
  begin
    with ExJnlLine do begin
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

      ExLedgEntry.INSERT;
    end;
  end;
}


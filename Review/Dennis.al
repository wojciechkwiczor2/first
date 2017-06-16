codeunit 72056003 "Ex. Jnl.-Post Line Dennis"
{
  // version Exercise 3

  TableNo=72050013;

  trigger OnRun();
  begin
    //GetGLSetup;
    RunWithCheck(Rec);
  end;

  var
    GLSetup : Record 98;
    ExJnlLine : Record 72050013;
    ExLedgEntry : Record 72050011;
    ExamplePerson : Record 72050010;
    ExReg : Record 72050015;
    ExJnlCheckLine : Codeunit 72050002;
    NextEntryNo : Integer;
    GLSetupRead : Boolean;

  PROCEDURE GetExReg(VAR NewExReg : Record 72050015);
  begin
    NewExReg := ExReg;
  end;

  PROCEDURE RunWithCheck(VAR ExJnlLine2 : Record 72050013);
  begin
    // DK
    IF ExJnlLine2.EmptyLine THEN// Test Near
      EXIT;
    ExJnlCheckLine.RunCheck(ExJnlLine2); // Test far
    // DK  

    
    ExJnlLine.COPY(ExJnlLine2);
    Code;
    ExJnlLine2 := ExJnlLine;
  end;

  LOCAL PROCEDURE "Code"();
  begin
    WITH ExJnlLine DO BEGIN
      // DK
      //IF EmptyLine THEN
      //  EXIT;
      // DK

      // ExJnlCheckLine.RunCheck(ExJnlLine); // Test far

      IF NextEntryNo = 0 THEN BEGIN
        ExLedgEntry.LOCKTABLE;
        IF ExLedgEntry.FINDLAST THEN
          NextEntryNo := ExLedgEntry."Entry No.";
        NextEntryNo := NextEntryNo + 1;
      END;

      IF "Document Date" = 0D THEN
        "Document Date" := "Posting Date";

      // Insert Example Register - Create own function
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
      // Insert Example Register 

      // Insert ExLedgEntry - Create own function
      WITH ExLedgEntry DO BEGIN
        INIT;
        "Entry Type" := "Entry Type";
        "Document No." := "Document No.";
        "Posting Date" := "Posting Date";
        "Document Date" := "Document Date";
        "Example Person No." := "Example Person No.";
        "Example Product No." := "Example Product No.";
        Description := Description;
        Quantity := Quantity;
        "Global Dimension 1 Code" := "Shortcut Dimension 1 Code";
        "Global Dimension 2 Code" := "Shortcut Dimension 2 Code";
        "Dimension Set ID" := "Dimension Set ID";
        "Source Code" := "Source Code";
        "Journal Batch Name" := "Journal Batch Name";
        "Reason Code" := "Reason Code";
        "Gen. Bus. Posting Group" := "Gen. Bus. Posting Group";
        "Gen. Prod. Posting Group" := "Gen. Prod. Posting Group";
        "No. Series" := "Posting No. Series";
      //GetGLSetup;
      
        IF "Entry Type" = "Entry Type"::Sale THEN
          Quantity := -Quantity;
        "User ID" := USERID;
        "Entry No." := NextEntryNo;
      END;

      ExLedgEntry.INSERT;
      // Insert ExLedgEntry

      NextEntryNo := NextEntryNo + 1;
    END;
  end;


}


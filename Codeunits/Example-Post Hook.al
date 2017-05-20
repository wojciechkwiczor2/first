codeunit 72050030 "Example-Post Hook"
{
  // version Exercise 4


  trigger OnRun();
  begin
  end;

  PROCEDURE OnBeforeTestNear(VAR ExampleDocumentHeader : Record 72050003);
  begin
  end;

  PROCEDURE OnAfterDelete(VAR ExampleDocumentHeader : Record 72050003);
  begin
  end;
}


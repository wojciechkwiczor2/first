codeunit 50033 "Get Weight From Iceland"
{
  // version Exercise 4


  trigger OnRun();
  begin
  end;

  [EventSubscriber(ObjectType::Codeunit, 50012, 'GetWeightEvent', '', false, false)]
  LOCAL PROCEDURE GetWightFromIceland(VAR Rec : Variant;VAR WeightArguments : Record 50098;VAR Handled : Boolean);
  var
    GetWeightFromScaleFacade : Codeunit 50012;
  begin
    IF Handled THEN // Test Near
      EXIT;

    IF GetWeightFromScaleFacade.GetCodeunitIDFromScaleSetup <> CODEUNIT::"Get Weight From Iceland" THEN // Test Far
      EXIT;

    WITH WeightArguments DO // Do It
      Weight := 25602;

    Handled := TRUE; // Clean Up
  end;

  [EventSubscriber(ObjectType::Page, 50025, 'OnOpenPageEvent', '', true, true)]
  LOCAL PROCEDURE RegisterScale(VAR Rec : Record 50025);
  var
    Scale : Record 50025;
  begin
    WITH Rec DO BEGIN
      IF GET('ICELAND') THEN
        EXIT;
      INIT;
      Code := 'ICELAND';
      Description := 'Iceland Scale';
      "Codeunit ID" := CODEUNIT::"Get Weight From Iceland";
      INSERT;
    END;
  end;
}


codeunit 72050033 "Get Weight From Iceland"
{
  // version Exercise 4


  trigger OnRun();
  begin
  end;

  [EventSubscriber(ObjectType::Codeunit, 72050012, 'GetWeightEvent', '', false, false)]
  LOCAL PROCEDURE GetWightFromIceland(VAR Rec : Variant;VAR WeightArguments : Record 72050098;VAR Handled : Boolean);
  var
    GetWeightFromScaleFacade : Codeunit 72050012;
  begin
    IF Handled THEN // Test Near
      EXIT;

    IF GetWeightFromScaleFacade.GetCodeunitIDFromScaleSetup <> CODEUNIT::"Get Weight From Iceland" THEN // Test Far
      EXIT;

    WITH WeightArguments DO // Do It
      Weight := 25602;

    Handled := TRUE; // Clean Up
  end;

  [EventSubscriber(ObjectType::Page, 72050025, 'OnOpenPageEvent', '', true, true)]
  LOCAL PROCEDURE RegisterScale(VAR Rec : Record 72050025);
  var
    Scale : Record 72050025;
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


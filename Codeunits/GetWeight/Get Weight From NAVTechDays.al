codeunit 72050088 "Get Weight From NAVTechDays"
{
  // version Exercise 4


  trigger OnRun();
  begin
  end;

  [EventSubscriber(ObjectType::Codeunit, 72050012, 'GetWeightEvent', '', false, false)]
  LOCAL PROCEDURE GetWightFromNAVTechDays(VAR Rec : Variant;VAR WeightArguments : Record 72050098;VAR Handled : Boolean);
  var
    GetWeightFromScaleFacade : Codeunit 72050012;
  begin
    IF Handled THEN // Test Near
      EXIT;

    IF GetWeightFromScaleFacade.GetCodeunitIDFromScaleSetup <> CODEUNIT::"Get Weight From NAVTechDays" THEN // Test Far
      EXIT;

    WITH WeightArguments DO // Do It
      Weight := 984315;

    Handled := TRUE; // Clean Up
  end;

  [EventSubscriber(ObjectType::Page, 72050025, 'OnOpenPageEvent', '', true, true)]
  LOCAL PROCEDURE RegisterScale(VAR Rec : Record 72050025);
  var
    Scale : Record 72050025;
  begin
    WITH Rec DO BEGIN
      IF GET('NAVTECHD') THEN
        EXIT;
      INIT;
      Code := 'NAVTECHD';
      Description := 'NAVTechDays Scale';
      "Codeunit ID" := CODEUNIT::"Get Weight From NAVTechDays";
      INSERT;
    END;
  end;
}


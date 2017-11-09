codeunit 50088 "Get Weight From NAVTechDays"
{
  // version Exercise 4


  trigger OnRun();
  begin
  end;

  [EventSubscriber(ObjectType::Codeunit, 50012, 'GetWeightEvent', '', false, false)]
  LOCAL PROCEDURE GetWightFromNAVTechDays(VAR Rec : Variant;VAR WeightArguments : Record 50098;VAR Handled : Boolean);
  var
    GetWeightFromScaleFacade : Codeunit 50012;
  begin
    IF Handled THEN // Test Near
      EXIT;

    IF GetWeightFromScaleFacade.GetCodeunitIDFromScaleSetup <> CODEUNIT::"Get Weight From NAVTechDays" THEN // Test Far
      EXIT;

    WITH WeightArguments DO // Do It
      Weight := 984315;

    Handled := TRUE; // Clean Up
  end;

  [EventSubscriber(ObjectType::Page, 50025, 'OnOpenPageEvent', '', true, true)]
  LOCAL PROCEDURE RegisterScale(VAR Rec : Record 50025);
  var
    Scale : Record 50025;
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


codeunit 72050017 "Get Weight From Brandx"
{
  // version Exercise 4


  trigger OnRun();
  begin
  end;

  [EventSubscriber(ObjectType::Codeunit, 72050012, 'GetWeightEvent', '', false, false)]
  LOCAL PROCEDURE GetWightFromPhilips(VAR Rec : Variant;VAR WeightArguments : Record 72050098;VAR Handled : Boolean);
  var
    GetWeightFromScaleFacade : Codeunit 72050012;
  begin
    IF GetWeightFromScaleFacade.GetCodeunitIDFromScaleSetup <> CODEUNIT::"Get Weight From Brandx" THEN
      EXIT;

    IF Handled THEN
      EXIT;

    WITH WeightArguments DO
      Weight := 200;

    Handled := TRUE;
  end;
}


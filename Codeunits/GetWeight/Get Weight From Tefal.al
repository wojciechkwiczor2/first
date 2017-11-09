codeunit 50015 "Get Weight From Tefal"
{
  // version Exercise 4


  trigger OnRun();
  begin
  end;

  [EventSubscriber(ObjectType::Codeunit, 50012, 'GetWeightEvent', '', false, false)]
  LOCAL PROCEDURE GetWightFromPhilips(VAR Rec : Variant;VAR WeightArguments : Record 50098;VAR Handled : Boolean);
  var
    GetWeightFromScaleFacade : Codeunit 50012;
  begin
    IF GetWeightFromScaleFacade.GetCodeunitIDFromScaleSetup <> CODEUNIT::"Get Weight From Tefal" THEN
      EXIT;

    IF Handled THEN
      EXIT;

    WITH WeightArguments DO
      Weight := 102;

    Handled := TRUE;
  end;
}


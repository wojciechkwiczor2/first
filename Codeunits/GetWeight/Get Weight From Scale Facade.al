codeunit 72050012 "Get Weight From Scale Facade"
{
  // version Exercise 4


  trigger OnRun();
  begin
  end;

  PROCEDURE GetWeight(Rec : Variant;VAR WeightArguments : Record 72050098);
  var
    IsHandled : Boolean;
    IsNotHandled : TextConst ENU='There is no Scale';
  begin
    GetWeightEvent(Rec, WeightArguments, IsHandled);

    IF NOT IsHandled THEN
      ERROR(IsNotHandled);
  end;

  [Business(false)]
  LOCAL PROCEDURE GetWeightEvent(VAR Rec : Variant;VAR WeightArguments : Record 72050098;VAR Handled : Boolean);
  begin
  end;

  PROCEDURE GetCodeunitIDFromScaleSetup() : Integer;
  var
    ExampleSetup : Record 72050000;
    Scale : Record 72050025;
  begin
    WITH ExampleSetup DO BEGIN
      GET;
      IF NOT Scale.GET(ExampleSetup."Scale Code") THEN
        EXIT(0);
    END;

    WITH Scale DO BEGIN
      TESTFIELD("Codeunit ID");
      EXIT("Codeunit ID");
    END;
  end;
}


codeunit 50012 "Get Weight From Scale Facade"
{
  // version Exercise 4


  trigger OnRun();
  begin
  end;

  PROCEDURE GetWeight(Rec : Variant;VAR WeightArguments : Record 50098);
  var
    IsHandled : Boolean;
    IsNotHandled : TextConst ENU='There is no Scale';
  begin
    GetWeightEvent(Rec, WeightArguments, IsHandled);

    IF NOT IsHandled THEN
      ERROR(IsNotHandled);
  end;

  [BusinessEvent(false)]
  LOCAL PROCEDURE GetWeightEvent(VAR Rec : Variant;VAR WeightArguments : Record 50098;VAR Handled : Boolean);
  begin
  end;

  PROCEDURE GetCodeunitIDFromScaleSetup() : Integer;
  var
    ExampleSetup : Record 50000;
    Scale : Record 50025;
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


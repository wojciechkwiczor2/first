tableextension 72050005 ExampleSetup extends ExampleSetup
{
    procedure InitSetupRecord();
    begin
        If not get then begin
            Init;
            Insert;
        end;
    end;
}
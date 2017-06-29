tableextension 72051234 CustomerFormatAddress extends Customer
{
    procedure FormatAddress(VAR AddrArray : ARRAY [8] OF Text[90]);
    var
        FormAddr : Codeunit "Format Address";
    begin
        FormAddr.Customer(AddrArray, Rec);
    end;
}
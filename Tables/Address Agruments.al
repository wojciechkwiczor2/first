table 72050099 "Address Agruments"
{
  // version Exercise 2


  fields
  {
    field(2;Name;Text[50])
    {
      CaptionML=ENU='Name';
    }
    field(4;"Name 2";Text[50])
    {
      CaptionML=ENU='Name 2';
    }
    field(5;Address;Text[50])
    {
      CaptionML=ENU='Address';
    }
    field(6;"Address 2";Text[50])
    {
      CaptionML=ENU='Address 2';
    }
    field(7;City;Text[30])
    {
      CaptionML=ENU='City';
    }
    field(8;Contact;Text[50])
    {
      CaptionML=ENU='Contact';
    }
    field(35;"Country/Region Code";Code[10])
    {
      CaptionML=ENU='Country/Region Code';
      TableRelation="Country/Region";
    }
    field(91;"Post Code";Code[20])
    {
      CaptionML=ENU='Post Code';
    }
    field(92;County;Text[30])
    {
      CaptionML=ENU='County';
    }
  }

  keys
  {
    key(1;Key1;Name)
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }

  PROCEDURE FormAddress(VAR AddrArray : ARRAY [8] OF Text[80]);
  var
    FormatAddress : Codeunit 365;
  begin
    WITH FormatAddress DO
      FormatAddr(AddrArray,Name,"Name 2",Contact,Address,"Address 2",City,"Post Code",County,"Country/Region Code")
  end;
}


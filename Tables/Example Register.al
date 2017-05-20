table 72050015 "Example Register"
{
  // version Exercise 3

  CaptionML=ENU='Example Register';
  DrillDownPageID=72050017;
  LookupPageID=72050017;

  fields
  {
    field(1;"No.";Integer)
    {
      CaptionML=ENU='No.';
    }
    field(2;"From Entry No.";Integer)
    {
      CaptionML=ENU='From Entry No.';
      TableRelation="Example Entry";
    }
    field(3;"To Entry No.";Integer)
    {
      CaptionML=ENU='To Entry No.';
      TableRelation="Example Entry";
    }
    field(4;"Creation Date";Date)
    {
      CaptionML=ENU='Creation Date';
    }
    field(5;"Source Code";Code[10])
    {
      CaptionML=ENU='Source Code';
      TableRelation="Source Code";
    }
    field(6;"User ID";Code[50])
    {
      CaptionML=ENU='User ID';
      
      trigger OnLookup();
      var
        UserMgt : Codeunit 418;
      begin
        UserMgt.LookupUserID("User ID");
      end;
    }
    field(7;"Journal Batch Name";Code[10])
    {
      CaptionML=ENU='Journal Batch Name';
    }
  }

  keys
  {
    key(1;Key1;"No.")
    {
      Clustered=true;
    }
    key(2;Key2;"Creation Date")
    {
    }
    key(3;Key3;"Source Code","Journal Batch Name","Creation Date")
    {
    }
  }

  fieldgroups
  {
  }
}


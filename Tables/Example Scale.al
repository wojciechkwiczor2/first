table 72050025 "Example Scale"
{
  // version Exercise 4

  LookupPageID=72050025;

  fields
  {
    field(1;"Code";Code[10])
    {
    }
    field(2;Description;Text[30])
    {
    }
    field(3;"Codeunit ID";Integer)
    {
    }
  }

  keys
  {
    key(Key1;"Code")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }
}


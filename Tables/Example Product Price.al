table 72050030 "Example Product Price"
{
  // version Exercise 2


  fields
  {
    field(1;"Product No.";Code[20])
    {
      TableRelation="Example Product";
    }
    field(2;"Person No.";Code[20])
    {
      TableRelation="Example Person";
    }
    field(3;"Sales Price";Decimal)
    {
    }
  }

  keys
  {
    key(1;Key1;"Product No.","Person No.")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }
}


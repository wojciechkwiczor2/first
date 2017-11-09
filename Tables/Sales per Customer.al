table 50001 "Sales per Customer"
{
  // version Exercise 4


  fields
  {
    field(1;"Customer No.";Code[20])
    {
      TableRelation=Customer;
    }
    field(2;"Customer Name";Text[50])
    {
    }
    field(3;"Customer City";Text[50])
    {
    }
    field(4;"Item No.";Code[20])
    {
      TableRelation=Item;
    }
    field(5;"Valued Qty.";Decimal)
    {
    }
    field(6;"Sales Amount (Actual)";Decimal)
    {
    }
    field(7;"Item Description";Text[50])
    {
    }
    field(8;"Entry No.";Integer)
    {
    }
  }

  keys
  {
    key(Key1;"Entry No.")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }
}


table 72050006 "Example Cue"
{
  // version Exercise 4


  fields
  {
    field(1;"Primary Key";Code[10])
    {
    }
    field(2;"Example Documents";Integer)
    {
      CalcFormula=Count("Example Document Header");
      FieldClass=FlowField;
    }
  }

  keys
  {
    key(1;Key1;"Primary Key")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }
}


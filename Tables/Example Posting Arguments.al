table 72050002 "Example Posting Arguments"
{
  // version Exercise 4


  fields
  {
    field(1;"Replace Posting Date";Boolean)
    {
    }
    field(2;"Replace Document Date";Boolean)
    {
    }
    field(3;"Posting Date";Date)
    {
    }
  }

  keys
  {
    key(Key1;"Replace Posting Date")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }

  PROCEDURE ThrowErrorIfNoPostingDateAndReplaceIsSelected();
  var
    PleaseEnterPostingDate : TextConst ENU='Please enter the posting date.';
  begin
    IF "Replace Posting Date" AND ("Posting Date" = 0D) THEN
      ERROR(PleaseEnterPostingDate);
  end;
}


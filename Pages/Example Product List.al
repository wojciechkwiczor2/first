page 50021 "Example Product List"
{
  // version Exercise 2

  CardPageID="Example Product Card";
  Editable=false;
  PageType=List;
  SourceTable="Example Product";

  layout
  {
    area(content)
    {
      repeater(Group)
      {
        field("No.";"No.")
        {
        }
        field(Description;Description)
        {
        }
      }
    }
    area(factboxes)
    {
      systempart(Control6;Links)
      {
        Visible=true;
      }
      systempart(Control5;Notes)
      {
        Visible=true;
      }
    }
  }

  actions
  {
  }
}


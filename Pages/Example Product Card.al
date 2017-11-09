page 50020 "Example Product Card"
{
  // version Exercise 2

  PageType=Card;
  SourceTable="Example Product";

  layout
  {
    area(content)
    {
      group(General)
      {
        field("No.";"No.")
        {

          trigger OnValidate();
          begin
            IF AssistEdit THEN
              CurrPage.UPDATE;
          end;
        }
        field(Description;Description)
        {
        }
        field("Search Description";"Search Description")
        {
        }
        field("Description 2";"Description 2")
        {
        }
        field(Blocked;Blocked)
        {
        }
      }
      group(Price)
      {
        field("Sales Price";"Sales Price")
        {
        }
      }
    }
    area(factboxes)
    {
      systempart(Control8;Links)
      {
        Visible=true;
      }
      systempart(Control7;Notes)
      {
        Visible=true;
      }
    }
  }

  actions
  {
  }
}


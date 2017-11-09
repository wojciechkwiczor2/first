page 50011 "Example Person List"
{
  // version Exercise 2

  CaptionML=ENU='Example Master Data List';
  CardPageID="Example Person Card";
  Editable=false;
  PageType=List;
  SourceTable="Example Person";

  layout
  {
    area(content)
    {
      repeater(Group)
      {
        field("No.";"No.")
        {
        }
        field(Name;Name)
        {
        }
        field(Address;Address)
        {
        }
        field(City;City)
        {
        }
        field("Country/Region Code";"Country/Region Code")
        {
        }
        field("Phone No.";"Phone No.")
        {
        }
      }
    }
    area(factboxes)
    {
      systempart(Control10;Links)
      {
        Visible=true;
      }
      systempart(Control9;Notes)
      {
        Visible=true;
      }
    }
  }

  actions
  {
  }
}


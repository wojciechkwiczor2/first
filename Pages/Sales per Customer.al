page 50001 "Sales per Customer"
{
  // version Exercise 4

  PageType=List;
  SourceTable="Sales per Customer";
  SourceTableTemporary=true;

  layout
  {
    area(content)
    {
      repeater(Group)
      {
        field("Customer No.";"Customer No.")
        {
        }
        field("Customer Name";"Customer Name")
        {
        }
        field("Customer City";"Customer City")
        {
        }
        field("Item No.";"Item No.")
        {
        }
        field("Valued Qty.";"Valued Qty.")
        {
        }
        field("Sales Amount (Actual)";"Sales Amount (Actual)")
        {
        }
        field("Item Description";"Item Description")
        {
        }
      }
    }
  }

  actions
  {
  }

  trigger OnOpenPage();
  begin
    InitPageBasedOnQuery;
  end;

  PROCEDURE InitPageBasedOnQuery();
  var
    ExQuery : Query 50000;
    NextEntryNo : Integer;
  begin
    ExQuery.OPEN;
    WHILE ExQuery.READ DO BEGIN
      NextEntryNo := NextEntryNo + 1;
      "Entry No." := NextEntryNo;
      "Customer No." := ExQuery.No;
      "Customer Name" := ExQuery.Name;
      "Customer City" := ExQuery.City;
      "Item No." := ExQuery.Item_No;
      "Valued Qty." := ExQuery.Sum_Valued_Quantity;
      "Sales Amount (Actual)" := ExQuery.Sum_Sales_Amount_Actual;
      "Item Description" := ExQuery.Description;
      INSERT;
    END;

    FINDFIRST;
  end;
}


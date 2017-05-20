query 72050000 "Sales per Customer"
{
  // version Exercise 4


  elements
  {
    dataitem(Customer;Customer)
    {
      column(No;"No.")
      {
      }
      column(Name;Name)
      {
      }
      column(City;City)
      {
      }
      dataitem("Value_Entry";"Value Entry")
      {
        DataItemLink="Source No."=Customer."No.";
        DataItemTableFilter="Source Type"=CONST(Customer);
        column(Item_No;"Item No.")
        {
        }
        column(Sum_Valued_Quantity;"Valued Quantity")
        {
          Method=Sum;
        }
        column(Sum_Sales_Amount_Actual;"Sales Amount (Actual)")
        {
          Method=Sum;
        }
        dataitem(Item;Item)
        {
          DataItemLink="No."=Value_Entry."Item No.";
          column(Description;Description)
          {
          }
        }
      }
    }
  }
}


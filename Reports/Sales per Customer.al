report 50001 "Sales per Customer"
{
  // version Exercise 4


  dataset
  {
    dataitem("Sales per Customer";"Sales per Customer")
    {
      UseTemporary=true;
      column(CustomerNo_SalesperCustomer;"Sales per Customer"."Customer No.")
      {
      }
      column(CustomerName_SalesperCustomer;"Sales per Customer"."Customer Name")
      {
      }
      column(CustomerCity_SalesperCustomer;"Sales per Customer"."Customer City")
      {
      }
      column(ItemNo_SalesperCustomer;"Sales per Customer"."Item No.")
      {
      }
      column(ValuedQty_SalesperCustomer;"Sales per Customer"."Valued Qty.")
      {
      }
      column(SalesAmountActual_SalesperCustomer;"Sales per Customer"."Sales Amount (Actual)")
      {
      }
      column(ItemDescription_SalesperCustomer;"Sales per Customer"."Item Description")
      {
      }

      trigger OnPreDataItem();
      begin
        InitReportBasedOnQuery
      end;
    }
  }

  requestpage
  {

    layout
    {
    }

    actions
    {
    }
  }

  labels
  {
  }

  PROCEDURE InitReportBasedOnQuery();
  var
    ExQuery : Query 50000;
    NextEntryNo : Integer;
  begin
    ExQuery.OPEN;
    WHILE ExQuery.READ DO
      WITH "Sales per Customer" DO BEGIN
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
  end;
}


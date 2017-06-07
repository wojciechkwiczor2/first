table 71050000 "Bosch Data"
{

    fields
    {
        field(1;MyField;Integer)
        {
        }
    }

    keys
    {
        key(1;PK;MyField)
        {
            Clustered = true;
        }
    }

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}
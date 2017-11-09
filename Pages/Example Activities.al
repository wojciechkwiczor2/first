page 50006 "Example Activities"
{
  // version Exercise 4

  PageType=CardPart;
  SourceTable="Example Cue";

  layout
  {
    area(content)
    {
      cuegroup(Control3)
      {
        field("Example Documents";"Example Documents")
        {
          DrillDownPageID="Example Document List";
        }
      }
    }
  }

  actions
  {
  }

  trigger OnOpenPage();
  begin
    RESET;
    IF NOT GET THEN BEGIN
      INIT;
      INSERT;
    END;
  end;
}


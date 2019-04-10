page 50107 "CSD Seminar Comment List"
{
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";
    Editable = false;
    Caption = 'Seminar Comment List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Date; Date)
                {

                }
                field(Code; Code)
                {
                    Visible = false;
                }
                field(Comment; Comment)
                {

                }
            }
        }
    }
}
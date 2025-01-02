
-- SelectAllAdmin procedure
CREATE   PROCEDURE SelectAllAdmin
AS
BEGIN
    /*start docs
    {
        "Description": "Selects all admin entries from the Admin table.",
        "Params": [],
        "Return": [
            "Id",
            "CreatedDate",
            "LastChangeDate",
            "Email",
            "[Role]",
            "FirstName",
            "LastName"
        ]
    }
    end docs */

    SET NOCOUNT ON;

    SELECT 
        Id,
        CreatedDate,
        LastChangeDate,
        Email,
        [Role],
        FirstName,
        LastName
    FROM AdminPanel.Admin;
END;

GO


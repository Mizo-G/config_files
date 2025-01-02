

-- DeleteAdmin procedure
CREATE   PROCEDURE DeleteAdmin
    @Id INT
AS
BEGIN
    /*start docs
    {
        "Description": "Deletes an admin entry from the Admin table.",
        "Params": [
            { "Name": "@Id", "Type": "INT" }
        ],
        "Return": []
    }
    end docs */

    DELETE FROM AdminPanel.Admin
    WHERE Id = @Id;
END;

GO



-- ChangeAdminRole procedure
CREATE   PROCEDURE ChangeAdminRole
    @AdminId INT,
    @NewRole TINYINT
AS
BEGIN
    /*start docs
    {
        "Description": "Changes the role of a specific admin.",
        "Params": [
            { "Name": "@AdminId", "Type": "INT" },
            { "Name": "@NewRole", "Type": "TINYINT" }
        ],
        "Return": []
    }
    end docs */

    UPDATE AdminPanel.Admin
    SET [Role] = @NewRole,
        LastChangeDate = GETUTCDATE()
    WHERE Id = @AdminId;
END;

GO


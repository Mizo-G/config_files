
/* Unarchive User */
CREATE   PROCEDURE [dbo].[UnarchiveUser]
    @Id INT
AS
BEGIN
    /* start docs
    {
        "Description": "Unarchive a user, essentially undoing delete operation",
        "Params": [
            { "Name": "@Id", "Type": "INT", "Default": null }
        ],
        "Return": "Number of rows affected"
    }
    end docs */

    UPDATE [dbo].[User]
    SET IsArchived = 0
    WHERE Id = @Id;
END;

GO


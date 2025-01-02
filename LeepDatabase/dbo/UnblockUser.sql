
/* Unblock User */
CREATE   PROCEDURE [dbo].[UnblockUser]
    @Id INT
AS
BEGIN
    /* start docs
    {
        "Description": "Unblock a user, per there request or through admin privilges, undo a block.",
        "Params": [
            { "Name": "@Id", "Type": "INT", "Default": null }
        ],
        "Return": "Number of rows affected"
    }
    end docs */

    UPDATE [dbo].[User]
    SET IsBlocked = 0
    WHERE Id = @Id;
END;

GO


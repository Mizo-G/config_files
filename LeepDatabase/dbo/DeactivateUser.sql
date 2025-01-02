
/* Deactivate User */
CREATE   PROCEDURE [dbo].[DeactivateUser]
    @Id INT
AS
BEGIN
    /* start docs
    {
        "Description": "Deactivate a user, per there request or through admin privilges",
        "Params": [
            { "Name": "@Id", "Type": "INT", "Default": null }
        ],
        "Return": "Number of rows affected"
    }
    end docs */

    UPDATE [dbo].[User]
    SET IsActive = 0
    WHERE Id = @Id;
END;

GO


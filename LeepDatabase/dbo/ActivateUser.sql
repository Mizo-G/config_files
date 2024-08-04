/* Activate User */
CREATE   PROCEDURE [dbo].[ActivateUser]
    @Id INT
AS
BEGIN
    /* start docs
    {
        "Description": "Activate User. On user request undo a deactivate, admin privilges required.",
        "Params": [
            { "Name": "@Id", "Type": "INT", "Default": null }
        ],
        "Return": "Number of rows affected"
    }
    end docs */

    UPDATE [dbo].[User]
    SET IsActive = 1
    WHERE Id = @Id;
END;

GO


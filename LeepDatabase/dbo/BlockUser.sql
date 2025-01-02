/* Block User */
CREATE   PROCEDURE [dbo].[BlockUser]
    @Id INT
AS
BEGIN
    /* start docs
    {
        "Description": "Blocks a user from using the service. Used by admins only or automatically on malicious use of service or breaking terms of service, different from users blocking each other.",
        "Params": [
            { "Name": "@Id", "Type": "INT", "Default": null }
        ],
        "Return": "Number of rows affected"
    }
    end docs */

    UPDATE [dbo].[User]
    SET IsBlocked = 1
    WHERE Id = @Id;
END;

GO


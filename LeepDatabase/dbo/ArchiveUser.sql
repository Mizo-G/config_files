
/* Archive User */
CREATE   PROCEDURE [dbo].[ArchiveUser]
    @Id INT
AS
BEGIN
    /* start docs
    {
        "Description": "Soft delete a user by setting IsArchived to 1",
        "Params": [
            { "Name": "@Id", "Type": "INT", "Default": null }
        ],
        "Return": "Number of rows affected"
    }
    end docs */

    UPDATE [dbo].[User]
    SET IsArchived = 1
    WHERE Id = @Id;
END;

GO


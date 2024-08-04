
/* Delete Profile */
CREATE   PROCEDURE [dbo].[DeleteProfile]
    @Id INT
AS
BEGIN
    /* start docs
    {
        "Description": "Soft delete a record from the Profile table by setting IsArchived to 1",
        "Params": [
            { "Name": "@Id", "Type": "INT", "Default": null }
        ],
        "Return": "None"
    }
    end docs */

    UPDATE [dbo].[Profile]
    SET IsArchived = 1
    WHERE Id = @Id;
END;

GO



/* DeleteProfileContactInfo */
CREATE   PROCEDURE [dbo].[DeleteProfileContactInfo]
    @ProfileId INT,
    @Value VARCHAR(255)
AS
BEGIN
    /* start docs
    {
        "Description": "Delete records from the ContactInfo table for a given ProfileId and current value",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT", "Default": null }
        ],
        "Return": "None"
    }
    end docs */

    DELETE FROM [dbo].[ContactInfo]
    WHERE ProfileId = @ProfileId and [Value] = @Value;
END;

GO


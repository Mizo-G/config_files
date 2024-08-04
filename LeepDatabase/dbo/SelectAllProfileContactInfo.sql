
/* SelectAllProfileContactInfo */
CREATE   PROCEDURE [dbo].[SelectAllProfileContactInfo]
    @ProfileId INT
AS
BEGIN
    SET NOCOUNT ON;

    /* start docs
    {
        "Description": "Select all records from the ContactInfo table for a given ProfileId",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT", "Default": null }
        ],
        "Return": [
            "ProfileId",
            "Value",
            "Type",
            "Privacy"
        ]
    }
    end docs */

    SELECT 
        ProfileId,
        [Value],
        [Type],
        Privacy
    FROM [dbo].[ContactInfo]
    WHERE ProfileId = @ProfileId;
END;

GO



/* SelectAllProfileSocialMediaLinks */
CREATE   PROCEDURE [dbo].[SelectAllProfileSocialMediaLinks]
    @ProfileId INT
AS
BEGIN
    SET NOCOUNT ON;

    /* start docs
    {
        "Description": "Select all records from the SocialMediaLinks table for a given ProfileId",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT", "Default": null }
        ],
        "Return": [
            "ProfileId",
            "Site",
            "Value",
            "Privacy"
        ]
    }
    end docs */

    SELECT 
        ProfileId,
        [Site],
        [Value],
        Privacy
    FROM [dbo].[SocialMediaLinks]
    WHERE ProfileId = @ProfileId;
END;

GO


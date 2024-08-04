
/* DeleteProfileSocialMediaLinks */
CREATE   PROCEDURE [dbo].[DeleteProfileSocialMediaLinks]
    @ProfileId INT,
    @Site VARCHAR(255)
AS
BEGIN
    /* start docs
    {
        "Description": "Delete records from the SocialMediaLinks table for a given ProfileId and a Site",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT", "Default": null }
            { "Name": "@Value", "Type": "VARCHAR(255)", "Default": null }
        ],
        "Return": "None"
    }
    end docs */

    DELETE FROM [dbo].[SocialMediaLinks]
    WHERE ProfileId = @ProfileId and [Site] = @Site;
END;

GO


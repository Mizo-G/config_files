
-- SocialMediaLinks Table CRUD Operations

/* InsertProfileSocialMediaLinks */
CREATE   PROCEDURE [dbo].[InsertProfileSocialMediaLinks]
    @ProfileId INT,
    @SocialMediaLinksList dbo.SocialMediaLinksType READONLY
AS
BEGIN
    /* start docs
    {
        "Description": "Insert new records into the SocialMediaLinks table for a given ProfileId",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT", "Default": null },
            { "Name": "@SocialMediaLinksList", "Type": "dbo.SocialMediaLinksType", "Default": null }
        ],
        "Return": "None"
    }
    end docs */

    INSERT INTO [dbo].[SocialMediaLinks] (ProfileId, [Site], [Value], Privacy)
    SELECT ProfileId, [Site], [Value], Privacy
    FROM @SocialMediaLinksList;
END;

GO


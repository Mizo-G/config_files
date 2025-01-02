
-- ChangePrivacyLevelSocialMediaLinks procedure
CREATE   PROCEDURE ChangePrivacyLevelSocialMediaLinks
    @ProfileId INT,
    @Site VARCHAR(2083),
    @NewPrivacy TINYINT
AS
BEGIN
    /*start docs
    {
        "Description": "Changes the privacy level for a specific social media link entry based on ProfileId and Value.",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT" },
            { "Name": "@Site", "Type": "VARCHAR(2083)" },
            { "Name": "@NewPrivacy", "Type": "TINYINT" }
        ]
    }
    end docs */

    UPDATE dbo.SocialMediaLinks
    SET Privacy = @NewPrivacy
    WHERE ProfileId = @ProfileId AND [Site] = @Site;
END;

GO


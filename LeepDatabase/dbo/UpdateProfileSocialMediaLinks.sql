
/* UpdateProfileSocialMediaLinks */
CREATE   PROCEDURE [dbo].[UpdateProfileSocialMediaLinks]
    @ProfileId INT,
    @Site VARCHAR(255),
    @NewValue VARCHAR(255)
AS
BEGIN
    /* start docs
    {
        "Description": "Update records in the SocialMediaLinks table for a given ProfileId and Site",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT", "Default": null },
            { "Name": "@Site", "Type": "VARCHAR(255)", "Default": null }
            { "Name": "@NewValue", "Type": "VARCHAR(255)", "Default": null }
        ],
        "Return": "None"
    }
    end docs */

    UPDATE [dbo].[SocialMediaLinks]
    SET [Value] = @NewValue
    WHERE ProfileId = @ProfileId;

END;

GO


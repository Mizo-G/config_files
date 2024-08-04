
-- ChangePrivacyLevelContactInfo procedure
CREATE   PROCEDURE ChangePrivacyLevelContactInfo
    @ProfileId INT,
    @Value VARCHAR(320),
    @NewPrivacy TINYINT
AS
BEGIN
    /*start docs
    {
        "Description": "Changes the privacy level for a specific contact info entry based on ProfileId and Value.",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT" },
            { "Name": "@Value", "Type": "VARCHAR(320)" },
            { "Name": "@NewPrivacy", "Type": "TINYINT" }
        ]
    }
    end docs */

    UPDATE dbo.ContactInfo
    SET Privacy = @NewPrivacy
    WHERE ProfileId = @ProfileId AND [Value] = @Value;
END;

GO





-- ChangePrivacyLevelEducation procedure
CREATE   PROCEDURE ChangePrivacyLevelEducation
    @ProfileId INT,
    @Value VARCHAR(255),
    @NewPrivacy TINYINT
AS
BEGIN
    /*start docs
    {
        "Description": "Changes the privacy level for a specific education entry based on ProfileId and Value.",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT" },
            { "Name": "@Value", "Type": "VARCHAR(255)" },
            { "Name": "@NewPrivacy", "Type": "TINYINT" }
        ]
    }
    end docs */

    UPDATE dbo.Education
    SET Privacy = @NewPrivacy
    WHERE ProfileId = @ProfileId AND [Value] = @Value;
END;

GO


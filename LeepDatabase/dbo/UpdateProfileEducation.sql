
/* UpdateProfileEducation */
CREATE   PROCEDURE [dbo].[UpdateProfileEducation]
    @ProfileId INT,
    @Value VARCHAR(255),
    @NewValue VARCHAR(255)
AS
BEGIN
    /* start docs
    {
        "Description": "Update records in the Education table for a given ProfileId and value with a new value.",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT", "Default": null },
            { "Name": "@Value", "Type": "VARCHAR(255)", "Default": null }
            { "Name": "@NewValue", "Type": "VARCHAR(255)", "Default": null }
        ],
        "Return": "None"
    }
    end docs */
    UPDATE [Education]
    SET [Value] = @Value
    WHERE ProfileId = @ProfileId and [Value] = @NewValue;

END;

GO


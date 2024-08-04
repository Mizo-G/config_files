
/* UpdateProfileContactInfo */
CREATE   PROCEDURE [dbo].[UpdateProfileContactInfo]
    @ProfileId INT,
    @Value VARCHAR(255),
    @NewValue VARCHAR(255)
AS
BEGIN
    /* start docs
    {
        "Description": "Update records in the ContactInfo table for a given ProfileId and current value to a new value",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT", "Default": null },
            { "Name": "@Value", "Type": "VARCHAR(255)", "Default": null },
            { "Name": "@NewValue", "Type": "VARCHAR(255)", "Default": null },
        ],
        "Return": "None"
    }
    end docs */

    UPDATE [ContactInfo]
    SET [Value] = @NewValue
    WHERE ProfileId = @ProfileId and [Value] = @Value;

END;

GO


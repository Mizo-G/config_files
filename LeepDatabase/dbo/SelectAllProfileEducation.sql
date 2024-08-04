
/* SelectAllProfileEducation */
CREATE   PROCEDURE [dbo].[SelectAllProfileEducation]
    @ProfileId INT
AS
BEGIN
    SET NOCOUNT ON;

    /* start docs
    {
        "Description": "Select all records from the Education table for a given ProfileId",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT", "Default": null }
        ],
        "Return": [
            "ProfileId",
            "Type",
            "Value",
            "Privacy"
        ]
    }
    end docs */

    SELECT 
        ProfileId,
        [Type],
        [Value],
        Privacy
    FROM [dbo].[Education]
    WHERE ProfileId = @ProfileId;
END;

GO


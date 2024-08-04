
-- Education Table CRUD Operations

/* InsertProfileEducation */
CREATE   PROCEDURE [dbo].[InsertProfileEducation]
    @ProfileId INT,
    @EducationList EducationType READONLY
AS
BEGIN
    /* start docs
    {
        "Description": "Insert new records into the Education table for a given ProfileId",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT", "Default": null },
            { "Name": "@EducationList", "Type": "EducationType", "Default": null }
        ],
        "Return": "None"
    }
    end docs */

    INSERT INTO [dbo].[Education] (ProfileId, [Type], [Value], Privacy)
    SELECT ProfileId, [Type], [Value], Privacy
    FROM @EducationList;
END;

GO


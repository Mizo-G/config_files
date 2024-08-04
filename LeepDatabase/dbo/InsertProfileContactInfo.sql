
-- ContactInfo Table CRUD Operations

/* InsertProfileContactInfo */
CREATE   PROCEDURE [dbo].[InsertProfileContactInfo]
    @ProfileId INT,
    @ContactInfoList dbo.ContactInfoType READONLY
AS
BEGIN
    /* start docs
    {
        "Description": "Insert new records into the ContactInfo table for a given ProfileId",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT", "Default": null },
            { "Name": "@ContactInfoList", "Type": "dbo.ContactInfoType", "Default": null }
        ],
        "Return": "None"
    }
    end docs */

    INSERT INTO [dbo].[ContactInfo] (ProfileId, [Value], [Type], Privacy)
    SELECT ProfileId, [Value], [Type], Privacy
    FROM @ContactInfoList;
END;

GO


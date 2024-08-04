CREATE   PROCEDURE [dbo].[ChangeProfile]
    @ProfileId INT
AS
BEGIN

    /* start docs
    {
        "Description": "Change the currently selected Profile.",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT", "Default": NULL },
        ],
        "Return": ["NewUserId"]
    }
    end docs */

    UPDATE [Profile]
    SET IsSelected = 1
    WHERE Id = @ProfileId

END;

GO


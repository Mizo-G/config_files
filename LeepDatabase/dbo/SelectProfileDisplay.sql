/* Insert Profile */
CREATE   PROCEDURE [dbo].[SelectProfileDisplay]
    @ProfileId INT
AS
BEGIN

    /* start docs
    {
        "Description": "Selects the profile's display information, serves as a summary of the profile, to use in comments and posts.",
        "Params": [
           { "Name": "@ProfileId", "Type": "INT", "Default": "NULL" }
        ],
        "Return": ""
    }
    end docs */

    SELECT pd.ProfileId, pd.Username, pd.Handle, pd.[Description] 
    FROM ProfileDisplay pd 
    WHERE pd.ProfileId = @ProfileId

END;

GO


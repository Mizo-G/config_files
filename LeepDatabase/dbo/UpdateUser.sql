
/* Update User */
CREATE   PROCEDURE [dbo].[UpdateUser]
    @Id INT,
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Email VARCHAR(100),
    @PhoneNumber VARCHAR(32) = NULL,
    @Country NVARCHAR(100),
    @City NVARCHAR(200) = NULL
AS
BEGIN
    /* start docs
    {
        "Description": "Update an existing user in the User table",
        "Params": [
            { "Name": "@Id", "Type": "INT", "Default": null },
            { "Name": "@FirstName", "Type": "NVARCHAR(100)", "Default": null },
            { "Name": "@LastName", "Type": "NVARCHAR(100)", "Default": null },
            { "Name": "@Email", "Type": "VARCHAR(100)", "Default": null },
            { "Name": "@PhoneNumber", "Type": "VARCHAR(32)", "Default": "NULL" },
            { "Name": "@Country", "Type": "NVARCHAR(100)", "Default": null },
            { "Name": "@City", "Type": "NVARCHAR(200)", "Default": "NULL" }
        ],
        "Return": "Number of rows affected"
    }
    end docs */


    UPDATE [dbo].[User]
        SET FirstName = @FirstName,
            LastName = @LastName,
            Email = @Email,
            PhoneNumber = @PhoneNumber,
            Country = @Country,
            City = @City
        WHERE Id = @Id AND IsArchived = 0;
END;

GO


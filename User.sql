SET XACT_ABORT ON
BEGIN TRANSACTION

/* START USER */ 
/* ---------- */ 
drop table if exists dbo.[User]

create table [dbo].[User]
(
  [Id] int not null primary key identity,
  [CreatedDate] datetime2 not null default (getutcdate()),
  [LastChangeDate] datetime2 not null default (getutcdate()),
  [IsArchived] bit not null default (0),
  [FirstName] nvarchar not null,
  [LastName] nvarchar not null,
  [Hash] char(64) not null,
  [Email] varchar not null unique,
  [IsEmailVerified] bit not null default (0),
  [Country] nvarchar not null,
  [City] nvarchar null,
  [IsActive] bit not null default (1),
  [IsBlocked] bit not null default (0)
);

drop table if exists dbo.SessionType;

create table [SessionType]
(
  [Id] tinyint not null primary key,
  [Value] varchar not null
);
insert into SessionType (Id, Value) 
values (0, 'LoggedIn'), (1, 'LoggedOut'), (2, 'Registering'), (3, 'Viewing'); 

drop table if exists dbo.[UserDetails];

create table [dbo].[UserDetails]
(
  [Id] int not null primary key identity,
  [UserId] int not null foreign key references [User](Id),
  [CreatedDate] datetime2 not null default (getutcdate()),
  [LastChangeDate] datetime2 not null default (getutcdate()),
  [IsArchived] bit not null default (0),
  [CurrentSessionStartDate] datetime2 null,
  [LastSessionEndDate] datetime2 null,
  [CurrentSessionType] tinyint not null foreign key references [SessionType](Id),
  [TotalTimeSpentOnSiteInSeconds] int not null default (0),
  [TotalActiveTimeInSeconds] int not null default (0),
  [IsCurrentSessionActive] bit not null default (1),
  [Prefrences] varchar(max) null,
  [Cookie] varchar(max) null, 
  [ScreenSize] varchar null,
  [HasAdBlocker] bit not null default (0)
);
create nonclustered index IX_UserDetails_UserId_User_Id on UserDetails (UserId)
create nonclustered index IX_UserDetails_CurrentSessionType_SessionType_Id on UserDetails (CurrentSessionType)

drop table if exists dbo.UserDetailListTypes;

create table [UserDetailListTypes] 
(
  [Id] tinyint not null primary key,
  [Value] varchar not null
);
insert into UserDetailListTypes (Id, Value) 
values (0, 'IP'), (1, 'Browser'), (2, 'Session'), (3, 'Operating System');

drop table if exists dbo.UserDetailLists;

create table [UserDetailLists]
(
  [UserId] int not null foreign key references [User](Id),
  [Value] varchar not null,
  [Type] tinyint not null foreign key references [UserDetailListTypes](Id),
  [Location] varchar null,
  [IsCurrent] bit not null default (1)
);

create nonclustered index IX_UserDetailLists_UserId_User_Id on UserDetailLists (UserId)
create nonclustered index IX_UserDetailLists_Type_UserDetalListTypes on UserDetailLists ([Type])

/* END USER */ 
/* ---------- */ 


/* START PROFILE */ 
/* ---------- */ 

drop table if exists Profile

create table [Profile]
(
  [Id] int not null identity primary key,
  [UserId] int not null foreign key references [User](Id),
  [CreatedDate] datetime2 not null default (getutcdate()),
  [LastChangeDate] datetime2 not null default (getutcdate()),
  [IsArchived] bit not null default (0),
  [IsActive] bit not null default (1),
  [IsBlocked] bit not null default (0),
  [IsSelected] bit not null default (1),
  [Email] varchar null, -- use email.user by default?
  [IsEmailVerified] bit not null default (0),
  [UserName] nvarchar not null, -- @username
  [Handle] nvarchar not null, -- like twitter 
  [ProfileImage] varchar not null, 
  [IsPersonal] bit not null default (1), -- trigger could enforce this value never changing 
  [LastLoginDate] datetime2 null,
  [Country] nvarchar null,
  [City] nvarchar null,
  [Descreption] nvarchar null,  
  [IntroVideo] nvarchar null,
  [PhoneNumber] varchar null,
  [IsPhoneVerified] bit not null default (0),
  [JobTitle] nvarchar not null,
  [YearsOfExperience] tinyint not null,  
  [BirthDate] datetime2 null,
  [IsMale] bit not null,
  -- Business Profile Fields
  [Industry] nvarchar null,
  [Company] nvarchar null,
  [FoundedYear] smallint null,
);
create nonclustered index UQ_ProfileEmail on Profile(Email) where Profile.Email is not null
create nonclustered index UQ_PhoneNumer on Profile(PhoneNumber) where Profile.PhoneNumber is not null

drop table if exists SocialMediaSite
create table SocialMediaSite
(
  [Id] tinyint not null primary key,
  [Value] varchar not null, 
);
insert into SocialMediaSite (Id, [Value])
values 
(0, 'LinkedIn'), (1, 'Facebook'), (2, 'Twitter'),
(3, 'TikTok'), (4, 'Instagram'), (5, 'WhatsApp'),
(6, 'Github'), (7, 'Youtube'), (8, 'other')

drop table if exists SocialMediaLinks
create table SocialMediaLinks
(
  [ProfileId] int not null foreign key references [Profile](Id),
  [Site] tinyint not null foreign key references [SocialMediaSite](Id),
  [Value] varchar not null, 
);
create nonclustered index IX_SocialMediaLinkes_ProfileId_Profile_Id on [SocialMediaLinks]([ProfileId])
create nonclustered index IX_SocialMediaLinkes_Site_SocialMediaSite_Id on [SocialMediaLinks]([Site])

drop table if exists Interests
create table Interests
(
  [ProfileId] int not null foreign key references [Profile](Id),
  [Value] varchar not null, 
);
create nonclustered index IX_Interests_ProfileId_Profile_Id on [Interests]([ProfileId])

drop table if exists Specialities 
create table Specialities
(
  [ProfileId] int not null foreign key references [Profile](Id),
  [Value] varchar not null, 
);
create nonclustered index IX_Specialities_ProfileId_Profile_Id on [Specialities]([ProfileId])

drop table if exists EducationType
create table EducationType
(
  [Id] tinyint not null primary key,
  [Value] varchar not null, 
);
insert into EducationType (Id, Value)
values
(1, 'bachelor'), (2, 'masters'), (3, 'phd'), (4, 'workshop'),
(5, 'course'), (6, 'bootcamp'), (7, 'certification'), (8, 'award')


drop table if exists Education 
create table Education
(
  [ProfileId] int not null foreign key references [Profile](Id),
  [Type] tinyint not null foreign key references [EducationType](Id),
  [Value] varchar not null, 
);
create nonclustered index IX_Education_ProfileId_Profile_Id on [Education]([ProfileId])
create nonclustered index IX_Education_Type_EducationType_Id on [Education]([Type])

drop table if exists ProfileDisplay 
create table ProfileDisplay
(
  [ProfileId] int not null foreign key references [Profile](Id),
  [Username] nvarchar not null, 
  [Handle] nvarchar not null, 
  [ProfileImage] varchar not null, 
);
create nonclustered index IX_ProfileDisplay_ProfileId_Profile_Id on [ProfileDisplay]([ProfileId])

/* END PROFILE */
/* ---------- */ 


/* START ADMIN */ 
/* ---------- */ 

drop schema if exists [Admin]
go
create schema [Admin]
go

drop table if exists [Admin].[AdminRole]
create table [Admin].[AdminRole]
(
  [Id] tinyint not null primary key,
  [Value] varchar not null, 
);
insert into [Admin].[AdminRole] (Id, Value)
values
(1, 'Superadmin'), (2, 'Admin'), (3, 'Viewer')

drop table if exists [Admin].[Admin]
create table [Admin].[Admin]
(
  [Id] int not null primary key identity,
  [CreatedDate] datetime2 not null default (getutcdate()),
  [LastChangeDate] datetime2 not null default (getutcdate()),
  [Email] varchar not null unique,
  [IsEmailVerified] bit not null default (0),
  [Hash] char(64) not null,
  [LastLoginDate] datetime2 null,
  [Role] tinyint not null foreign key references [Admin].[AdminRole](Id),
  [ProfileImage] varchar not null,
  [FirstName] nvarchar not null,
  [LastName] nvarchar not null,  
  [LinkedUserId] int null foreign key references [dbo].[User](Id),
)
create nonclustered index IX_Admin_Role_AdminRole_Id on [Admin].[Admin]([Role])
create nonclustered index IX_Admin_LinkedUserId_User_Id on [Admin].[Admin]([LinkedUserId]) where [Admin].[Admin].LinkedUserId is not null

/* END ADMIN */
/* ---------- */ 


/* START LOGGING */ 
/* ---------- */ 
drop table if exists ChangeType
create table ChangeType
(
  [Id] tinyint not null primary key,
  [Value] varchar not null, 
);
insert into ChangeType (Id, [Value])
values (0, 'insert'), (1, 'update'), (2, 'archive'), (3, 'delete'), (4, 'Other') 

drop table if exists ChangeBy
create table ChangeBy
(
  [Id] tinyint not null primary key,
  [Value] varchar not null, 
);
insert into ChangeType (Id, [Value])
values (0, 'system'), (1, 'admin'), (2, 'user'), (3, 'veiwer'), (4, 'external') 

drop table if exists LogLevel
create table LogLevel
(
  [Id] tinyint not null primary key,
  [Value] varchar not null, 
);
insert into ChangeType (Id, [Value])
values (0, 'action'), (1, 'info'), (2, 'warning'), (3, 'error') 

drop table if exists [ChangeLog]
create table [ChangeLog]
(
  [Id] int not null primary key identity,
  [TableName] varchar not null,
  [RowId] varchar not null,
  [CreatedDate] datetime2 not null default (getutcdate()),
  [ChangedBy]  tinyint not null foreign key references [ChangeBy](Id), 
  [ChangerId]  int not null, -- -1  for system, -2 for external sources 
  [Type] tinyint not null foreign key references [ChangeType](Id), 
  [ChangedColumns] varchar null,
  [OldValues] varchar null,
  [NewValues] varchar null,
  [Message] varchar null,
  [Error] varchar null,
  [Level] tinyint not null foreign key references [LogLevel](Id)
);
create nonclustered index IX_ChangeLog_Type_ChangeType_Id on [ChangeLog]([Type])
create nonclustered index IX_ChangeLog_ChangedBy_ChangeBy_Id on [ChangeLog](ChangedBy)
create nonclustered index IX_ChangeLog_Level_LogLevel_Id on [ChangeLog]([Level])

/* END LOGGING */
/* ---------- */ 

/* START ADMIN PANEL LOGGING */ 
/* ---------- */ 

drop table if exists [Admin].[AdminPanelChangeLog]
create table [Admin].[AdminPanelChangeLog]
(
  [Id] int not null primary key identity,
  [TableName] varchar not null,
  [RowId] varchar not null,
  [CreatedDate] datetime2 not null default (getutcdate()),
  [ChangerId]  int not null foreign key references [Admin].[Admin](Id), 
  [Type] tinyint not null foreign key references [ChangeType](Id), 
  [ChangedColumns] varchar null,
  [OldValues] varchar null,
  [NewValues] varchar null,
  [Message] varchar null,
  [Error] varchar null,
  [Level] tinyint not null foreign key references [LogLevel](Id)
);

create nonclustered index IX_AdminPanelChangeLog_ChangerId_Admin_Id on [Admin].[AdminPanelChangeLog](ChangerId)
create nonclustered index IX_AdminPanelChangeLog_Type_ChangeType_Id on [Admin].[AdminPanelChangeLog]([Type])
create nonclustered index IX_AdminPanelChangeLog_Level_LogLevel_Id on [Admin].[AdminPanelChangeLog]([Level])


/* END ADMIN PANEL LOGGIN */
/* ---------- */ 

COMMIT TRANSACTION
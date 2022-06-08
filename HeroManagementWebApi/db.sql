


CREATE DATABASE [HeroesManagement]

GO


Use [HeroesManagement]



CREATE TABLE [dbo].[Log](  
    [Id] [int] IDENTITY(1,1) NOT NULL,  
    [Message] [nvarchar](max) NULL,  
    [MessageTemplate] [nvarchar](max) NULL,  
    [Level] [nvarchar](128) NULL,  
    [TimeStamp] [datetimeoffset](7) NOT NULL,  
    [Exception] [nvarchar](max) NULL,  
    [Properties] [xml] NULL,  
    [LogEvent] [nvarchar](max) NULL,  
    [UserName] [nvarchar](200) NULL,  
    [IP] [varchar](200) NULL,  
    CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED   
(  
    [Id] ASC  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]  
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]  

GO
CREATE TABLE [dbo].[Trainer] (
    [Id]          NVARCHAR (36)  NOT NULL,
    [TrainerName] NVARCHAR (255) NOT NULL,
    [Password]    NVARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

CREATE TABLE [dbo].[Ability] (
    [AbilityId]   INT            NOT NULL,
    [AbilityDesc] NVARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([AbilityId] ASC)
);
GO
CREATE TABLE [dbo].[Hero] (
    [Id]          NVARCHAR (36)  NOT NULL,
    [HeroName]    NVARCHAR (255) NOT NULL,
    [AbilityId]   INT            NOT NULL,
    [CreatedDate] DATE           NOT NULL,
    [Power]       INT            NOT NULL,
    [TrainerId]   NVARCHAR (36)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_HeroToAbility] FOREIGN KEY ([AbilityId]) REFERENCES [dbo].[Ability] ([AbilityId]),
    CONSTRAINT [FK_HeroToTrainer] FOREIGN KEY ([TrainerId]) REFERENCES [dbo].[Trainer] ([Id])
);
GO

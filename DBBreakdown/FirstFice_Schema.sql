-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/plJ5b1
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [users] (
    [id] int  NOT NULL ,
    [name] text  NOT NULL ,
    [password] text  NOT NULL ,
    [contact_num] int  NOT NULL ,
    [contact_email] text  NOT NULL ,
    [type_of_user] text  NOT NULL ,
    [bio] text  NOT NULL ,
    CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED (
        [id] ASC
    )
)

CREATE TABLE [company_requests] (
    [request_id] int  NOT NULL ,
    [co_id] int  NOT NULL ,
    [project_desc] text  NOT NULL ,
    [timeframe] text  NOT NULL ,
    [searching_for_professional] text  NOT NULL ,
    CONSTRAINT [PK_company_requests] PRIMARY KEY CLUSTERED (
        [request_id] ASC
    )
)

CREATE TABLE [likes] (
    [like_id] int  NOT NULL ,
    [liker] int  NOT NULL ,
    [likee] int  NOT NULL ,
    CONSTRAINT [PK_likes] PRIMARY KEY CLUSTERED (
        [like_id] ASC
    )
)

CREATE TABLE [messages] (
    [message_id] int  NOT NULL ,
    [message_from] int  NOT NULL ,
    [message_to] int  NOT NULL ,
    CONSTRAINT [PK_messages] PRIMARY KEY CLUSTERED (
        [message_id] ASC
    )
)

ALTER TABLE [company_requests] WITH CHECK ADD CONSTRAINT [FK_company_requests_co_id] FOREIGN KEY([co_id])
REFERENCES [users] ([id])

ALTER TABLE [company_requests] CHECK CONSTRAINT [FK_company_requests_co_id]

ALTER TABLE [likes] WITH CHECK ADD CONSTRAINT [FK_likes_liker] FOREIGN KEY([liker])
REFERENCES [users] ([id])

ALTER TABLE [likes] CHECK CONSTRAINT [FK_likes_liker]

ALTER TABLE [likes] WITH CHECK ADD CONSTRAINT [FK_likes_likee] FOREIGN KEY([likee])
REFERENCES [users] ([id])

ALTER TABLE [likes] CHECK CONSTRAINT [FK_likes_likee]

ALTER TABLE [messages] WITH CHECK ADD CONSTRAINT [FK_messages_message_from] FOREIGN KEY([message_from])
REFERENCES [users] ([id])

ALTER TABLE [messages] CHECK CONSTRAINT [FK_messages_message_from]

ALTER TABLE [messages] WITH CHECK ADD CONSTRAINT [FK_messages_message_to] FOREIGN KEY([message_to])
REFERENCES [users] ([id])

ALTER TABLE [messages] CHECK CONSTRAINT [FK_messages_message_to]

COMMIT TRANSACTION QUICKDBD
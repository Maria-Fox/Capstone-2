-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/plJ5b1
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [users] (
    [username] text  NOT NULL ,
    [password] text  NOT NULL ,
    [contact_num] text  NOT NULL ,
    [contact_email] text  NOT NULL ,
    [type_of_user] text  NOT NULL ,
    [bio] text  NOT NULL ,
    CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED (
        [username] ASC
    )
)

CREATE TABLE [company_requests] (
    [request_id] int  NOT NULL ,
    [co_usernane] text  NOT NULL ,
    [project_desc] text  NOT NULL ,
    [timeframe] text  NOT NULL ,
    [searching_for_professional] text  NOT NULL ,
    CONSTRAINT [PK_company_requests] PRIMARY KEY CLUSTERED (
        [request_id] ASC
    )
)

CREATE TABLE [likes] (
    [id] int  NOT NULL ,
    [liker_username] text  NOT NULL ,
    [liked_username] text  NOT NULL ,
    CONSTRAINT [PK_likes] PRIMARY KEY CLUSTERED (
        [id] ASC
    )
)

CREATE TABLE [messages] (
    [message_id] int  NOT NULL ,
    [message_from] text  NOT NULL ,
    [message_to] text  NOT NULL ,
    [body] text  NOT NULL ,
    [sent_at] timestamp  NOT NULL ,
    [read_at] timestamp  NOT NULL ,
    CONSTRAINT [PK_messages] PRIMARY KEY CLUSTERED (
        [message_id] ASC
    )
)

ALTER TABLE [company_requests] WITH CHECK ADD CONSTRAINT [FK_company_requests_co_usernane] FOREIGN KEY([co_usernane])
REFERENCES [users] ([username])

ALTER TABLE [company_requests] CHECK CONSTRAINT [FK_company_requests_co_usernane]

ALTER TABLE [likes] WITH CHECK ADD CONSTRAINT [FK_likes_liker_username] FOREIGN KEY([liker_username])
REFERENCES [users] ([username])

ALTER TABLE [likes] CHECK CONSTRAINT [FK_likes_liker_username]

ALTER TABLE [likes] WITH CHECK ADD CONSTRAINT [FK_likes_liked_username] FOREIGN KEY([liked_username])
REFERENCES [users] ([username])

ALTER TABLE [likes] CHECK CONSTRAINT [FK_likes_liked_username]

ALTER TABLE [messages] WITH CHECK ADD CONSTRAINT [FK_messages_message_from] FOREIGN KEY([message_from])
REFERENCES [users] ([username])

ALTER TABLE [messages] CHECK CONSTRAINT [FK_messages_message_from]

ALTER TABLE [messages] WITH CHECK ADD CONSTRAINT [FK_messages_message_to] FOREIGN KEY([message_to])
REFERENCES [users] ([username])

ALTER TABLE [messages] CHECK CONSTRAINT [FK_messages_message_to]

COMMIT TRANSACTION QUICKDBD
-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/plJ5b1
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [users] (
    [id] int  NOT NULL ,
    [first_name] text  NOT NULL ,
    [last_name] text  NOT NULL ,
    [username] text  NOT NULL ,
    [password] text  NOT NULL ,
    [type_of_user] text  NOT NULL ,
    [bio(optional)] text  NOT NULL ,
    [img(optional)] text  NOT NULL ,
    CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED (
        [id] ASC
    )
)

CREATE TABLE [companies] (
    [id] int  NOT NULL ,
    [name] text  NOT NULL ,
    CONSTRAINT [PK_companies] PRIMARY KEY CLUSTERED (
        [id] ASC
    )
)

CREATE TABLE [company_requests] (
    [co_id] int  NOT NULL ,
    [co_name] text  NOT NULL ,
    [co_need] text  NOT NULL ,
    [co_timeline] text  NOT NULL ,
    [co_contact_info] text  NOT NULL ,
    CONSTRAINT [PK_company_requests] PRIMARY KEY CLUSTERED (
        [co_id] ASC
    )
)

CREATE TABLE [early_professionals] (
    [user_id] int  NOT NULL ,
    [bio] text  NOT NULL ,
    [years_exp] int  NOT NULL ,
    [open_to_contact] boolean  NOT NULL ,
    CONSTRAINT [PK_early_professionals] PRIMARY KEY CLUSTERED (
        [user_id] ASC
    )
)

CREATE TABLE [company_interests] (
    [co_id] int  NOT NULL ,
    [user_id] int  NOT NULL ,
    CONSTRAINT [PK_company_interests] PRIMARY KEY CLUSTERED (
        [co_id] ASC
    )
)

CREATE TABLE [messages] (
    [message_id] int  NOT NULL ,
    [from_user_id] int  NOT NULL ,
    [to_user_id] int  NOT NULL ,
    CONSTRAINT [PK_messages] PRIMARY KEY CLUSTERED (
        [message_id] ASC
    )
)

ALTER TABLE [company_requests] WITH CHECK ADD CONSTRAINT [FK_company_requests_co_id] FOREIGN KEY([co_id])
REFERENCES [companies] ([id])

ALTER TABLE [company_requests] CHECK CONSTRAINT [FK_company_requests_co_id]

ALTER TABLE [early_professionals] WITH CHECK ADD CONSTRAINT [FK_early_professionals_user_id] FOREIGN KEY([user_id])
REFERENCES [users] ([id])

ALTER TABLE [early_professionals] CHECK CONSTRAINT [FK_early_professionals_user_id]

ALTER TABLE [company_interests] WITH CHECK ADD CONSTRAINT [FK_company_interests_co_id] FOREIGN KEY([co_id])
REFERENCES [companies] ([id])

ALTER TABLE [company_interests] CHECK CONSTRAINT [FK_company_interests_co_id]

ALTER TABLE [company_interests] WITH CHECK ADD CONSTRAINT [FK_company_interests_user_id] FOREIGN KEY([user_id])
REFERENCES [users] ([id])

ALTER TABLE [company_interests] CHECK CONSTRAINT [FK_company_interests_user_id]

ALTER TABLE [messages] WITH CHECK ADD CONSTRAINT [FK_messages_from_user_id] FOREIGN KEY([from_user_id])
REFERENCES [users] ([id])

ALTER TABLE [messages] CHECK CONSTRAINT [FK_messages_from_user_id]

ALTER TABLE [messages] WITH CHECK ADD CONSTRAINT [FK_messages_to_user_id] FOREIGN KEY([to_user_id])
REFERENCES [users] ([id])

ALTER TABLE [messages] CHECK CONSTRAINT [FK_messages_to_user_id]

COMMIT TRANSACTION QUICKDBD
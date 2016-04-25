
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/25/2016 17:46:35
-- Generated from EDMX file: C:\Users\Alexandre de Lima\Documents\Visual Studio 2015\Projects\HospedagemOnline\HospedagemOnline\Models\ModeloDados.edmx
-- --------------------------------------------------
create database HospedagemBD;
go
SET QUOTED_IDENTIFIER OFF;
GO
USE [HospedagemBD];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[fk_estabelecimento_categoria]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Estabelecimento] DROP CONSTRAINT [fk_estabelecimento_categoria];
GO
IF OBJECT_ID(N'[dbo].[fk_estabelecimento_cidade]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Estabelecimento] DROP CONSTRAINT [fk_estabelecimento_cidade];
GO
IF OBJECT_ID(N'[dbo].[fk_quarto_estabelecimento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Quarto] DROP CONSTRAINT [fk_quarto_estabelecimento];
GO
IF OBJECT_ID(N'[dbo].[fk_quarto_tipoquarto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Quarto] DROP CONSTRAINT [fk_quarto_tipoquarto];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Categoria]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categoria];
GO
IF OBJECT_ID(N'[dbo].[Cidade]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cidade];
GO
IF OBJECT_ID(N'[dbo].[Estabelecimento]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Estabelecimento];
GO
IF OBJECT_ID(N'[dbo].[Quarto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Quarto];
GO
IF OBJECT_ID(N'[dbo].[TipoQuarto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TipoQuarto];
GO
IF OBJECT_ID(N'[dbo].[Usuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuario];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Categoria'
CREATE TABLE [dbo].[Categoria] (
    [IdCategoria] int IDENTITY(1,1) NOT NULL,
    [Descricao] varchar(40)  NOT NULL
);
GO

-- Creating table 'Cidade'
CREATE TABLE [dbo].[Cidade] (
    [IdCidade] int IDENTITY(1,1) NOT NULL,
    [Nome] varchar(50)  NOT NULL,
    [UF] varchar(2)  NOT NULL
);
GO

-- Creating table 'Estabelecimento'
CREATE TABLE [dbo].[Estabelecimento] (
    [IdEstab] int IDENTITY(1,1) NOT NULL,
    [IdCidade] int  NOT NULL,
    [IdCategoria] int  NOT NULL,
    [Nome] varchar(30)  NOT NULL,
    [Endereco] varchar(50)  NOT NULL,
    [Telefone] varchar(11)  NOT NULL,
    [Site] varchar(40)  NOT NULL
);
GO

-- Creating table 'Quarto'
CREATE TABLE [dbo].[Quarto] (
    [IdEstab] int  NOT NULL,
    [IdQuarto] int  NOT NULL,
    [idTipoQuarto] int  NOT NULL,
    [Numero] int  NOT NULL,
    [Disponivel] bit  NOT NULL
);
GO

-- Creating table 'TipoQuarto'
CREATE TABLE [dbo].[TipoQuarto] (
    [IdTipoQuarto] int IDENTITY(1,1) NOT NULL,
    [Descricao] varchar(30)  NOT NULL,
    [ValorDiraria] float  NOT NULL,
    [CafeManha] bit  NOT NULL
);
GO

-- Creating table 'Usuario'
CREATE TABLE [dbo].[Usuario] (
    [IDUsuario] int IDENTITY(1,1) NOT NULL,
    [Nome] varchar(30)  NOT NULL,
    [Login] varchar(20)  NOT NULL,
    [Senha] varchar(10)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdCategoria] in table 'Categoria'
ALTER TABLE [dbo].[Categoria]
ADD CONSTRAINT [PK_Categoria]
    PRIMARY KEY CLUSTERED ([IdCategoria] ASC);
GO

-- Creating primary key on [IdCidade] in table 'Cidade'
ALTER TABLE [dbo].[Cidade]
ADD CONSTRAINT [PK_Cidade]
    PRIMARY KEY CLUSTERED ([IdCidade] ASC);
GO

-- Creating primary key on [IdEstab] in table 'Estabelecimento'
ALTER TABLE [dbo].[Estabelecimento]
ADD CONSTRAINT [PK_Estabelecimento]
    PRIMARY KEY CLUSTERED ([IdEstab] ASC);
GO

-- Creating primary key on [IdEstab], [IdQuarto] in table 'Quarto'
ALTER TABLE [dbo].[Quarto]
ADD CONSTRAINT [PK_Quarto]
    PRIMARY KEY CLUSTERED ([IdEstab], [IdQuarto] ASC);
GO

-- Creating primary key on [IdTipoQuarto] in table 'TipoQuarto'
ALTER TABLE [dbo].[TipoQuarto]
ADD CONSTRAINT [PK_TipoQuarto]
    PRIMARY KEY CLUSTERED ([IdTipoQuarto] ASC);
GO

-- Creating primary key on [IDUsuario] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([IDUsuario] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [IdCategoria] in table 'Estabelecimento'
ALTER TABLE [dbo].[Estabelecimento]
ADD CONSTRAINT [fk_estabelecimento_categoria]
    FOREIGN KEY ([IdCategoria])
    REFERENCES [dbo].[Categoria]
        ([IdCategoria])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_estabelecimento_categoria'
CREATE INDEX [IX_fk_estabelecimento_categoria]
ON [dbo].[Estabelecimento]
    ([IdCategoria]);
GO

-- Creating foreign key on [IdCidade] in table 'Estabelecimento'
ALTER TABLE [dbo].[Estabelecimento]
ADD CONSTRAINT [fk_estabelecimento_cidade]
    FOREIGN KEY ([IdCidade])
    REFERENCES [dbo].[Cidade]
        ([IdCidade])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_estabelecimento_cidade'
CREATE INDEX [IX_fk_estabelecimento_cidade]
ON [dbo].[Estabelecimento]
    ([IdCidade]);
GO

-- Creating foreign key on [IdEstab] in table 'Quarto'
ALTER TABLE [dbo].[Quarto]
ADD CONSTRAINT [fk_quarto_estabelecimento]
    FOREIGN KEY ([IdEstab])
    REFERENCES [dbo].[Estabelecimento]
        ([IdEstab])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [idTipoQuarto] in table 'Quarto'
ALTER TABLE [dbo].[Quarto]
ADD CONSTRAINT [fk_quarto_tipoquarto]
    FOREIGN KEY ([idTipoQuarto])
    REFERENCES [dbo].[TipoQuarto]
        ([IdTipoQuarto])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_quarto_tipoquarto'
CREATE INDEX [IX_fk_quarto_tipoquarto]
ON [dbo].[Quarto]
    ([idTipoQuarto]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
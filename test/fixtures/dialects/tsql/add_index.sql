IF NOT EXISTS(SELECT * FROM sys.indexes WHERE NAME='IX_INTER_VIMR_INFECTIOUS_PEOPLE')
    CREATE NONCLUSTERED INDEX IX_INTER_VIMR_INFECTIOUS_PEOPLE
    ON dbo.VIMR_INFECTIOUS_PEOPLE(DATE_LAST_INSERTED);
GO

IF NOT EXISTS(SELECT * FROM sys.indexes WHERE NAME='IX_INTER_FOUNDATION_NICE_IC_INTAKE_COUNT')
    CREATE NONCLUSTERED INDEX IX_INTER_FOUNDATION_NICE_IC_INTAKE_COUNT
    ON dbo.FOUNDATION_NICE_IC_INTAKE_COUNT(DATE_LAST_INSERTED);
GO

IF EXISTS(SELECT * FROM sys.indexes WHERE NAME='IX_INTER_VIMR_REPRODUCTION_NUMBER')
    CREATE CLUSTERED INDEX IX_INTER_VIMR_REPRODUCTION_NUMBER
    ON dbo.VIMR_INFECTIOUS_PEOPLE(DATE_LAST_INSERTED);
GO

CREATE NONCLUSTERED INDEX [ind_1]
    ON [schema1].[table1]([column1] ASC)
    INCLUDE([column2]) WHERE ([column3] IS NULL);
GO

CREATE NONCLUSTERED INDEX [NI_name]
    ON [schema1].[table1]([column1] DESC)
    ON [PRIMARY];
GO

CREATE UNIQUE INDEX [ix_name]
    ON [schema1].[table1]([column1], [column2])
    WITH FILLFACTOR = 80;
GO

CREATE UNIQUE INDEX [ix_name]
    ON [schema1].[table1]([column1])
    WITH (PAD_INDEX = OFF, SORT_IN_TEMPDB = ON);

CREATE UNIQUE INDEX [ix_name]
    ON [schema1].[table1]([column1])
    WITH (ONLINE = ON);
GO

CREATE UNIQUE INDEX [ix_name]
    ON [schema1].[table1]([column1])
    WITH (ONLINE = ON (WAIT_AT_LOW_PRIORITY ( MAX_DURATION = 5 MINUTES,
        ABORT_AFTER_WAIT = NONE ) ) );

GO
CREATE UNIQUE INDEX [ix_name]
    ON [schema1].[table1]([column1])
    WITH DATA_COMPRESSION = ROW ON PARTITIONS (2, 4, 6 TO 8)
GO


CREATE STATISTICS Stats_Population ON [Reporting].[Population] 
([ID],[Facility],[Population])

GO

UPDATE STATISTICS Reporting.Population Stats_Population;

GO

UPDATE STATISTICS Reporting.Population (Stats_Facility, Stats_Population);

GO

DROP STATISTICS Reporting.Population.Stats_Population

GO

DROP INDEX IX_INTER_VIMR_REPRODUCTION_NUMBER
    ON dbo.VIMR_INFECTIOUS_PEOPLE;

GO



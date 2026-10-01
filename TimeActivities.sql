SELECT
,[A].[ElementID]   AS "PasoActivityKey"
,[A].[ElementAbbrev] COLLATE Latin1_General_CI_AS  AS "ActivityCode"
,[A].[ElementName] COLLATE Latin1_General_CI_AS  AS "Activity"
,CAST(CASE WHEN [A].[ElementID] = 1009 THEN 1 ELSE 0 END AS BIT) AS "IsAdditional"
,CAST(CASE WHEN [A].[ElementID] <> 1009 THEN 1 ELSE 0 END AS BIT) AS "IsAgreed"

FROM [PESO].[dbo].[ElementName] AS [A]

WHERE ListID = 107

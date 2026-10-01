SELECT 
A.Date AS date
,B.ContactID AS employee_PESO_key
,D.OrgStructID AS structure_PESO_Key
,CASE 
	DayofWeekOrder 
	WHEN 1 THEN E.MinutesMonday
	WHEN 2 THEN E.MinutesTuesday
	WHEN 3 THEN E.MinutesWednesday
	WHEN 4 THEN E.MinutesThursday
	WHEN 5 THEN E.MinutesFriday
	WHEN 6 THEN E.MinutesSaturday
	WHEN 7 THEN E.MinutesSunday
	ELSE 0 
END /60.00 AS standard_hours

FROM edh.gold.dim_date AS A
CROSS JOIN fdh.dbo.PESO_Employee AS B
INNER JOIN fdh.dbo.PESO_EmployeeStatus AS C ON B.ContactID = C.ContactID AND A.Date BETWEEN C.StartDate AND C.EndDate
INNER JOIN fdh.dbo.PESO_EmployeePosition AS D ON C.ContactID = D.ContactID AND A.Date BETWEEN D.StartDate AND D.EndDate
INNER JOIN fdh.dbo.PESO_ListCalendarType AS E ON D.CalenderTypeID = E.elementID

WHERE A.DateKey >= 20240401 
AND A.Datekey <= date_format(current_timestamp(),'yyyyMMdd')
AND C.StatusTypeID = 1
AND B.TerminationDate >= '2024-04-01 00:00:00.000'

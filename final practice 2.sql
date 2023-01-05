select * from [dbo].[Nurse]

--1
select *
from [dbo].[Nurse]
where [Registered] = 0

SELECT *
FROM nurse
WHERE registered='false';

--2
select * from [dbo].[Physician]

ALTER TABLE [dbo].[Physician]
ALTER COLUMN [Name] varchar(50)

--3
select * from [dbo].[Department]
select * from [dbo].[Physician]

select 
	d.Name as department_name,
	p.Name as head
from [Department] d left join [dbo].[Physician] p
		on d.Head = p.EmployeeID


--4
select count(distinct [Patient]) as number_of_patients
from [dbo].[Appointment]

--5
select count(*) as available_rooms
from [dbo].[Room]
where [Unavailable]=0

--6
select 
	p.Name as physician_name,
	d.Name as department_name
from [dbo].[Physician] p
	 join [dbo].[Affiliated_With] a
		on p.EmployeeID = a.Physician
	 join [dbo].[Department] d
		on a.Department = d.DepartmentID

--7
select 
	ph.Name as physician_name,
	pr.Name as treatement
from [dbo].[Trained_In] t
	left join [dbo].[Physician] ph
		on t.Physician = ph.EmployeeID
	left join [dbo].[Procedure] pr
		on t.Treatment = pr.Code

--8
select [Name],[Position] 
from [dbo].[Physician]
where [EmployeeID] not in (select distinct [Physician] from [dbo].[Trained_In])

--9
select  
	pat.Name,
	ph.Name,
	convert (date ,(a.Start)) as appointment_date,
	convert (time ,(a.Start)) as appointment_hour
from [dbo].[Appointment] a
	 join [dbo].[Patient] pat
		on a.Patient = pat.SSN
	 join [dbo].[Physician] ph
		on a.Physician = ph.EmployeeID

--10
select 
	pa.Name as patient_name,
	m.Name as medication_name
from [dbo].[Patient] pa 
	join  (select * from [dbo].[Prescribes] where [Appointment] is null) as pr
		on pa.SSN = pr.Patient
	join [dbo].[Medication] m
		on pr.Medication = m.Code

--11
select [BlockFloor],[BlockCode], count(*) as available_rooms
from [dbo].[Room]
where [Unavailable] = 0
group by [BlockFloor],[BlockCode]
order by BlockFloor asc, count(*) desc

--12
SELECT p.name AS "Patient",
       y.name AS "Physician",
       n.name AS "Nurse",
	   pr.Name as "Procedure",
       u.date AS "Date of release",
       r.number AS "Room",
       r.blockfloor AS "Floor",
       r.blockcode AS "Block"
FROM undergoes u
JOIN patient p ON u.patient=p.ssn
JOIN physician y ON u.physician=y.employeeid
LEFT JOIN nurse n ON u.assistingnurse=n.employeeid
JOIN stay s ON u.stay=s.stayid
JOIN room r ON s.room=r.number
join [dbo].[Procedure] pr on u.[Procedure]=pr.Code

select  
	PA.Name as Patient_name,
	PR.Name as Physician_name,
	PH.Name as procedure_Name,
	N.Name as nurse_name,
	S.[Room] as room, 
	R.[BlockFloor] as floor, 
	R.BlockCode as block,
	convert(date,U.Date) as date_of_release
from [dbo].[Undergoes] U 
	left join [dbo].[Patient] PA on U.Patient = PA.SSN
	left join [dbo].[Procedure] PR on Pr.Code = U.[Procedure]
	left join [dbo].[Physician] PH on PH.EmployeeID = U.[Physician]
	left join [dbo].[Nurse] N on N.[EmployeeID] = U.[AssistingNurse]
	left join [dbo].[Stay] S on S.StayID = U.Stay
	left join [dbo].[Room] R on S.Room = R.Number

--13
With registeredNurses As (
	select [EmployeeID], Name from [dbo].[Nurse]
	where [Registered]=1 ), 
relevant_appointments AS (
	select A.* 
	from [dbo].[Appointment] A 
	where [Patient] In (select [Patient] from [dbo].[Appointment]
						group by [Patient]
						having count([AppointmentID]) >=2)
)
select 
	PH.Name as physician_name,
	PA.Name as patient_name,
	N.Name as nurse_name
	from relevant_appointments as RA left join [dbo].[Physician] as PH
		on RA.Physician = PH.EmployeeID
	left join [dbo].[Patient] PA on Pa.SSN = RA.Patient
	join registeredNurses N on RA.PrepNurse = N.EmployeeID





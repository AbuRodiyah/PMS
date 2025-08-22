SELECT e.*, p.net FROM `employee` e
join payroll_items p on e.id = p.employee_id and payroll_id=2

#WHERE 
#employee_no="2020-9838";
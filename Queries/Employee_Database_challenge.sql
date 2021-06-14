SELECT employees.emp_no,
    employees.first_name, employees.last_name
    titles.title, titles.from_date, titles.to_date
--INTO emp_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_titles.emp_no) emp_titles.emp_no, emp_titles.first_name, emp_titles.last_name, emp_titles.title
	INTO unique_titles
	FROM emp_titles 
	ORDER BY emp_titles.emp_no ASC, emp_titles.to_date DESC;

SELECT COUNT(unique_titles.title)
--INTO retiring_titles
GROUP BY unique_titles.title
ORDER BY COUNT(unique_titles)

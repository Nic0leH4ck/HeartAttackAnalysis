--Count the number of records in the dataset:
SELECT COUNT(*) AS total_records
FROM heart..[heart$];

--Average age of patients:
SELECT AVG(age) AS average_age
FROM heart..[heart$];

--Get the number of male and female patients:
SELECT sex, COUNT(*) AS total_count
FROM heart..[heart$]
GROUP BY sex;

--Calculate the maximum and minimum resting blood pressure:
SELECT MAX(trestbps) AS max_bp, MIN(trestbps) AS min_bp
FROM heart..[heart$];

--Find the average serum cholestoral level for each chest pain type:
SELECT cp, AVG(chol) AS avg_cholestoral
FROM heart..[heart$]
GROUP BY cp;



--Find the number of patients in each category of the slope of the peak exercise ST segment:
SELECT slope, COUNT(*) AS total_count
FROM heart..[heart$]
GROUP BY slope;

--Calculate the percentage of patients with more chance of a heart attack:
SELECT (COUNT(*) * 100 / (SELECT COUNT(*) FROM heart..[heart$])) AS percentage
FROM heart..[heart$]
WHERE target = 1;

--Find the number of patients with no major vessels colored by flourosopy and more chance of a heart attack:
SELECT COUNT(*) AS total_count
FROM heart..[heart$]
WHERE ca = 0 AND target = 1;

--Get the average age and maximum heart rate achieved for male and female patients with more chance of a heart attack:
SELECT sex, AVG(age) AS avg_age, AVG(thalach) AS avg_max_hr
FROM heart..[heart$]
WHERE target = 1
GROUP BY sex;

--Calculate the average serum cholestoral level for patients with different resting electrocardiographic results:
SELECT restecg, AVG(chol) AS avg_cholestoral
FROM heart..[heart$]
GROUP BY restecg;

--Find the number of patients with exercise-induced angina and reversible defect thal who have more chance of a heart attack:
SELECT COUNT(*) AS total_count
FROM heart..[heart$]
WHERE exang = 1 AND thal = 2 AND target = 1;

--Calculate the average resting blood pressure for patients with different numbers of major vessels and more chance of a heart attack:
SELECT ca, AVG(trestbps) AS avg_resting_bp
FROM heart..[heart$]
WHERE target = 1
GROUP BY ca;

--Calculate the average maximum heart rate achieved for patients with different chest pain types and exercise-induced angina:
SELECT cp, exang, AVG(thalach) AS avg_max_hr
FROM heart..[heart$]
GROUP BY cp, exang;


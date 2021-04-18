CREATE DATABASE IF NOT EXISTS project_development;
CREATE DATABASE IF NOT EXISTS project_test;
CREATE USER IF NOT EXISTS 'project_app'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON project_development.* TO 'project_app'@'%';
GRANT ALL PRIVILEGES ON project_test.* TO 'project_app'@'%';

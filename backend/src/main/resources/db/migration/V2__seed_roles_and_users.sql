-- V2__seed_roles_and_users.sql
INSERT INTO roles (name, description) VALUES
('ADMIN', 'System administrator'),
('MANAGER', 'Handover manager'),
('SUPERVISOR', 'Operational supervisor'),
('USER', 'Standard user')
ON DUPLICATE KEY UPDATE description = VALUES(description);

INSERT INTO users (email, first_name, last_name, department, enabled) VALUES
('admin@handover.local', 'System', 'Admin', 'IT Operations', TRUE),
('manager@handover.local', 'Maria', 'Lopez', 'Infrastructure', TRUE),
('user@handover.local', 'Carlos', 'Ruiz', 'Support', TRUE)
ON DUPLICATE KEY UPDATE department = VALUES(department), enabled = VALUES(enabled);

INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id
FROM users u
JOIN roles r ON r.name = 'ADMIN'
WHERE u.email = 'admin@handover.local'
ON DUPLICATE KEY UPDATE user_id = user_id;

INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id
FROM users u
JOIN roles r ON r.name = 'MANAGER'
WHERE u.email = 'manager@handover.local'
ON DUPLICATE KEY UPDATE user_id = user_id;

INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id
FROM users u
JOIN roles r ON r.name = 'USER'
WHERE u.email = 'user@handover.local'
ON DUPLICATE KEY UPDATE user_id = user_id;

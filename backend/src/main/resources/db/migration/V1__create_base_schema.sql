-- V1__create_base_schema.sql
CREATE TABLE IF NOT EXISTS roles (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_roles_name (name)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS users (
    id BIGINT NOT NULL AUTO_INCREMENT,
    email VARCHAR(150) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    department VARCHAR(255),
    avatar_url VARCHAR(255),
    enabled BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_users_email (email)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS user_roles (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    CONSTRAINT fk_user_roles_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_user_roles_role FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS handover_expedientes (
    id BIGINT NOT NULL AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description VARCHAR(500),
    status VARCHAR(30) NOT NULL,
    start_date DATE NOT NULL,
    due_date DATE,
    owner_id BIGINT NOT NULL,
    assigned_to_id BIGINT,
    source_system VARCHAR(255),
    location VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_handover_owner FOREIGN KEY (owner_id) REFERENCES users(id),
    CONSTRAINT fk_handover_assignee FOREIGN KEY (assigned_to_id) REFERENCES users(id),
    KEY idx_handover_status (status),
    KEY idx_handover_owner (owner_id),
    KEY idx_handover_due_date (due_date)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS tasks (
    id BIGINT NOT NULL AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description VARCHAR(1000),
    status VARCHAR(30) NOT NULL,
    handover_id BIGINT NOT NULL,
    assignee_id BIGINT,
    due_date DATE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_task_handover FOREIGN KEY (handover_id) REFERENCES handover_expedientes(id) ON DELETE CASCADE,
    CONSTRAINT fk_task_assignee FOREIGN KEY (assignee_id) REFERENCES users(id),
    KEY idx_tasks_handover (handover_id),
    KEY idx_tasks_status (status),
    KEY idx_tasks_assignee (assignee_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS email_sources (
    id BIGINT NOT NULL AUTO_INCREMENT,
    outlook_message_id VARCHAR(255) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    sender VARCHAR(255),
    preview VARCHAR(500),
    body TEXT,
    sent_at TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    handover_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_email_handover FOREIGN KEY (handover_id) REFERENCES handover_expedientes(id) ON DELETE CASCADE,
    KEY idx_email_handover (handover_id),
    KEY idx_email_message_id (outlook_message_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS documents (
    id BIGINT NOT NULL AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    file_name VARCHAR(255),
    storage_path VARCHAR(500),
    mime_type VARCHAR(100),
    file_size BIGINT NOT NULL,
    handover_id BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_document_handover FOREIGN KEY (handover_id) REFERENCES handover_expedientes(id) ON DELETE CASCADE,
    KEY idx_document_handover (handover_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS comments (
    id BIGINT NOT NULL AUTO_INCREMENT,
    handover_id BIGINT NOT NULL,
    author_id BIGINT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_comment_handover FOREIGN KEY (handover_id) REFERENCES handover_expedientes(id) ON DELETE CASCADE,
    CONSTRAINT fk_comment_author FOREIGN KEY (author_id) REFERENCES users(id),
    KEY idx_comment_handover (handover_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS ai_suggestions (
    id BIGINT NOT NULL AUTO_INCREMENT,
    handover_id BIGINT NOT NULL,
    suggestion_type VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    status VARCHAR(30) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT fk_ai_handover FOREIGN KEY (handover_id) REFERENCES handover_expedientes(id) ON DELETE CASCADE,
    KEY idx_ai_handover (handover_id),
    KEY idx_ai_status (status)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS audit_logs (
    id BIGINT NOT NULL AUTO_INCREMENT,
    entity_type VARCHAR(100) NOT NULL,
    entity_id BIGINT NOT NULL,
    action VARCHAR(50) NOT NULL,
    actor_id BIGINT,
    details JSON,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_audit_entity (entity_type, entity_id),
    KEY idx_audit_actor (actor_id)
) ENGINE=InnoDB;

CREATE TABLE linking_requests
(
    hash           VARCHAR(64) PRIMARY KEY,
    discord_id     VARCHAR(20) NOT NULL,
    created_at     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    minecraft_uuid VARCHAR(36),
    status         VARCHAR(20) DEFAULT 'pending',
    expires_at     TIMESTAMP
);

CREATE TABLE linked_accounts
(
    discord_id          VARCHAR(20) PRIMARY KEY,
    minecraft_uuid      VARCHAR(36) UNIQUE NOT NULL,
    linked_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_seen          TIMESTAMP,
    last_known_username VARCHAR(16)
);

CREATE TABLE player_data (
    minecraft_uuid      VARCHAR(36) PRIMARY KEY,
    first_join         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_join          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    playtime_minutes   INTEGER DEFAULT 0
    is_online          BOOLEAN DEFAULT false,
    last_server        VARCHAR(64);
);

CREATE INDEX idx_linking_requests_status ON linking_requests (status);
CREATE INDEX idx_linking_requests_expires_at ON linking_requests (expires_at);
CREATE INDEX idx_linked_accounts_minecraft_uuid ON linked_accounts (minecraft_uuid);
CREATE INDEX idx_player_data_is_online ON player_data (is_online);

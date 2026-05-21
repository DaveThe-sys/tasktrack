CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT UNIQUE NOT NULL,
    username TEXT,
    password_hash TEXT NOT NULL,
    exp INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    category TEXT,
    priority TEXT,
    due_date DATE,
    status TEXT DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS friends (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id_1 INTEGER NOT NULL,
    user_id_2 INTEGER NOT NULL,
    status TEXT DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id_1) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id_2) REFERENCES users (id) ON DELETE CASCADE,
    UNIQUE(user_id_1, user_id_2)
);

CREATE INDEX IF NOT EXISTS idx_user_tasks ON tasks(user_id, status);
CREATE INDEX IF NOT EXISTS idx_user_email ON users(email);

CREATE VIEW IF NOT EXISTS user_performance_summary AS
SELECT
    u.id as user_id,
    u.email,
    u.username,
    u.exp,
    COUNT(t.id) FILTER (WHERE t.status = 'completed') as completed_count,
    COUNT(t.id) FILTER (WHERE t.status != 'completed') as pending_count
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id
GROUP BY u.id;

CREATE TRIGGER IF NOT EXISTS update_exp_on_completion
AFTER UPDATE OF status ON tasks
FOR EACH ROW
WHEN NEW.status = 'completed' AND OLD.status != 'completed'
BEGIN
    UPDATE users SET exp = exp + 25 WHERE id = NEW.user_id;
END;
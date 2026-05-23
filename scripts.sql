PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS sqlite_sequence;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    exp INTEGER DEFAULT 0
);

CREATE TABLE tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    category TEXT,
    priority TEXT,
    due_date TEXT,
    status TEXT DEFAULT 'pending',
    completed_at TEXT,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO users (id, username, email, password, exp) VALUES
(1, 'marcus', 'marcus@example.com', 'scrypt:32768:8:1$YmAesGfH2mN0oH9K$2a7307992a08038c6ae4f7479ee4c9725c0990e3f79d84a4858241300ef6e2069555daa1fddb20ab583462512cdf396ae22ff8b7ac015dedeaf9071b742c3c23', 0),
(2, 'ian', 'ian@example.com', 'scrypt:32768:8:1$YmAesGfH2mN0oH9K$2a7307992a08038c6ae4f7479ee4c9725c0990e3f79d84a4858241300ef6e2069555daa1fddb20ab583462512cdf396ae22ff8b7ac015dedeaf9071b742c3c23', 0),
(3, 'hannah', 'hannah@example.com', 'scrypt:32768:8:1$YmAesGfH2mN0oH9K$2a7307992a08038c6ae4f7479ee4c9725c0990e3f79d84a4858241300ef6e2069555daa1fddb20ab583462512cdf396ae22ff8b7ac015dedeaf9071b742c3c23', 0),
(4, 'gabriel', 'gabriel@example.com', 'scrypt:32768:8:1$YmAesGfH2mN0oH9K$2a7307992a08038c6ae4f7479ee4c9725c0990e3f79d84a4858241300ef6e2069555daa1fddb20ab583462512cdf396ae22ff8b7ac015dedeaf9071b742c3c23', 0),
(5, 'fiona', 'fiona@example.com', 'scrypt:32768:8:1$YmAesGfH2mN0oH9K$2a7307992a08038c6ae4f7479ee4c9725c0990e3f79d84a4858241300ef6e2069555daa1fddb20ab583462512cdf396ae22ff8b7ac015dedeaf9071b742c3c23', 0),
(6, 'eleanor', 'eleanor@example.com', 'scrypt:32768:8:1$YmAesGfH2mN0oH9K$2a7307992a08038c6ae4f7479ee4c9725c0990e3f79d84a4858241300ef6e2069555daa1fddb20ab583462512cdf396ae22ff8b7ac015dedeaf9071b742c3c23', 0),
(7, 'daniel', 'daniel@example.com', 'scrypt:32768:8:1$YmAesGfH2mN0oH9K$2a7307992a08038c6ae4f7479ee4c9725c0990e3f79d84a4858241300ef6e2069555daa1fddb20ab583462512cdf396ae22ff8b7ac015dedeaf9071b742c3c23', 0),
(8, 'charlie', 'charlie@example.com', 'scrypt:32768:8:1$YmAesGfH2mN0oH9K$2a7307992a08038c6ae4f7479ee4c9725c0990e3f79d84a4858241300ef6e2069555daa1fddb20ab583462512cdf396ae22ff8b7ac015dedeaf9071b742c3c23', 0),
(9, 'beatrice', 'beatrice@example.com', 'scrypt:32768:8:1$YmAesGfH2mN0oH9K$2a7307992a08038c6ae4f7479ee4c9725c0990e3f79d84a4858241300ef6e2069555daa1fddb20ab583462512cdf396ae22ff8b7ac015dedeaf9071b742c3c23', 0),
(10, 'alex', 'alex@example.com', 'scrypt:32768:8:1$YmAesGfH2mN0oH9K$2a7307992a08038c6ae4f7479ee4c9725c0990e3f79d84a4858241300ef6e2069555daa1fddb20ab583462512cdf396ae22ff8b7ac015dedeaf9071b742c3c23', 0),
(11, 'daven121', 'batangas.lipa.tipakan@gmail.com', 'scrypt:32768:8:1$A0IkMtyoXqegkOlH$7772f7e9689be7580adeebe3aa99d11ad2f75844d76d1212265bf1881bc06270b6c6e54d615649a0fe9fbe88760bfa3846fce00826e59ae3590ea9a51b3184d8', 0),
(12, 'davenacuna', 'davenacuna426@gmail.com', 'scrypt:32768:8:1$QZatNsVj0ilH0FFs$340d281f603e2080ddc21d643d3558036bb22f696ca1048aed6015bf0c547f372c10398f2ba6827655c45421937720fc22fd8636910c613c6f5e37dbbe2c840c', 0),
(13, 'daven1234', 'davenacuna101@gmail.com', 'scrypt:32768:8:1$V30XfW2iEF6EG1DF$7edf3217502de2754bfb943d0ff7c2e933c94c48437f95c8d6c1b1d4258be0e0600b61df296226806a33992ea6cc80883b1d6a9fdb8dd48ab71ba6a627b6dbc6', 0),
(14, 'daven123', 'daven123@gmail.com', 'scrypt:32768:8:1$YmAesGfH2mN0oH9K$2a7307992a08038c6ae4f7479ee4c9725c0990e3f79d84a4858241300ef6e2069555daa1fddb20ab583462512cdf396ae22ff8b7ac015dedeaf9071b742c3c23', 0);

INSERT INTO tasks (id, user_id, title, description, category, priority, due_date, status, completed_at) VALUES
(1, 14, 'Backup Cluster Data', 'Export a snapshot copy of tasktrack.db to secure local storage.', 'Work', 'Medium', '2026-05-27', 'completed', NULL),
(2, 14, 'Clean Workspace', 'Organize desk setup, cables, and hardware components.', 'Personal', 'Low', '2026-05-24', 'pending', NULL),
(3, 14, 'Draft Project Proposal', 'Outline the core entity-relationship diagram for the next module.', 'School', 'High', '2026-05-30', 'pending', NULL),
(4, 14, 'Gym Session', 'Cardio routine and strength conditioning for 1 hour.', 'Health', 'Medium', '2026-05-25', 'completed', NULL),
(5, 14, 'Push Code to Git', 'Stage, commit, and push the admin gateway updates to GitHub.', 'Work', 'High', '2026-05-24', 'pending', NULL),
(6, 14, 'Update README.md', 'Document the QA testing matrix and initial credentials.', 'School', 'Low', '2026-05-23', 'completed', NULL),
(7, 14, 'Buy Groceries', 'Pick up meal prep ingredients for the upcoming deployment week.', 'Personal', 'Low', '2026-05-26', 'pending', NULL),
(8, 14, 'Fix Session Timeout', 'Investigate why sessionStorage clears unexpectedly on hard refresh.', 'Work', 'High', '2026-05-24', 'completed', NULL),
(9, 14, 'Database Indexing', 'Optimize the user_id foreign key lookups in the sqlite architecture.', 'School', 'Medium', '2026-05-28', 'pending', NULL),
(10, 14, 'Review UI Layout', 'Check the glassmorphic login responsiveness on mobile viewports.', 'Work', 'High', '2026-05-25', 'pending', NULL),
(11, 14, 'do chores', 'clean house', 'Cleaning', 'Medium', '2026-05-24', 'pending', NULL),
(12, 14, '=a', NULL, 'School', 'High', '2026-05-17', 'completed', 'May 17, 2026 at 05:02 PM'),
(13, 14, '=TASKK', 'ayaw ko', 'Personal', 'Low', '2026-05-23', 'completed', 'May 17, 2026 at 04:51 PM'),
(14, 14, '=123123', 'akin lang', NULL, 'Medium', '2026-05-18', 'completed', 'May 16, 2026 at 11:08 PM'),
(15, 14, '=dave123', NULL, 'Work', 'Medium', '2026-05-17', 'completed', 'May 16, 2026 at 10:12 PM'),
(16, 14, 'pogi more', 'yes na yes', 'Personal', 'High', '2026-05-26', 'completed', NULL),
(17, 14, 'Sleeping', 'matolog ng 8 hrs', 'Health', 'Low', '2026-05-17', 'completed', NULL),
(18, 14, 'kakain', NULL, 'Personal', 'Low', '2026-05-19', 'pending', NULL);

INSERT INTO sqlite_sequence (name, seq) VALUES 
('users', 14),
('tasks', 18);
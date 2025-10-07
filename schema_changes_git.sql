- Idempotent starter schema for Azure MySQL
-- Creates a demo table if it does not exist.
CREATE TABLE IF NOT EXISTS demo_ci_cd (
id INT AUTO_INCREMENT PRIMARY KEY,
note VARCHAR(255) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Optional: add a sample row only if table is empty
INSERT INTO demo_ci_cd (note)
SELECT 'first deploy via GitHub Actions'
WHERE NOT EXISTS (SELECT 1 FROM demo_ci_cd LIMIT 1);

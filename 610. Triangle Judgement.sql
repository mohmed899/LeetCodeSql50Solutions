-- Create Triangle table
CREATE TABLE Triangle (
    x INT,
    y INT,
    z INT
);

-- Insert data into Triangle table
INSERT INTO Triangle (x, y, z) VALUES
    (13, 15, 30),
    (10, 20, 15);

select *, IIF (X + Y > Z AND X + Z > Y AND Y + Z > X, 'Yes','No') triangle
from Triangle
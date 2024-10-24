CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,          -- Unique ID for each patient
    first_name VARCHAR(100) NOT NULL,       -- First name of the patient
    last_name VARCHAR(100) NOT NULL,        -- Last name of the patient
    date_of_birth DATE NOT NULL,            -- Date of birth
    gender VARCHAR(10),                     -- Gender (optional)
    contact_number VARCHAR(15),             -- Contact number (optional)
    email VARCHAR(255),                     -- Email (optional)
    address TEXT,                           -- Address (optional)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Record creation time
);
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,      -- Unique ID for each appointment
    patient_id INT REFERENCES patients(patient_id), -- Link to patient
    doctor_name VARCHAR(100) NOT NULL,      -- Name of the doctor
    appointment_date DATE NOT NULL,         -- Appointment date
    appointment_time TIME NOT NULL,         -- Appointment time
    reason TEXT,                            -- Reason for the appointment
    status VARCHAR(50) DEFAULT 'Scheduled', -- Appointment status (e.g., Scheduled, Completed, Canceled)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Record creation time
);

--insert pacients data
INSERT INTO patients (first_name, last_name, date_of_birth, gender, contact_number, email, address)
VALUES
('John', 'Doe', '1985-03-15', 'Male', '555-1234', 'john.doe@example.com', '123 Main St, Anytown, USA'),
('Jane', 'Smith', '1990-07-22', 'Female', '555-5678', 'jane.smith@example.com', '456 Elm St, Anytown, USA'),
('Alice', 'Johnson', '1982-11-30', 'Female', '555-8765', 'alice.j@example.com', '789 Maple St, Anytown, USA'),
('Robert', 'Brown', '1978-02-10', 'Male', '555-4321', 'robert.brown@example.com', '321 Oak St, Anytown, USA'),
('Michael', 'Davis', '1995-05-20', 'Male', '555-1357', 'michael.davis@example.com', '654 Pine St, Anytown, USA'),
('Emily', 'Wilson', '1993-09-18', 'Female', '555-2468', 'emily.wilson@example.com', '987 Cedar St, Anytown, USA'),
('James', 'Taylor', '1988-12-01', 'Male', '555-3691', 'james.taylor@example.com', '159 Birch St, Anytown, USA'),
('Linda', 'Anderson', '1984-06-25', 'Female', '555-7890', 'linda.anderson@example.com', '753 Walnut St, Anytown, USA'),
('David', 'Thomas', '1992-01-11', 'Male', '555-8520', 'david.thomas@example.com', '369 Spruce St, Anytown, USA'),
('Sarah', 'Jackson', '1986-04-05', 'Female', '555-9632', 'sarah.jackson@example.com', '258 Ash St, Anytown, USA');

--insert appointments data
INSERT INTO appointments (patient_id, doctor_name, appointment_date, appointment_time, reason, status)
VALUES
(1, 'Dr. Smith', '2024-11-01', '09:00:00', 'Annual Checkup', 'Scheduled'),
(2, 'Dr. Johnson', '2024-11-03', '10:30:00', 'Follow-up on Blood Test', 'Scheduled'),
(3, 'Dr. Wilson', '2024-11-05', '14:00:00', 'Consultation for Headache', 'Scheduled'),
(4, 'Dr. Lee', '2024-11-07', '11:00:00', 'Routine Examination', 'Scheduled'),
(5, 'Dr. Brown', '2024-11-10', '13:30:00', 'Skin Rash Evaluation', 'Scheduled'),
(6, 'Dr. Taylor', '2024-11-12', '15:00:00', 'Allergy Testing', 'Scheduled'),
(7, 'Dr. Davis', '2024-11-15', '09:30:00', 'Physical Therapy', 'Scheduled'),
(8, 'Dr. Garcia', '2024-11-17', '11:30:00', 'Nutritional Counseling', 'Scheduled'),
(9, 'Dr. Martinez', '2024-11-20', '14:30:00', 'Mental Health Consultation', 'Scheduled'),
(10, 'Dr. Anderson', '2024-11-25', '10:00:00', 'Cardiology Check', 'Scheduled');

--get done the dump backup
/*
# Step 1: Create backup directory inside the container
docker exec my_postgres mkdir -p /backup

# Step 2: Create the backup
docker exec my_postgres pg_dump -U postgres -d pacientes -f /backup/my_database_backup.sql

# Step 3: Verify the backup file creation
docker exec my_postgres ls /backup

# Step 4: Copy the backup to your host (make sure the target directory exists)
docker cp my_postgres:/backup/my_database_backup.sql C:\Users\p_a_u\Documents\ios
*/
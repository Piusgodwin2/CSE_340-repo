CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(155) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL UNIQUE,
    logo_filename VARCHAR(255)
);

-- ========================================
-- Insert sample data: Organizations
-- ========================================
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');


-- ================
-- Create service project table
-- =================
CREATE TABLE Service_project(
	project_id SERIAL PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	Description TEXT NOT NULL,
	location VARCHAR(255) NOT NULL,
	project_date date NOT NULL,
	organization_id INTEGER NOT NULL,
	FOREIGN KEY (organization_id) REFERENCES organization (organization_id)
);

-- ===========================
-- INSERT INTO SERVICE PROJECT
-- ===========================

INSERT INTO Service_project (organization_id, title, Description, location, project_date)
VALUES
-- Organization 1
(1, 'Community Park Cleanup', 'Volunteers pick up litter, trim bushes and repaint benches at the public park.', 'Ibom Park, Uyo', '2026-12-05'),
(1, 'Home Repair Day', 'Repair roofs, doors and windows for elderly residents who cannot afford repairs.', 'Ikot Ekpene Road, Uyo', '2026-12-12'),
(1, 'School Classroom Renovation', 'Repaint classrooms and fix broken desks at a local primary school.', 'Community Primary School, Uyo', '2027-01-09'),
(1, 'Clean Water Well Project', 'Help build and install a protected hand-pump well for a village without clean water.', 'Etinan Village', '2027-01-23'),
(1, 'Playground Construction', 'Build a safe playground with swings and slides for neighborhood children.', 'Akpan Andem Estate, Uyo', '2027-02-06'),

-- Organization 2
(2, 'Community Garden Planting', 'Plant vegetables and fruit trees in a shared garden for local families.', 'Nwaniba Community Field', '2026-12-06'),
(2, 'Food Drive and Distribution', 'Collect food donations and pack them for families in need.', 'Town Hall, Uyo', '2026-12-13'),
(2, 'Farming Skills Workshop', 'Teach youth basic crop planting, soil care and harvesting techniques.', 'Agricultural Training Center, Uyo', '2027-01-10'),
(2, 'Tree Planting Day', 'Plant 200 trees to fight erosion and improve air quality.', 'Uniuyo Permanent Site Road', '2027-02-13'),
(2, 'Harvest Share Market', 'Gather surplus produce from farmers and share it with low-income households.', 'Itam Market Grounds', '2027-03-06'),

-- Organization 3
(3, 'Neighborhood Tutoring Program', 'Free weekend tutoring in maths and English for primary school students.', 'Uyo Public Library', '2026-12-07'),
(3, 'Hospital Visit and Care Packages', 'Visit patients and hand out care packages at a local hospital ward.', 'General Hospital, Uyo', '2026-12-20'),
(3, 'Free Medical Outreach', 'Offer basic health screenings and health education to the community.', 'Ewet Housing Estate', '2027-01-16'),
(3, 'Computer Literacy Class', 'Teach teenagers basic computer skills such as typing and internet safety.', 'Youth Center, Uyo', '2027-02-20'),
(3, 'Clothing Donation Drive', 'Collect and sort gently used clothes for families displaced by flooding.', 'Church Hall, Uyo', '2027-03-13');

SELECT organization_id, COUNT(*) AS total_projects
FROM service_project
GROUP BY organization_id
ORDER BY organization_id;
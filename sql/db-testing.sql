INSERT INTO users VALUES ("jdoe", "John", "Doe", "jdoe@example.com", "jdoe", "Customer", "");
INSERT INTO users VALUES ("jdone", "John", "Done", "jdone@example.com", "jdone", "Freelancer", "");

DELETE FROM users WHERE username='';
DELETE FROM category WHERE title='';
DELETE FROM project WHERE projectId=0;

SELECT * FROM users;
SELECT * FROM category;
SELECT * FROM project;

INSERT INTO category VALUES ("Graphics & Design", "You've got the idea, now make it official with the perfect logo or design."), 
							("Digital Marketing", "Do more than advertise. Get digital marketing services for the growth you need."), 
							("Writing & Translation", "Have a way with words. Get copy, translation & editorial work from freelancers."), 
							("Video & Animation", "Your story's unique. Tell it differently with custom video & animation services."), 
							("Music & Audio", "You've got a message. Let the world hear it with music, audio & voice services."), 
							("Programming & Tech", "Get all the technical bells and whistles without paying for a programming degree."), 
							("Business", "Your business = your passion. Outsource smaller tasks so you can focus on growth."), 
							("Lifestyle", "Find fun and positive lifestyle tips to help you live your best."), 
							("Other", null);

UPDATE project SET chat='' where projectId>0;



-- insert data into StudyAbroad database
/
INSERT INTO GradeLevel VALUES ('Freshman');
INSERT INTO GradeLevel VALUES ('Sophomore');
INSERT INTO GradeLevel VALUES ('Junior');
INSERT INTO GradeLevel VALUES ('Senior');
INSERT INTO GradeLevel VALUES ('Other');

INSERT INTO SemesterCode VALUES ('F');
INSERT INTO SemesterCode VALUES ('S');
INSERT INTO SemesterCode VALUES ('I');

INSERT INTO Department VALUES ('CS', 'Computer Science');
INSERT INTO Department VALUES ('IS', 'Information Systems');
INSERT INTO Department VALUES ('MATH', 'Mathematics');
INSERT INTO Department VALUES ('STAT', 'Statistics');
INSERT INTO Department VALUES ('ENG', 'English');
INSERT INTO Department VALUES ('GERM', 'German');
INSERT INTO Department VALUES ('ENGR', 'Engineering');
INSERT INTO Department VALUES ('BUS', 'Business');
INSERT INTO Department VALUES ('EDU', 'Education');
INSERT INTO Department VALUES ('ECON', 'Economics');
INSERT INTO Department VALUES ('SPAN', 'Spanish');
INSERT INTO Department VALUES ('ART', 'Art');
INSERT INTO Department VALUES ('BIO', 'Biology');
INSERT INTO Department VALUES ('CHEM', 'Chemistry');
INSERT INTO Department VALUES ('GEOG', 'Geography');
INSERT INTO Department VALUES ('GEOL', 'Geology');
INSERT INTO Department VALUES ('REL', 'Religion');

INSERT INTO Professor VALUES (1, 'Branden','Nelson', 'CS');
INSERT INTO Professor VALUES (2, 'Echo','Welch', 'IS');
INSERT INTO Professor VALUES (3, 'Henry','Bell', 'MATH');
INSERT INTO Professor VALUES (4, 'Luke','Calhoun', 'STAT');
INSERT INTO Professor VALUES (5, 'Hedley','Valentine', 'ENG');
INSERT INTO Professor VALUES (6, 'Darrel','Herman', 'GERM');
INSERT INTO Professor VALUES (7, 'Chelsea','Villarreal', 'ENGR');
INSERT INTO Professor VALUES (8, 'Steel','Espinoza', 'BUS');
INSERT INTO Professor VALUES (9, 'Latifah','Dale', 'EDU');
INSERT INTO Professor VALUES (10, 'Rigel','Arnold', 'ECON');
INSERT INTO Professor VALUES (11, 'Zelenia','Webb', 'SPAN');
INSERT INTO Professor VALUES (12, 'Kalia','Gallegos', 'ART');
INSERT INTO Professor VALUES (13, 'Rashad','Blake', 'BIO');
INSERT INTO Professor VALUES (14, 'Sybil','Haney', 'CHEM');
INSERT INTO Professor VALUES (15, 'Clayton','Holman', 'GEOG');
INSERT INTO Professor VALUES (16, 'Leilani','Gilliam', 'REL');
INSERT INTO Professor VALUES (17, 'Bertha','Cherry', 'CS');
INSERT INTO Professor VALUES (18, 'Blair','King', 'ECON');
INSERT INTO Professor VALUES (19, 'Elijah','Hendricks', 'CHEM');
INSERT INTO Professor VALUES (20, 'Brynn','Rivera', 'GEOL');
INSERT INTO Professor VALUES (21, 'Regan','Hart', 'SPAN');

INSERT INTO Program VALUES (1,'CS',333,21,'S','Azerbaijan','Trier',2254.56,'ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec',25);
INSERT INTO Program VALUES (2,'IS',126,12,'S','Barbados','Christchurch',225.45,'tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus',24);
INSERT INTO Program VALUES (3,'CS',246,19,'F','Germany','Berlin',1897.15,'ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec',31);

INSERT INTO Program VALUES (4,'ENGR',264,17,'S','Tunisia','Bionaz',4154.56,'eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum',21);
INSERT INTO Program VALUES (5,'SPAN',274,18,'S','Guatemala','Sluis',354.56,'lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus',24);
INSERT INTO Program VALUES (6,'GEOG',148,1,'S','Bahamas','Flamierge',1254.56,'lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam',23);
INSERT INTO Program VALUES (7,'CHEM',244,16,'F','Germany','Whitewater Region Township',2254.99,'in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non',28);
INSERT INTO Program VALUES (8,'SPAN',172,6,'F','Sierra Leone','San Lorenzo',2345.21,'aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum',26);
INSERT INTO Program VALUES (9,'GEOG',124,4,'F','Slovakia','Grand-RosiŽre-Hottomont',2654.46,'dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque',34);
INSERT INTO Program VALUES (10,'STAT',290,14,'F','Reunion','Reno',2134.60,'ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin',23);
INSERT INTO Program VALUES (11,'IS',192,8,'F','Guam','Charleroi',1254.96,'dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget',23);
INSERT INTO Program VALUES (12,'CS',161,4,'F','Latvia','Perth',321.56,'tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus.',33);
INSERT INTO Program VALUES (13,'BUS',214,4,'I','France','Paris',1154.98,'tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus.',21);
INSERT INTO Program VALUES (14,'ECON',135,9,'F','Japan','Saint-Remy-Geest',454.96,'volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus',37);
INSERT INTO Program VALUES (15,'SPAN',252,18,'F','Rwanda','Greenock',1287.66,'commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede.',31);
INSERT INTO Program VALUES (16,'CS',338,18,'I','Lithuania','Kawawachikamach',478.85,'ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor',40);
INSERT INTO Program VALUES (17,'GEOL',110,11,'I','Turkey','Kelowna',2897.36,'vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque',39);
INSERT INTO Program VALUES (18,'GEOL',223,13,'I','French Polynesia','Erode',NULL,'a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',35);
INSERT INTO Program VALUES (19,'GEOG',236,15,'I','Russian Federation','Harrisburg',987.36,'metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget',38);
INSERT INTO Program VALUES (21,'STAT',126,17,'I','Central African Republic','Santa Marina',2254.56,'tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse',26);
INSERT INTO Program VALUES (22,'SPAN',384,3,'I','Jersey','Buzenol',NULL,'congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum',33);
INSERT INTO Program VALUES (23,'GEOL',149,20,'I','Djibouti','Villa Alemana',NULL,'tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula',40);
INSERT INTO Program VALUES (24,'IS',129,5,'I','Burkina Faso','Gulfport',1144.56,'eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut',32);
INSERT INTO Participant VALUES (1, 'Paige', 'Brinks', '07-NOV-1994', 'CS', 'Senior');
INSERT INTO Participant VALUES (2, 'Jennah', 'Maier', '12-JAN-1991', 'ENGR', 'Junior');
INSERT INTO Participant VALUES (3, 'Spencer', 'Veltema', '20-APR-1991', 'ART', 'Freshman');
INSERT INTO Participant VALUES (4, 'Victoria', 'Parr', '30-MAR-1978', 'SPAN', 'Sophomore');
INSERT INTO Participant VALUES (5, 'Rachel', 'Dieleman', '12-JAN-1991', 'ENGR', 'Freshman');
INSERT INTO Participant VALUES (6, 'Lydia', 'Cupery', '25-JUL-1988', 'BUS', 'Freshman');
INSERT INTO Participant VALUES (7, 'Beka', 'Agava', '20-NOV-1999', 'CHEM', 'Sophomore');
INSERT INTO Participant VALUES (8, 'Joel', 'Steitenhouwer', '02-DEC-1999', 'MATH', 'Junior');
INSERT INTO Participant VALUES (9, 'Maggie', 'Scannell', '02-JAN-1999', 'BUS', 'Junior');
INSERT INTO Participant VALUES (10, 'Ruth', 'Brinks', '10-APR-2001', 'ART', 'Senior');
INSERT INTO Participant VALUES (11, 'Timothy', 'Brinks', '07-AUG-1987', 'REL', 'Freshman');
INSERT INTO Participant VALUES (12, 'Derek', 'John', '28-FEB-1989', 'SPAN', 'Sophomore');
INSERT INTO Participant VALUES (13, 'Jean', 'Smith', '12-JAN-1991', 'CS', 'Junior');
INSERT INTO Participant VALUES (14, 'Natalie', 'Ogden', '12-DEC-2006', 'ENG', 'Freshman');
INSERT INTO Participant VALUES (15, 'Phil', 'Langdon', '03-MAR-1995', 'IS', 'Sophomore');
INSERT INTO Participant VALUES (16, 'Brian', 'Scott', '28-JUN-1997', 'BIO', 'Senior');
INSERT INTO Participant VALUES (17, 'Alexander', 'Abraham', '02-JUL-1994', 'GERM', 'Junior');
INSERT INTO Participant VALUES (18, 'Thomas', 'Kerr', '01-DEC-1996', 'STAT', 'Sophomore');
INSERT INTO Participant VALUES (19, 'Jennifer', 'Tucker', '14-FEB-1992', 'EDU', 'Freshman');
INSERT INTO Participant VALUES (20, 'Benjamin', 'Allan', '22-JAN-1995', 'GEOL', 'Junior');
INSERT INTO Participant VALUES (21, 'Michelle', 'Davidson', '03-MAY-1988', 'GEOG', 'Senior');
INSERT INTO Participant VALUES (22, 'Penelope', 'Bond', '04-JUL-1985', 'IS', 'Senior');

INSERT INTO ProgramParticipant VALUES (18,8);
INSERT INTO ProgramParticipant VALUES (14,1);
INSERT INTO ProgramParticipant VALUES (9,1);
INSERT INTO ProgramParticipant VALUES (6,7);
INSERT INTO ProgramParticipant VALUES (21,19);
INSERT INTO ProgramParticipant VALUES (3,11);
INSERT INTO ProgramParticipant VALUES (10,20);
INSERT INTO ProgramParticipant VALUES (14,5);
INSERT INTO ProgramParticipant VALUES (12,14);
INSERT INTO ProgramParticipant VALUES (10,22);
INSERT INTO ProgramParticipant VALUES (9,7);
INSERT INTO ProgramParticipant VALUES (10,16);
INSERT INTO ProgramParticipant VALUES (17,12);
INSERT INTO ProgramParticipant VALUES (12,7);
INSERT INTO ProgramParticipant VALUES (8,5);
INSERT INTO ProgramParticipant VALUES (3,19);
INSERT INTO ProgramParticipant VALUES (17,10);
INSERT INTO ProgramParticipant VALUES (5,3);
INSERT INTO ProgramParticipant VALUES (21,10);
INSERT INTO ProgramParticipant VALUES (12,8);
INSERT INTO ProgramParticipant VALUES (5,6);
INSERT INTO ProgramParticipant VALUES (4,7);
INSERT INTO ProgramParticipant VALUES (8,22);
INSERT INTO ProgramParticipant VALUES (19,22);
INSERT INTO ProgramParticipant VALUES (1,21);
INSERT INTO ProgramParticipant VALUES (8,12);
INSERT INTO ProgramParticipant VALUES (17,11);
INSERT INTO ProgramParticipant VALUES (17,15);
INSERT INTO ProgramParticipant VALUES (8,2);
INSERT INTO ProgramParticipant VALUES (1,19);
INSERT INTO ProgramParticipant VALUES (5,21);
INSERT INTO ProgramParticipant VALUES (2,4);
INSERT INTO ProgramParticipant VALUES (2,20);
INSERT INTO ProgramParticipant VALUES (24,12);
INSERT INTO ProgramParticipant VALUES (24,3);
INSERT INTO ProgramParticipant VALUES (1,1);
INSERT INTO ProgramParticipant VALUES (1,2);

INSERT INTO Review VALUES (1,20,17,'hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus',4);
INSERT INTO Review VALUES (2,15,12,'a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed',5);
INSERT INTO Review VALUES (3,15,14,'ac mattis semper, dui lectus rutrum urna, nec luctus felis purus',2);
INSERT INTO Review VALUES (4,12,15,'Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat',3);
INSERT INTO Review VALUES (5,18,11,'aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat',4);
INSERT INTO Review VALUES (6,14,12,'enim. Mauris quis turpis vitae purus gravida',5);
INSERT INTO Review VALUES (7,3,18,'aliquet vel, vulputate eu, odio. Phasellus at augue',4);
INSERT INTO Review VALUES (8,18,8,'laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae',3);
INSERT INTO Review VALUES (9,12,11,'vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed,',1);
INSERT INTO Review VALUES (10,11,22,'cursus. Integer mollis. Integer tincidunt',2);
INSERT INTO Review VALUES (11,9,4,'tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui,',2);
INSERT INTO Review VALUES (12,12,5,'nec, mollis vitae, posuere at, velit.',4);
INSERT INTO Review VALUES (13,14,7,'ipsum. Phasellus vitae mauris sit amet lorem semper auctor.',2);
INSERT INTO Review VALUES (14,12,22,'quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu,',4);
INSERT INTO Review VALUES (15,9,17,'Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin',1);
INSERT INTO Review VALUES (16,10,15,'placerat velit. Quisque varius. Nam porttitor',5);
INSERT INTO Review VALUES (17,14,9,'Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus',3);
INSERT INTO Review VALUES (18,6,23,'tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est',5);
INSERT INTO Review VALUES (19,20,10,'tempus non, lacinia at, iaculis quis, pede. Praesent',2);
INSERT INTO Review VALUES (20,13,4,'ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris',5);
INSERT INTO Review VALUES (21,15,16,'dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.',1);

INSERT INTO Trip VALUES (1,1,'nisi','1 hr','17.03','eget nisi dictum augue malesuada malesuada. Integer id magna et');
INSERT INTO Trip VALUES (2,1,'Proin','all day.','2.88','lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus');
INSERT INTO Trip VALUES (3,1,'dui,','4 hrs.','65.95','pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit');
INSERT INTO Trip VALUES (4,5,'rutrum','3 days','17.61','lobortis tellus justo sit amet nulla. Donec non justo. Proin');
INSERT INTO Trip VALUES (5,4,'Vivamus','4 hrs','81.26','ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris');
INSERT INTO Trip VALUES (6,3,'Aenean','1 weekend','12.06','consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat');
INSERT INTO Trip VALUES (7,3,'erat','2 days','32.22','consequat enim diam vel arcu. Curabitur ut odio vel est');
INSERT INTO Trip VALUES (8,3,'egestas,','8 hours','99.21','at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac');
INSERT INTO Trip VALUES (9,13,'velit','all day','23.81','malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis');
INSERT INTO Trip VALUES (10,12,'tellus','6 hrs','84.62','non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum');
INSERT INTO Trip VALUES (11,10,'faucibus','30 minutes','0.55','Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum');
INSERT INTO Trip VALUES (12,9,'vestibulum.','4 hrs','8.84','id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus');
INSERT INTO Trip VALUES (13,8,'et','all day','34.48','id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor,');
INSERT INTO Trip VALUES (14,7,'Duis','2 days','7.57','Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris');
INSERT INTO Trip VALUES (15,6,'nascetur','7 days.','52.56','laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi');
INSERT INTO Trip VALUES (16,5,'at,','3 hrs','83.16','non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh.');
INSERT INTO Trip VALUES (17,3,'sodales.','1 hr,','75.07','venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec');
INSERT INTO Trip VALUES (18,4,'molestie','all day.','11.51','ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede');
INSERT INTO Trip VALUES (19,2,'cursus.','1 hr.','50.57','purus mauris a nunc. In at pede. Cras vulputate velit');

INSERT INTO Attraction VALUES (1,'convallis','San Esteban','1 hr','59.11');
INSERT INTO Attraction VALUES (2,'Integer','Hameln','5 hrs','26.38');
INSERT INTO Attraction VALUES (3,'magna','Sokoto','3 hrs','93.30');
INSERT INTO Attraction VALUES (4,'gravida','Frutillar','1 day','15.39');
INSERT INTO Attraction VALUES (5,'mollis','Corte Brugnatella','4 hrs','92.07');
INSERT INTO Attraction VALUES (6,'eu','Zuienkerke','30 min','61.00');
INSERT INTO Attraction VALUES (7,'elit.','Hachy','2 hrs','39.00');
INSERT INTO Attraction VALUES (8,'non','Edmonton','1 day','27.57');
INSERT INTO Attraction VALUES (9,'et','Genappe','4 hrs','8.78');
INSERT INTO Attraction VALUES (10,'consequat','Boncelles','30 min.','44.09');
INSERT INTO Attraction VALUES (11,'Aliquam','Bulzi','3 hrs','0.80');
INSERT INTO Attraction VALUES (12,'non','Graneros','1 hr','96.76');
INSERT INTO Attraction VALUES (13,'ullamcorper','Scala Coeli','4 hrs','2.37');
INSERT INTO Attraction VALUES (14,'semper','Orai','all day','87.03');
INSERT INTO Attraction VALUES (15,'ut','Harrogate','2 hrs','88.38');
INSERT INTO Attraction VALUES (16,'et','Wernigerode','30 min','26.43');
INSERT INTO Attraction VALUES (17,'Cras','Rockingham','8 hrs','87.32');
INSERT INTO Attraction VALUES (18,'ultrices','Vänersborg','1 day','38.88');
INSERT INTO Attraction VALUES (19,'nibh','Bhagalpur','2 hrs','47.45');

INSERT INTO TripAttraction VALUES (19,18,'21-JAN-2014');
INSERT INTO TripAttraction VALUES (3,2,'12-FEB-2015');
INSERT INTO TripAttraction VALUES (8,16,'30-APR-2014');
INSERT INTO TripAttraction VALUES (1,12,'29-NOV-2013');
INSERT INTO TripAttraction VALUES (17,19,'12-MAR-2014');
INSERT INTO TripAttraction VALUES (12,5,'16-MAY-2017');
INSERT INTO TripAttraction VALUES (5,9,'19-DEC-2015');
INSERT INTO TripAttraction VALUES (4,1,'07-JAN-2016');
INSERT INTO TripAttraction VALUES (18,7,'05-APR-2017');
INSERT INTO TripAttraction VALUES (16,16,'03-JUN-2010');
INSERT INTO TripAttraction VALUES (19,8,'04-JUL-2009');
INSERT INTO TripAttraction VALUES (3,9,'03-APR-2008');
INSERT INTO TripAttraction VALUES (7,1,'18-APR-2007');
INSERT INTO TripAttraction VALUES (6,7,'19-NOV-2006');
INSERT INTO TripAttraction VALUES (1,16,'27-DEC-2012');
INSERT INTO TripAttraction VALUES (7,11,'26-MAY-2015');
INSERT INTO TripAttraction VALUES (6,16,'24-JUN-2015');
INSERT INTO TripAttraction VALUES (2,19,'10-AUG-2016');
INSERT INTO TripAttraction VALUES (1,1,'03-JUN-2010');
INSERT INTO TripAttraction VALUES (1,2,'03-JUN-2010');
INSERT INTO TripAttraction VALUES (1,3,'03-JUN-2010');


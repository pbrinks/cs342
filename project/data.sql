-- insert data into StudyAbroad database
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

INSERT INTO Professor VALUES (professorSequence.nextval, 'Branden','Nelson', 'CS');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Echo','Welch', 'IS');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Henry','Bell', 'MATH');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Luke','Calhoun', 'STAT');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Hedley','Valentine', 'ENG');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Darrel','Herman', 'GERM');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Chelsea','Villarreal', 'ENGR');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Steel','Espinoza', 'BUS');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Latifah','Dale', 'EDU');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Rigel','Arnold', 'ECON');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Zelenia','Webb', 'SPAN');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Kalia','Gallegos', 'ART');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Rashad','Blake', 'BIO');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Sybil','Haney', 'CHEM');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Clayton','Holman', 'GEOG');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Leilani','Gilliam', 'REL');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Bertha','Cherry', 'CS');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Blair','King', 'ECON');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Elijah','Hendricks', 'CHEM');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Brynn','Rivera', 'GEOL');
INSERT INTO Professor VALUES (professorSequence.nextval, 'Regan','Hart', 'SPAN');

INSERT INTO Program VALUES (programSequence.nextval,'CS',333,21,'S','Azerbaijan','Trier',2254.56,'ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec',25);
INSERT INTO Program VALUES (programSequence.nextval,'IS',126,12,'S','Barbados','Christchurch',225.45,'tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus',24);
INSERT INTO Program VALUES (programSequence.nextval,'CS',246,19,'F','Germany','Berlin',1897.15,'ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec',31);
INSERT INTO Program VALUES (programSequence.nextval,'ENGR',264,17,'S','Tunisia','Bionaz',4154.56,'eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum',21);
INSERT INTO Program VALUES (programSequence.nextval,'SPAN',274,18,'S','Guatemala','Sluis',354.56,'lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus',24);
INSERT INTO Program VALUES (programSequence.nextval,'GEOG',148,1,'S','Bahamas','Flamierge',1254.56,'lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam',23);
INSERT INTO Program VALUES (programSequence.nextval,'CHEM',244,16,'F','Germany','Whitewater Region Township',2254.99,'in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non',28);
INSERT INTO Program VALUES (programSequence.nextval,'SPAN',172,6,'F','Sierra Leone','San Lorenzo',2345.21,'aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum',26);
INSERT INTO Program VALUES (programSequence.nextval,'GEOG',124,4,'F','Slovakia','Grand-RosiŽre-Hottomont',2654.46,'dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque',34);
INSERT INTO Program VALUES (programSequence.nextval,'STAT',290,14,'F','Reunion','Reno',2134.60,'ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin',23);
INSERT INTO Program VALUES (programSequence.nextval,'IS',192,8,'F','Guam','Charleroi',1254.96,'dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget',23);
INSERT INTO Program VALUES (programSequence.nextval,'CS',161,4,'F','Latvia','Perth',321.56,'tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus.',33);
INSERT INTO Program VALUES (programSequence.nextval,'BUS',214,4,'I','France','Paris',1154.98,'tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus.',21);
INSERT INTO Program VALUES (programSequence.nextval,'ECON',135,9,'F','Japan','Saint-Remy-Geest',454.96,'volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus',37);
INSERT INTO Program VALUES (programSequence.nextval,'SPAN',252,18,'F','Rwanda','Greenock',1287.66,'commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede.',31);
INSERT INTO Program VALUES (programSequence.nextval,'CS',338,18,'I','Lithuania','Kawawachikamach',478.85,'ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor',40);
INSERT INTO Program VALUES (programSequence.nextval,'GEOL',110,11,'I','Turkey','Kelowna',2897.36,'vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque',39);
INSERT INTO Program VALUES (programSequence.nextval,'GEOL',223,13,'I','French Polynesia','Erode',NULL,'a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',35);
INSERT INTO Program VALUES (programSequence.nextval,'GEOG',236,15,'I','Russian Federation','Harrisburg',987.36,'metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget',38);
INSERT INTO Program VALUES (programSequence.nextval,'STAT',126,17,'I','Central African Republic','Santa Marina',2254.56,'tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse',26);
INSERT INTO Program VALUES (programSequence.nextval,'SPAN',384,3,'I','Jersey','Buzenol',NULL,'congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum',33);
INSERT INTO Program VALUES (programSequence.nextval,'GEOL',149,20,'I','Djibouti','Villa Alemana',NULL,'tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula',40);
INSERT INTO Program VALUES (programSequence.nextval,'IS',129,5,'I','Burkina Faso','Gulfport',1144.56,'eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut',32);

INSERT INTO Participant VALUES (participantSequence.nextval, 'Paige', 'Brinks', '07-NOV-1994', 'CS', 'Senior');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Jennah', 'Maier', '12-JAN-1991', 'ENGR', 'Junior');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Spencer', 'Veltema', '20-APR-1991', 'ART', 'Freshman');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Victoria', 'Parr', '30-MAR-1978', 'SPAN', 'Sophomore');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Rachel', 'Dieleman', '12-JAN-1991', 'ENGR', 'Freshman');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Lydia', 'Cupery', '25-JUL-1988', 'BUS', 'Freshman');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Beka', 'Agava', '20-NOV-1999', 'CHEM', 'Sophomore');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Joel', 'Steitenhouwer', '02-DEC-1999', 'MATH', 'Junior');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Maggie', 'Scannell', '02-JAN-1999', 'BUS', 'Junior');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Ruth', 'Brinks', '10-APR-2001', 'ART', 'Senior');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Timothy', 'Brinks', '07-AUG-1987', 'REL', 'Freshman');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Derek', 'John', '28-FEB-1989', 'SPAN', 'Sophomore');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Jean', 'Smith', '12-JAN-1991', 'CS', 'Junior');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Natalie', 'Ogden', '12-DEC-2006', 'ENG', 'Freshman');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Phil', 'Langdon', '03-MAR-1995', 'IS', 'Sophomore');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Brian', 'Scott', '28-JUN-1997', 'BIO', 'Senior');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Alexander', 'Abraham', '02-JUL-1994', 'GERM', 'Junior');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Thomas', 'Kerr', '01-DEC-1996', 'STAT', 'Sophomore');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Jennifer', 'Tucker', '14-FEB-1992', 'EDU', 'Freshman');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Benjamin', 'Allan', '22-JAN-1995', 'GEOL', 'Junior');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Michelle', 'Davidson', '03-MAY-1988', 'GEOG', 'Senior');
INSERT INTO Participant VALUES (participantSequence.nextval, 'Penelope', 'Bond', '04-JUL-1985', 'IS', 'Senior');

INSERT INTO Review VALUES (20,17,'hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus',4);
INSERT INTO Review VALUES (15,12,'a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed',5);
INSERT INTO Review VALUES (15,14,'ac mattis semper, dui lectus rutrum urna, nec luctus felis purus',2);
INSERT INTO Review VALUES (12,15,'Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat',3);
INSERT INTO Review VALUES (18,11,'aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat',4);
INSERT INTO Review VALUES (14,12,'enim. Mauris quis turpis vitae purus gravida',5);
INSERT INTO Review VALUES (3,18,'aliquet vel, vulputate eu, odio. Phasellus at augue',4);
INSERT INTO Review VALUES (18,8,'laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae',3);
INSERT INTO Review VALUES (12,11,'vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed,',1);
INSERT INTO Review VALUES (11,22,'cursus. Integer mollis. Integer tincidunt',2);
INSERT INTO Review VALUES (9,4,'tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui,',2);
INSERT INTO Review VALUES (12,5,'nec, mollis vitae, posuere at, velit.',4);
INSERT INTO Review VALUES (14,7,'ipsum. Phasellus vitae mauris sit amet lorem semper auctor.',2);
INSERT INTO Review VALUES (12,22,'quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu,',4);
INSERT INTO Review VALUES (9,17,'Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin',1);
INSERT INTO Review VALUES (10,15,'placerat velit. Quisque varius. Nam porttitor',5);
INSERT INTO Review VALUES (14,9,'Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus',3);
INSERT INTO Review VALUES (6,23,'tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est',5);
INSERT INTO Review VALUES (20,10,'tempus non, lacinia at, iaculis quis, pede. Praesent',2);
INSERT INTO Review VALUES (13,4,'ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris',5);
INSERT INTO Review VALUES (15,16,'dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.',1);
INSERT INTO Review VALUES (21,1,'It was great!',5);
INSERT INTO Review VALUES (19,1,'10/10 would recommend.',5);
INSERT INTO Review VALUES (7,1,'It sucked',1);
INSERT INTO Review VALUES (8,15,null,null);
INSERT INTO Review VALUES (9,16,null,null);
INSERT INTO Review VALUES (10,17,null,null);
INSERT INTO Review VALUES (11,18,null,null);
INSERT INTO Review VALUES (12,19,null,null);
INSERT INTO Review VALUES (13,1,null,null);
INSERT INTO Review VALUES (14,1,null,null);
INSERT INTO Review VALUES (15,1,null,null);
INSERT INTO Review VALUES (16,1,null,null);
INSERT INTO Review VALUES (17,1,null,null);


INSERT INTO Trip VALUES (tripSequence.nextval,1,'nisi','1 hr','17.03','eget nisi dictum augue malesuada malesuada. Integer id magna et');
INSERT INTO Trip VALUES (tripSequence.nextval,1,'Proin','all day.','2.88','lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus');
INSERT INTO Trip VALUES (tripSequence.nextval,1,'dui,','4 hrs.','65.95','pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit');
INSERT INTO Trip VALUES (tripSequence.nextval,5,'rutrum','3 days','17.61','lobortis tellus justo sit amet nulla. Donec non justo. Proin');
INSERT INTO Trip VALUES (tripSequence.nextval,4,'Vivamus','4 hrs','81.26','ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris');
INSERT INTO Trip VALUES (tripSequence.nextval,3,'Aenean','1 weekend','12.06','consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat');
INSERT INTO Trip VALUES (tripSequence.nextval,3,'erat','2 days','32.22','consequat enim diam vel arcu. Curabitur ut odio vel est');
INSERT INTO Trip VALUES (tripSequence.nextval,3,'egestas,','8 hours','99.21','at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac');
INSERT INTO Trip VALUES (tripSequence.nextval,13,'velit','all day','23.81','malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis');
INSERT INTO Trip VALUES (tripSequence.nextval,12,'tellus','6 hrs','84.62','non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum');
INSERT INTO Trip VALUES (tripSequence.nextval,10,'faucibus','30 minutes','0.55','Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum');
INSERT INTO Trip VALUES (tripSequence.nextval,9,'vestibulum.','4 hrs','8.84','id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus');
INSERT INTO Trip VALUES (tripSequence.nextval,8,'et','all day','34.48','id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor,');
INSERT INTO Trip VALUES (tripSequence.nextval,7,'Duis','2 days','7.57','Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris');
INSERT INTO Trip VALUES (tripSequence.nextval,6,'nascetur','7 days.','52.56','laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi');
INSERT INTO Trip VALUES (tripSequence.nextval,5,'at,','3 hrs','83.16','non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh.');
INSERT INTO Trip VALUES (tripSequence.nextval,3,'sodales.','1 hr,','75.07','venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec');
INSERT INTO Trip VALUES (tripSequence.nextval,4,'molestie','all day.','11.51','ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede');
INSERT INTO Trip VALUES (tripSequence.nextval,2,'cursus.','1 hr.','50.57','purus mauris a nunc. In at pede. Cras vulputate velit');

INSERT INTO Attraction VALUES (attractionSequence.nextval,'convallis','San Esteban','1 hr','59.11');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'Integer','Hameln','5 hrs','26.38');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'magna','Sokoto','3 hrs','93.30');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'gravida','Frutillar','1 day','15.39');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'mollis','Corte Brugnatella','4 hrs','92.07');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'eu','Zuienkerke','30 min','61.00');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'elit.','Hachy','2 hrs','39.00');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'non','Edmonton','1 day','27.57');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'et','Genappe','4 hrs','8.78');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'consequat','Boncelles','30 min.','44.09');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'Aliquam','Bulzi','3 hrs','0.80');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'non','Graneros','1 hr','96.76');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'ullamcorper','Scala Coeli','4 hrs','2.37');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'semper','Orai','all day','87.03');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'ut','Harrogate','2 hrs','88.38');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'et','Wernigerode','30 min','26.43');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'Cras','Rockingham','8 hrs','87.32');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'ultrices','Vänersborg','1 day','38.88');
INSERT INTO Attraction VALUES (attractionSequence.nextval,'nibh','Bhagalpur','2 hrs','47.45');

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


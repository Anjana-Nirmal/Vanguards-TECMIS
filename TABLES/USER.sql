CREATE TABLE USER(                           --USER Table structure
    User_Id     VARCHAR(20),
    NIC CHAR(20) UNIQUE,
    F_name VARCHAR(50),
    L_name VARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10),
    `Address` VARCHAR(50),
    Contact_no VARCHAR(20),
    Email VARCHAR(50),
    `Role` ENUM('STUDENT', 'LECTURER', 'DEAN', 'TO','ADMIN') NOT NULL,
    PRIMARY KEY(User_Id)
);





-------------INSERT DATA TO USER


INSERT INTO USER (User_Id, NIC, F_name, L_name, DOB, Gender, Address, Contact_no, Email, Role) VALUES
('TG/2019/1018', '199956674529', 'W.Sahan', 'Sandaru', '1999-11-16', 'M', '3/1 Athurugiriya Road, Homagama', '0712345689', 'sahan.sandaru89@gmail.com', 'STUDENT'),
('TG/2020/1095', '200067785630', 'D.R.Lakshani', 'Bandara', '2000-04-07', 'F', '421/5 Daham Mawatha, Rathmalana', '0723456781', 'd.r.lakshani.b@gmail.com', 'STUDENT'),
('TG/2021/1152', '200178896741', 'J.L.Madhara', 'Senevirathne', '2001-05-21', 'F', 'No. 23/5 Polwathumodara, Mirissa', '0734567894', 'j.l.madhara.senevi@gmail.com', 'STUDENT'),
('TG/2021/1174', '200189907852', 'J.Mahesh', 'Harshana', '2001-10-29', 'M', 'No. 45 Mirihanawatta, Kathaluwa', '0745678912', 'j.mahesh.harshana2024@gmail.com', 'STUDENT'),
('TG/2021/1232', '200190018963', 'R.M.W.Induwara', 'Lakshitha', '2001-03-02', 'M', '1/1 Mihidumawatha Polwaththa', '0756789023', 'rmw.induwara.lakshi@gmail.com', 'STUDENT'),
('TG/2021/1246', '200101129074', 'R.M.Dinithi', 'Malshani', '2001-07-19', 'F', 'no.88 Mahaweli Street, Kegalle', '0767890134', 'rmd.malshani.dinithi@gmail.com', 'STUDENT'),
('TG/2020/1064', '200012230185', 'U.V.Ashan', 'Kavinda', '2000-02-20', 'M', '45/3 Kaliyadasa Road, Mathara', '0778901245', 'uva.ashan.kavinda123@gmail.com', 'STUDENT'),
('TG/2021/1125', '200123341296', 'S.M.Ishara', 'Sandamali', '2001-08-11', 'F', 'No. 213/C, Anagarika Dharmapala Mawatha, Dehiwala', '0789012356', 'smi.sandamali.ishara@gmail.com', 'STUDENT'),
('TG/2022/1301', '200234452307', 'M.G.Sumudu', 'Piyumika', '2002-07-20', 'M', '35, Anagarika Dharmapala Mw, Matara', '0790123467', 'mg.sumudu.piyumika@gmail.com', 'STUDENT'),
('TG/2022/1302', '200245563418', 'U.G.Kasun', 'Udagedara', '2002-04-02', 'M', '103, Post Office Road, Trincomalee', '0710234578', 'ug.kasun.udagedara2024@gmail.com', 'STUDENT'),
('TG/2022/1348', '200256674529', 'H.M.Tharushika', 'Wimanshi', '2002-03-25', 'F', '84, Badulla Road, Nuwara Eliya', '0721345689', 'hm.tharushika.wimanshi@gmail.com', 'STUDENT'),
('TG/2022/1349', '200167785630', 'L.M.Tharindu', 'Perera', '2001-10-05', 'M', '188/1 A, Peter D. Perera Mawatha, Kohuwala', '0732456790', 'lm.tharindu.perera@gmail.com', 'STUDENT'),
('TG/2022/1350', '200178896742', 'K.G.Harshani', 'Madhuwanthi', '2001-09-10', 'F', 'No. 5, Sri Dalada Vidiya, Kandy', '0743567812', 'kg.harshani.madhuwanthi@gmail.com', 'STUDENT'),
('TG/2022/1351', '200289907852', 'N.G.Nayanavi', 'Ranasinghe', '2002-11-22', 'F', '34/2 Waldan Place, Welimada Road, Bandarawela', '0754678923', 'ng.nayanavi.ranasinghe@gmail.com', 'STUDENT'),
('TG/2022/1352', '200290018963', 'S.G.Supun', 'Dilhara', '2002-05-27', 'M', '64, Maliyadeva Mawatha, Kurunegala', '0765789034', 'sg.supun.dilhara@gmail.com', 'STUDENT'),
('TG/2022/1353', '200201129074', 'A.K.Lahiru', 'Rukmal', '2002-04-22', 'M', 'No.5, Library Road, Badulla', '0776890145', 'ak.lahiru.rukmal@gmail.com', 'STUDENT'),
('TG/2022/1354', '200212230185', 'T.Ravindu', 'Ransara', '2002-02-18', 'M', 'No.44 Gemunu Mawatha, Ratnapura', '0787901256', 'tr.ravindu.ransara@gmail.com', 'STUDENT'),
('TG/2022/1355', '200223341296', 'J.L.Thilina', 'Thathsara', '2002-06-19', 'M', 'No. 30, Janadhipathi Mawatha, Kaluthara', '0798012367', 'jl.thilina.thathsara@gmail.com', 'STUDENT'),
('TG/2022/1356', '200234452308', 'T.Nimasha', 'Madhurangi', '2002-01-28', 'F', 'No.54, Sampath Niwasa, Ahangama', '0719123478', 'tn.nimasha.madhurangi@gmail.com', 'STUDENT'),
('TG/2022/1357', '200245563419', 'A.G.I.Shehan', 'Dulmina', '2002-05-14', 'M', '23, Samagi Mawatha Akurugoda, Thissamaharamaya', '0720234589', 'agi.shehan.dulmina@gmail.com', 'STUDENT'),
('TG/2022/1358', '200256674528', 'K.Ishara', 'Rathnayake', '2002-12-21', 'M', '34/2 Thelijjawila, Mathara', '0731345690', 'k.ishara.rathnayake@gmail.com', 'STUDENT'),
('TG/2022/1359', '200267785630', 'W.M.Pavithra', 'Virajani', '2002-06-15', 'F', '201 /1 Malalasekara Square, Colombo 7', '0742456701', 'wm.pavithra.virajani@gmail.com', 'STUDENT'),
('L001', '198978896741', 'Chinthaka', 'Chandrakumara', '1989-07-12', 'M', '1013, Himbutuwa, Barawardhanaoya, Hasalaka', '0753567812', 'Chinthaka.Chandrakumara@gmail.com', 'LECTURER'),
('L002', '199089907852', 'W.Chandradasa', 'Perera', '1990-03-05', 'M', '34/2 Salasumgama, Dehiaththakandiya', '0764678923', 'W.Chandradasa.Perera@gmail.com', 'LECTURER'),
('L003', '197890018963', 'L.Manjula', 'Vithanapathirana', '1978-11-23', 'F', '207/Galkanda, Madawala, Ukuwela', '0775789034', 'L.Manjula.Vithanapathirana@gmail.com', 'LECTURER'),
('L004', '198401129074', 'J.M.Samudra', 'Senarath', '1984-09-30', 'F', '25/2 Udagomadiya, Katuwana', '0786890145', 'J.M.Samudra.Senarath@gmail.com', 'LECTURER'),
('L005', '198512230185', 'N.Shafeek', 'Khan', '1985-04-15', 'M', 'No.712 Koswaththa, Vilgamuwa, Laggala', '0797901256', 'N.Shafeek.Khan@gmail.com', 'LECTURER'),
('L006', '199123341296', 'Enoka', 'Randeniya', '1991-01-02', 'F', '1245, Alupothdeniya, Rangala', '0718012367', 'Enoka.Randeniya@gmail.com', 'LECTURER'),
('L007', '198234452307', 'S.D.Indiaka', 'Divakara', '1982-05-22', 'M', '43/5, Kandy Road, Hasalaka', '0729123478', 'S.D.Indiaka.Divakara@gmail.com', 'LECTURER'),
('L008', '198745563418', 'B.A.Nipuna', 'Heminda', '1987-10-09', 'M', '1587, Kalukubura Moragollagama, Mawathagama', '0730234589', 'B.A.Nipuna.Heminda@gmail.com', 'LECTURER'),
('L009', '197656674529', 'Sudesh', 'Kaweeshwara', '1976-02-16', 'M', 'No.71 Diwuldeniya, Poojapitiya, Kandy', '0741345690', 'Sudesh.Kaweeshwara@gmail.com', 'LECTURER'),
('L010', '199267785630', 'M.G.Dinali', 'Fernando', '1992-08-27', 'F', '231, Waragolla, Hettipola', '0752456701', 'M.G.Dinali.Fernando@gmail.com', 'LECTURER'),
('L011', '198078896741', 'J.Uditha', 'Garusinghe', '1980-12-14', 'M', '56/1/B Polonnaruwa Road, Dambulla', '0763567812', 'J.Uditha.Garusinghe@gmail.com', 'LECTURER'),
('L012', '198889907852', 'G.A.Madara', 'Karunarathne', '1988-06-18', 'F', '72/15 Kandy Road, Kegalla', '0774678923', 'G.A.Madara.Karunarathne@gmail.com', 'LECTURER'),
('T001', '199490018963', 'R.M.Hasitha', 'Wijewardane', '1994-03-10', 'M', '11, Mile Post Uraniya, Ridimaliyadda', '0785789034', 'R.M.Hasitha.Wijewardane@gmail.com', 'TO'),
('T002', '198101129074', 'J.Sampath', 'Lakmal', '1981-09-06', 'M', '28, Kotagoda Athuhela, Madagama, Monaragala', '0796890145', 'J.Sampath.Lakmal@gmail.com', 'TO'),
('T003', '198312230185', 'N.K.Hashani', 'Perera', '1983-11-25', 'F', '91, Palugama Bogahawela, Nuwara Eliya', '0717901256', 'N.K.Hashani.Perera@gmail.com', 'TO'),
('T004', '197923341296', 'Naveen', 'Theekshana', '1979-01-19', 'M', '152/A, Kandy Road, Mahiyanganaya', '0728012367', 'Naveen.Theekshana@gmail.com', 'TO'),
('T005', '199034452307', 'U.Dilini', 'Bandara', '1990-04-28', 'F', '903, Kumudu Niwasa, Kamburupitiya, Mathara', '0739123478', 'U.Dilini.Bandara@gmail.com', 'TO'),
('T006', '198645563418', 'H.L.Amaya', 'Rathnayake', '1986-10-31', 'F', 'No.23 Temple Road, Kithulgala, Kegalla', '0740234589', 'H.L.Amaya.Rathnayake@gmail.com', 'TO'),
('T007', '197756674529', 'A.Harshani', 'Karunathilaka', '1977-05-03', 'F', 'No.872, Weeraketiya, Hambanthota', '0751345690', 'A.Harshani.Karunathilaka@gmail.com', 'TO'),
('T008', '199367785630', 'D.M.Amila', 'Sandeepa', '1993-02-11', 'M', '76/5 Main Road, Polonnaruwa', '0762456701', 'D.M.Amila.Sandeepa@gmail.com', 'TO'),
('D001', '198278896741', 'A.K.Roshan', 'Gamage', '1982-07-16', 'M', '78, Mango Tree Lane, Rathgama, Galle', '0726842654', 'Roshan716gamage@gmail.com', 'DEAN'),
('A001', '197867319584', 'R.T.Ruwan', 'Kumara', '1978-05-06', 'M', '71/1 Udugampolapaara, Gampaha', '0764876531', 'ruwan.kumara1978@gmail.com', 'ADMIN'),
('A002', '198883491675', 'J.K. Sanjeewa', 'Dissanayake', '1988-06-07', 'M', '56/7 Kaburupiya, Mathara', '0711342101', 'sanjeewa88jk@gmail.com', 'ADMIN'),
('A003', '198578345155', 'L.A.Nilupul', 'Chamara', '1985-09-27', 'M', '471, Galle Main Road, Kollupitiya', '0712222564', 'chamaranilupul1985@gmail.com', 'ADMIN');

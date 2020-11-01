INSERT INTO Member
VALUES('001', '吉田康子', '0901112215', 
'yoshida@a1.com', '2000-04-10');
INSERT INTO Member
VALUES('002', '荒木和子', '0901112216', 
'araki@a2.com', '2012-08-11');
INSERT INTO Member
VALUES('003', '下田正一', '0901112217', 
'shimoda@a3.com', '2000-04-12');
INSERT INTO Member
VALUES('004', '風間由美子', '0901112218', 
NULL, '2000-04-10');
INSERT INTO Member
VALUES('005', '秋山美奈', '0901112219', 
'akiyama@a5.com', '2015-01-14');
INSERT INTO Member
VALUES('006', '木下博之', '0901112220', 
'kinoshita@a6.com', '2015-04-15');
INSERT INTO Member
VALUES('007', '広瀬正隆', NULL, 
NULL, '2016-09-16');
INSERT INTO Member
VALUES('008', '斉藤美紀', '0901112222', 
'saitou@a8.com', '2018-04-17');

INSERT INTO Booking
VALUES('1', '2018-09-06 16:28', '002', '0', 
'2018-10-01', '17:00', 90, '01', 21,600, NULL);
INSERT INTO Booking
VALUES('2', '2018-09-26 12:42', '004', '0', 
'2018-10-01', '10:00', 30, '03', 10,000, NULL);
INSERT INTO Booking
VALUES('3', '2018-09-30 10:30', '008', '0', 
'2018-10-01', '15:00', 150, '05', 26,400, NULL);

CREATE TABLE Stylist (
    StylistNum CHAR(2) PRIMARY KEY,
    StylistName VARCHAR(20) NOT NULL,
    StylistSex CHAR(1) NOT NULL,
    StylistDate DATE NOT NULL,
    StylistRank CHAR(1) REFERENCES Ranking(RankNum)
);

INSERT INTO Stylist
VALUES('01', '秋葉ちか', '女性', '1998-04-01', 'A');
INSERT INTO Stylist
VALUES('02', '佐藤茜', '女性', '2000-06-01', 'B');
INSERT INTO Stylist
VALUES('03', '井上博之', '男性', '2003-01-08', 'B');
INSERT INTO Stylist
VALUES('04', '小島正', '男性', '2010-05-02', 'C');
INSERT INTO Stylist
VALUES('05', '山田雄介', '男性', '2015-04-01', 'C');
INSERT INTO Stylist
VALUES('06', '秋葉ちか', '女性', '2018-06-10', NULL);


INSERT INTO Ranking
VALUES('A', 'チーフスタイリスト');
INSERT INTO Ranking
VALUES('B', 'トップスタイリスト');
INSERT INTO Ranking
VALUES('C', 'スタイリスト');


INSERT INTO Fee
VALUES('C', 'A', 12,000);
INSERT INTO Fee
VALUES('C', 'B', 10,000);
INSERT INTO Fee
VALUES('C', 'C', 8,000);
INSERT INTO Fee
VALUES('P', 'A', 18,000);
INSERT INTO Fee
VALUES('P', 'B', 15,000);
INSERT INTO Fee
VALUES('P', 'C', 12,000);
INSERT INTO Fee
VALUES('R', 'A', 9,600);
INSERT INTO Fee
VALUES('R', 'B', 8,000);
INSERT INTO Fee
VALUES('R', 'C', 6,400);
INSERT INTO Fee
VALUES('T', 'A', 14,400);
INSERT INTO Fee
VALUES('T', 'B', 12,000);
INSERT INTO Fee
VALUES('T', 'C', 9,600);

INSERT INTO Menu
VALUES('C', 'カット', 30);
INSERT INTO Menu
VALUES('P', 'パーマ', 60);
INSERT INTO Menu
VALUES('R', 'カラー', 60);
INSERT INTO Menu
VALUES('T', 'トリートメント', 30);

CREATE TABLE BookingDetail (
    BookingNum INTEGER NOT NULL REFERENCES Booking(BookingNum),
    MenuNum CHAR(1) NOT NULL REFERENCES Menu(MenuNum),
    PRIMARY KEY (BookingNum, MenuNum)
);

INSERT INTO BookingDetail
VALUES(1, 'C');
INSERT INTO BookingDetail
VALUES(1, 'R');
INSERT INTO BookingDetail
VALUES(2, 'C');
INSERT INTO BookingDetail
VALUES(3, 'C');
INSERT INTO BookingDetail
VALUES(3, 'P');
INSERT INTO BookingDetail
VALUES(3, 'R');
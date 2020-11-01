CREATE TABLE Member (
    MemberNo CHAR(4) PRIMARY KEY,
    MemberName VARCHAR(20) NOT NULL,
    PhoneNum CHAR(11),
    Email VARCHAR(40),
    JoinDate Date NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE Booking (
    BookingNum INTEGER PRIMARY KEY,
    RegisDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    MemberNum CHAR(4) NOT NULL REFERENCES Member(MemberNo),
    FirstTime BOOLEAN NOT NULL DEFAULT '0',
    BookingDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    Duration INTEGER,
    StylistNum CHAR(2) REFERENCES Stylist(StylistNum),
    Cost INTEGER NOT NULL DEFAULT 0,
    Notes VARCHAR(50)
);

CREATE TABLE Stylist (
    StylistNum CHAR(2) PRIMARY KEY,
    StylistName VARCHAR(20) NOT NULL,
    StylistSex CHAR(1) NOT NULL,
    StylistDate DATE NOT NULL,
    StylistRank CHAR(1) REFERENCES Ranking(RankNum)
);

CREATE TABLE Ranking (
    RankNuM CHAR(1) PRIMARY KEY,
    Title VARCHAR(40) NOT NULL
);

CREATE TABLE Fee (
    MenuNum CHAR(1) REFERENCES Menu(MenuNum),
    RankNum CHAR(1) REFERENCES Ranking(RankNum),
    Fee INTEGER NOT NULL,
    PRIMARY KEY(MenuNum, RankNum)
);

CREATE TABLE Menu (
    MenuNum CHAR(1) PRIMARY KEY,
    MenuName VARCHAR(40) NOT NULL,
    Duration INTEGER NOT NULL
);

CREATE TABLE BookingDetail (
    BookingNum INTEGER NOT NULL REFERENCES Booking(BookingNum),
    MenuNum CHAR(1) NOT NULL REFERENCES Menu(MenuNum),
    PRIMARY KEY (BookingNum, MenuNum)
);
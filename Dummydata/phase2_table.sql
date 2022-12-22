--  Create Schema " c##surfing / sfs123 "

--  아래 명령어 돌리면 유저 생성됨
--  create user c##surfing identified by sfs123;
--  grant all privileges to c##surfing;

CREATE TABLE Account(
    User_Name       VARCHAR(15)     NOT NULL,
    ID              VARCHAR(15)        NOT NULL    UNIQUE,
    Psswd           VARCHAR(12)        NOT NULL,
    Ssn             VARCHAR(11)         NOT NULL    PRIMARY KEY,
    Bdate           DATE,
    Sex             CHAR,
    PhoneNumber     VARCHAR(13),
    Admin_ssn       VARCHAR(11),
    FOREIGN KEY (Admin_ssn) REFERENCES Account(Ssn)
);

CREATE TABLE SurfSite(
    UUID            VARCHAR(10)     NOT NULL     PRIMARY KEY,
    Weather         VARCHAR(30)     NOT NULL,
    WaveHeight      VARCHAR(10)     NOT NULL,
    RTWRI           VARCHAR(50)     DEFAULT 'https://-----.com'
);

CREATE TABLE SurfLocation(
    SurfSite_ID     VARCHAR(10)     NOT NULL,
    Location_info   VARCHAR(30)     DEFAULT 'Korea',
    constraint surf_location_pk PRIMARY key (SurfSite_ID, Location_info),
    FOREIGN KEY (SurfSite_ID) REFERENCES SurfSite(UUID)
);

CREATE TABLE Reservation(
    User_ssn        VARCHAR(11)      NOT NULL,
    SurfSite_ID     VARCHAR(11)     NOT NULL,
    MOP             VARCHAR(10)     DEFAULT 'CreditCard',
    Total_Fee       VARCHAR(10)     DEFAULT '50$',
    constraint reservation_pk PRIMARY key (User_ssn, SurfSite_ID),
    FOREIGN KEY (SurfSite_ID) REFERENCES SurfSite(UUID),
    FOREIGN KEY (User_ssn) REFERENCES Account(Ssn)
);

CREATE TABLE Service_info(
    SurfSite_ID         VARCHAR(10)     NOT NULL,
    ServiceManagerId    VARCHAR(10)     NOT NULL,
    OpeningDay          VARCHAR(20)     DEFAULT 'M.TU.W.TH.F.SA.SU',
    StartTime           timestamp,
    EndTime             timestamp,
    Lecture             VARCHAR(10)     DEFAULT 'None',
    Equipment           VARCHAR(10)     DEFAULT 'None',
    ShowerRoom          VARCHAR(20)     DEFAULT 'None',
    DressingRoom        VARCHAR(20)     DEFAULT 'None',
    constraint Service_info_pk PRIMARY key (SurfSite_ID, ServiceManagerId),
    FOREIGN KEY (SurfSite_ID) REFERENCES SurfSite(UUID)
);

CREATE TABLE Events(
    SurfSite_ID     VARCHAR(10)     NOT NULL,
    Announcment_No  VARCHAR(10)     NOT NULL,
    Event_type      VARCHAR(10)     DEFAULT 'Sale',
    DurationDate    Date,
    constraint events_pk PRIMARY key (SurfSite_ID, Announcment_No),
    FOREIGN KEY (SurfSite_ID) REFERENCES SurfSite(UUID)
);

CREATE TABLE Rating(
    User_ssn        VARCHAR(9)      NOT NULL,
    SurfSite_ID     VARCHAR(10)     NOT NULL,
    MOP             VARCHAR(10)     DEFAULT 'CreditCard',
    Total_Fee       VARCHAR(10)     DEFAULT '50$',
    constraint Rating_pk PRIMARY key (User_ssn, SurfSite_ID),
    FOREIGN KEY (SurfSite_ID) REFERENCES SurfSite(UUID),
    FOREIGN KEY (User_ssn) REFERENCES Account(Ssn)
);

--  [1] 전화번호 국가 제한 (전화번호 01 로 시작안하면 에러)
CREATE OR replace TRIGGER test_PhoneNumbers 
  BEFORE INSERT OR UPDATE ON Account 
  FOR EACH ROW 
BEGIN 
    IF Substr(:new.PhoneNumber, 1, 2) != '01' THEN 
        raise_application_error(-20001,'Currently only phoneNumber registered inside Rpublic of South Korea can be used for account creation!');
    END IF; 
END test_PhoneNumbers;
/

--  [2] 18세 이상 나이 제한 (생년월일 기준 18세 이하면 에러)
CREATE OR replace TRIGGER test_bDate 
  BEFORE INSERT OR UPDATE ON Account 
  FOR EACH ROW 
BEGIN 
   IF (MONTHS_BETWEEN(SYSDATE,:NEW.Bdate)/12) <= 18  THEN 
        raise_application_error(-20001,'Your are too young for this activity!');
    END IF; 
END test_bDate;
/

--  [3] 이벤트 개최 기간 제한 (설정 기간이 과거면 에러)
CREATE OR replace TRIGGER test_EventDuration 
  BEFORE INSERT OR UPDATE ON Events 
  FOR EACH ROW 
BEGIN 
   IF (SYSDATE > :new.DurationDate) THEN 
        raise_application_error(-20001,'Cant insert duration date from the past!');
    END IF; 
END test_EventDuration;
/

-- 트리거 작동 체크용 추가구문
--[1]
INSERT INTO Account VALUES ('John', 'Smith123', 'asd123asd','123456789',TO_DATE('1022-01-09', 'yyyy-mm-dd'), 'M', '111-1234-1243', '333445555');
--[2]
INSERT INTO Account VALUES ('John', 'Smith123', 'asd123asd','123456789',TO_DATE('2022-01-09', 'yyyy-mm-dd'), 'M', '111-1234-1243', '333445555');
--[3]
INSERT INTO Events VALUES ('asd123fff', 'S123123', 'Events',TO_DATE('1022-01-09', 'yyyy-mm-dd'));

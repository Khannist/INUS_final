-----------------------------------서버기록---------------------------------------------
CREATE TABLE Channel_dt (
    channelCode NVARCHAR2(28) PRIMARY KEY,
    channelName NVARCHAR2(255)
);

CREATE TABLE ChannelHasUser_dt (
    channelList nvarchar2(255),
    channelCode NVARCHAR2(28),
    userId NVARCHAR2(100),
    channelName nvarchar2(255)
);

-----------------------------------채팅룸기록---------------------------------------------
CREATE TABLE roomChannel (
    roomCode NVARCHAR2(28) PRIMARY KEY,
    roomName NVARCHAR2(255),
    channelCode NVARCHAR2(30)
);
-- 채널 코드를 가지고 있다면 룸코드는 전부 보이게 만들기
-- 채널의 관리자는 추가 삭제가 가능하게 변경 or 추가 최대치 제한
CREATE TABLE roomUser_dt (
    roomList nvarchar2(255),
    roomName NVARCHAR2(255),
    roomCode nvarchar2(30),
    channelCode NVARCHAR2(28)
);
-----------------------------------채팅기록---------------------------------------------


CREATE TABLE chat_dt (
    roomCode NVARCHAR2(28),
    name NVARCHAR2(100) ,
    userId NVARCHAR2(100),
    channelCode NVARCHAR2(28),
    chatData clob,
    chatDate TIMESTAMP
);
commit;



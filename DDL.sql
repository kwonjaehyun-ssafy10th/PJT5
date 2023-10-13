CREATE SCHEMA ssafit_DB;

USE ssafit_DB;

-- 비디오 테이블channel
CREATE TABLE Video (
    videoID VARCHAR(255) PRIMARY KEY,
    videoTitle VARCHAR(255),
    part VARCHAR(255),
    channelID VARCHAR(255),
    url VARCHAR(255),
    videoView INT
);

-- 비디오 리뷰 테이블
CREATE TABLE VideoReview (
    reviewID VARCHAR(255) PRIMARY KEY,
    videoID VARCHAR(255),
    userID VARCHAR(255),
    reviewContent VARCHAR(255),
    reviewLike INT,
    FOREIGN KEY (videoID) REFERENCES Video(videoID)
);

-- 사용자 테이블
CREATE TABLE User (
    userID VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255),
    nickName VARCHAR(255)
);

-- 채널 테이블
CREATE TABLE Channel (
    channelID VARCHAR(255) PRIMARY KEY,
    channelName VARCHAR(255),
    userID VARCHAR(255),
    followerNo INT,
    FOREIGN KEY (userID) REFERENCES User(userID)
);

-- 팔로우 관계 테이블
CREATE TABLE FollowRelationship (
    channelID VARCHAR(255),
    userID VARCHAR(255),
    PRIMARY KEY (channelID, userID),
    FOREIGN KEY (channelID) REFERENCES Channel(channelID),
    FOREIGN KEY (userID) REFERENCES User(userID)
);
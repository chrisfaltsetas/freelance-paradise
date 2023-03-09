create Table if not exists Users (
    username varchar(20) not null,
    name varchar(30) not null,
    surname varchar(20) not null,
    email varchar(50) not null,
    password varchar(30) not null,
    type varchar(10) not null,
    about varchar(1000),
    PRIMARY KEY (username)
);

create Table if not exists Category (
    title varchar(30) not null,
    descr varchar(200),
    PRIMARY KEY (title)
);

create Table if not exists Project (
    projectId int not null,
    title varchar(70) not null,
    state varchar(20) not null,
    descr varchar(1000),
    budget varchar(20),
    categoryTitle varchar(30),
    username varchar(20),
    seller varchar(20),
    chat varchar (5000),

    PRIMARY KEY (projectId),
    CONSTRAINT FKcategoryTitle FOREIGN KEY (categoryTitle) REFERENCES Category(title) ON UPDATE CASCADE,
    CONSTRAINT FKusername FOREIGN KEY (username) REFERENCES Users(username) ON DELETE CASCADE,
    CONSTRAINT FKseller FOREIGN KEY (seller) REFERENCES Users(username) ON UPDATE CASCADE
);
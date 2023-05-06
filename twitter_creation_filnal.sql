drop database twitter2;
create database twitter2;
use twitter2;

create table user (
	id varchar(16) not null,
    pw varchar(256) not null,
    name varchar(16) not null,
    activity boolean not null,
    primary key (id)
);


create table posts (
		idx int(100) auto_increment,
        writter_id varchar(16),
        content varchar(280),
        count_like int,
        time datetime,
        primary key (idx),
        foreign key (writter_id) references user(id)
        on delete cascade
		on update cascade
);

create table post_like (
	idx int not null auto_increment,
    like_id varchar(16),
    posts_idx int not null,
    primary key (idx),
    foreign key (posts_idx) references posts(idx),
    foreign key (like_id) references user(id)
    on delete cascade
	on update cascade
);


create table comment(
	idx int not null auto_increment,
    post_idx int not null,
    writter_id varchar(16),
    content varchar(280),
    count_like int,
    time datetime,
    primary key (idx),
    foreign key (post_idx) references posts(idx)
    on delete cascade
	on update cascade,
    foreign key (writter_id) references user(id)
    on delete cascade
	on update cascade
);

create table comment_like(
	idx int not null auto_increment,
    like_idx varchar(16),
    comment_idx int,
    primary key (idx),
	foreign key (like_idx) references user(id)
    on delete cascade
	on update cascade,
    foreign key (comment_idx) references comment(idx)
    on delete cascade
	on update cascade
);

create table follow (
	idx int not null auto_increment,
    follower_id varchar(16),
    following_id varchar(16),
    primary key (idx),
    foreign key (following_id) references user(id)
    on delete cascade
	on update cascade,
    foreign key (follower_id) references user(id)
    on delete cascade
	on update cascade
);












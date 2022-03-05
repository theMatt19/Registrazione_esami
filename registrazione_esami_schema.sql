create table corso
(
    id          int auto_increment
        primary key,
    descrizione varchar(255) null,
    constraint corso_descrizione_uindex
        unique (descrizione)
);

create table esame
(
    id   int auto_increment
        primary key,
    data datetime not null
);

create table professore
(
    id       int auto_increment
        primary key,
    nome     varchar(100) not null,
    cognome  varchar(100) not null,
    username varchar(50)  not null,
    password varchar(128) not null,
    constraint professore_username_uindex
        unique (username)
);

create table studente
(
    id        int auto_increment
        primary key,
    matricola varchar(20)  not null,
    nome      varchar(100) not null,
    cognome   varchar(100) not null,
    voto      int          null,
    id_corso  int          null,
    constraint studente_matricola_uindex
        unique (matricola),
    constraint studente_corso_id_fk
        foreign key (id_corso) references corso (id)
);

create table prova
(
    id            int auto_increment
        primary key,
    valutazione   float                                                           not null,
    tipologia     enum ('teoria', 'programmazione', 'orale')  default 'teoria'    not null,
    stato         enum ('ritirato', 'accettato', 'rifiutato') default 'accettato' not null,
    note          text                                                            null,
    id_studente   int                                                             null,
    id_esame      int                                                             null,
    id_professore int                                                             null,
    constraint esame_fk
        foreign key (id_esame) references esame (id),
    constraint professore_fk
        foreign key (id_professore) references professore (id),
    constraint studente_fk
        foreign key (id_studente) references studente (id)
);

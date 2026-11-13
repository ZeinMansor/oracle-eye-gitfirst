create table finance.journal_entries (
    entry_id    number(10, 0) not null enable,
    entry_date  date not null enable,
    description varchar2(200 byte) not null enable,
    posted      char(1 byte) default 'N' not null enable
);

alter table finance.journal_entries
    add constraint journal_entries_pk primary key ( entry_id )
        using index enable;

alter table finance.journal_entries
    add constraint journal_entries_posted_ck
        check ( posted in ( 'Y', 'N' ) ) enable;

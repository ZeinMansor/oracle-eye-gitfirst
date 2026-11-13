create table finance.journal_lines (
    entry_id     number(10, 0) not null enable,
    line_no      number(4, 0) not null enable,
    account_code varchar2(10 byte) not null enable,
    debit        number(14, 2) default 0 not null enable,
    credit       number(14, 2) default 0 not null enable
);

alter table finance.journal_lines
    add constraint journal_lines_pk primary key ( entry_id,
                                                  line_no )
        using index enable;

alter table finance.journal_lines
    add constraint journal_lines_side_ck
        check ( ( debit = 0
                  and credit > 0 )
                or ( credit = 0
                     and debit > 0 ) ) enable;

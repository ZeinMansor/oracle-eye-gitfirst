create table finance.gl_accounts (
    account_code varchar2(10 byte) not null enable,
    name         varchar2(100 byte) not null enable,
    account_type varchar2(10 byte) not null enable
);

alter table finance.gl_accounts
    add constraint gl_accounts_pk primary key ( account_code )
        using index enable;

alter table finance.gl_accounts
    add constraint gl_accounts_type_ck
        check ( account_type in ( 'ASSET', 'LIABILITY', 'EQUITY', 'INCOME', 'EXPENSE' ) ) enable;

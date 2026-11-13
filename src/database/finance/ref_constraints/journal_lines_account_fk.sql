alter table finance.journal_lines
    add constraint journal_lines_account_fk
        foreign key ( account_code )
            references finance.gl_accounts ( account_code )
        enable;

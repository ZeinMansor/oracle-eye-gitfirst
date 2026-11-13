alter table finance.journal_lines
    add constraint journal_lines_entry_fk
        foreign key ( entry_id )
            references finance.journal_entries ( entry_id )
        enable;

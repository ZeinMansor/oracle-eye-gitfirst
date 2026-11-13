create index finance.journal_lines_account_ix on
    finance.journal_lines (
        account_code
    );

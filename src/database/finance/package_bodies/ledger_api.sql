create or replace package body finance.ledger_api as

    function open_entry (
        p_date        in date,
        p_description in varchar2
    ) return number is
        l_id journal_entries.entry_id%type := journal_seq.nextval;
    begin
        insert into journal_entries (
            entry_id,
            entry_date,
            description
        ) values
            ( l_id,
              p_date,
              p_description );

        return l_id;
    end open_entry;

    procedure add_line (
        p_entry_id in number,
        p_account  in varchar2,
        p_debit    in number,
        p_credit   in number
    ) is
        l_line journal_lines.line_no%type;
    begin
        select
            nvl(
                max(line_no),
                0
            ) + 1
        into l_line
        from
            journal_lines
        where
            entry_id = p_entry_id;

        insert into journal_lines (
            entry_id,
            line_no,
            account_code,
            debit,
            credit
        ) values
            ( p_entry_id,
              l_line,
              p_account,
              nvl(p_debit, 0),
              nvl(p_credit, 0) );

    end add_line;

    procedure post (
        p_entry_id in number
    ) is
        l_debit  number;
        l_credit number;
    begin
        select
            nvl(
                sum(debit),
                0
            ),
            nvl(
                sum(credit),
                0
            )
        into
            l_debit,
            l_credit
        from
            journal_lines
        where
            entry_id = p_entry_id;

        if l_debit = 0
        or l_debit <> l_credit then
            raise_application_error(-20020, 'Entry '
                                            || p_entry_id
                                            || ' is not balanced');
        end if;

        update journal_entries
        set
            posted = 'Y'
        where
            entry_id = p_entry_id;

    end post;

end ledger_api;
/

create or replace package finance.ledger_api as
    function open_entry (
        p_date        in date,
        p_description in varchar2
    ) return number;

    procedure add_line (
        p_entry_id in number,
        p_account  in varchar2,
        p_debit    in number,
        p_credit   in number
    );

    procedure post (
        p_entry_id in number
    );

end ledger_api;
/

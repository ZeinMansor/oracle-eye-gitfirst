create or replace package body finance.settlement_pg as

    function calculate_settlement (
        p_date        in date,
        p_description in varchar2
    ) return number is
    begin
        return 1 + 1;
    end calculate_settlement;

end settlement_pg;
/

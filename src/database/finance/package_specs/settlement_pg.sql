create or replace package finance.settlement_pg as
    function calculate_settlement (
        p_date        in date,
        p_description in varchar2
    ) return number;

end settlement_pg;
/

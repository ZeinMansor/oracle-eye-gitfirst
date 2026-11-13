create or replace force editionable view finance.trial_balance_v (
    account_code,
    name,
    account_type,
    total_debit,
    total_credit,
    balance
) as
    select
        a.account_code,
        a.name,
        a.account_type,
        nvl(
            sum(l.debit),
            0
        ) as total_debit,
        nvl(
            sum(l.credit),
            0
        ) as total_credit,
        nvl(
            sum(l.debit),
            0
        ) - nvl(
            sum(l.credit),
            0
        ) as balance
    from
        gl_accounts a
        left join (
            select
                jl.account_code,
                jl.debit,
                jl.credit
            from
                     journal_lines jl
                join journal_entries je on je.entry_id = jl.entry_id
            where
                je.posted = 'Y'
        )           l on l.account_code = a.account_code
    group by
        a.account_code,
        a.name,
        a.account_type;

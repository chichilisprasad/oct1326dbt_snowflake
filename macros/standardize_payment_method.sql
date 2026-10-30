{% macro standardize_payment_method(column_name) %}

CASE
    WHEN UPPER({{ column_name }}) = 'DEBIT CARD'
        THEN 'DEBIT_CARD'

    WHEN UPPER({{ column_name }}) = 'CREDIT CARD'
        THEN 'CREDIT_CARD'

    WHEN UPPER({{ column_name }}) = 'NET BANKING'
        THEN 'NET_BANKING'

    WHEN UPPER({{ column_name }}) = 'UPI'
        THEN 'UPI'

    ELSE 'UNKNOWN'
END

{% endmacro %}
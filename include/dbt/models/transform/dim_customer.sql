-- Create the dimension table
WITH customer_cte AS (
	SELECT
		DISTINCT {{ dbt_utils.generate_surrogate_key(['CustomerID', 'Country']) }} AS customer_id, --generating unique ids for each customer
	    Country AS country
	FROM {{ source('retail', 'raw_invoices') }}
	WHERE CustomerID IS NOT NULL
)

SELECT
    t.*,
	cm.iso
FROM customer_cte t
LEFT JOIN {{ source('retail', 'country') }} AS cm 
	ON t.country = cm.nicename
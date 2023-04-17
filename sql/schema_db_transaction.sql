CREATE TABLE public.tb_customer (
	customer_id text NULL,
	customer_unique_id text NULL,
	customer_zip_code_prefix int8 NULL,
	customer_city text NULL,
	customer_state text NULL
);

CREATE TABLE public.tb_order (
	order_id text NULL,
	customer_id text NULL,
	order_status text NULL,
	order_purchase_timestamp text NULL,
	order_approved_at text NULL,
	order_delivered_carrier_date text NULL,
	order_delivered_customer_date text NULL,
	order_estimated_delivery_date text NULL
);

CREATE TABLE public.tb_order_items (
	order_id text NULL,
	order_item_id int8 NULL,
	product_id text NULL,
	seller_id text NULL,
	shipping_limit_date text NULL,
	price float8 NULL,
	freight_value float8 NULL
);

CREATE TABLE public.tb_order_payments (
	order_id text NULL,
	payment_sequential int8 NULL,
	payment_type text NULL,
	payment_installments int8 NULL,
	payment_value float8 NULL
);

CREATE TABLE public.tb_order_reviews (
	review_id text NULL,
	order_id text NULL,
	review_score int8 NULL,
	review_comment_title text NULL,
	review_comment_message text NULL,
	review_creation_date text NULL,
	review_answer_timestamp text NULL
);

CREATE TABLE public.tb_product_category (
	product_category_name text NULL,
	product_category_name_english text NULL
);

CREATE TABLE public.tb_products (
	product_id text NULL,
	product_category_name text NULL,
	product_name_lenght float8 NULL,
	product_description_lenght float8 NULL,
	product_photos_qty float8 NULL,
	product_weight_g float8 NULL,
	product_length_cm float8 NULL,
	product_height_cm float8 NULL,
	product_width_cm float8 NULL
);

CREATE TABLE public.tb_sellers (
	seller_id text NULL,
	seller_zip_code_prefix int8 NULL,
	seller_city text NULL,
	seller_state text NULL
);
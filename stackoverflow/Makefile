SHELL := /bin/bash
export PATH := /google-cloud-sdk/bin:$(PATH)

stackoverflow_qa :
	cat queries/stackoverflow_qa.sql | bq query --destination_table 'omar-carrefour-interview:carrefour-demo.StackOverflow_QA' --replace --allow_large_results --max_rows 0 --nouse_cache --nouse_legacy_sql
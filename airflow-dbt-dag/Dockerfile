FROM quay.io/astronomer/astro-runtime:12.6.0


ENV DATABRICKS_HOST=<your_databricks_host> \ 
    DATABRICKS_TOKEN=<your_PAT_token> \
    DATABRICKS_SCHEMA=<your_schema> \
    DATABRICKS_HTTP_PATH=<your_http_path>  \
    DATABRICKS_CATALOG=<your_catalog>

RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
    pip install --no-cache-dir dbt-databricks && deactivate
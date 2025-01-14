FROM quay.io/astronomer/astro-runtime:12.6.0


ENV DATABRICKS_TOKEN=<your_databricks_token \
    DATABRICKS_SCHEMA=<your_databricks_schema> \
    DATABRICKS_HTTP_PATH=<your_databricks_http_path>

RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
    pip install --no-cache-dir dbt-databricks && deactivate
import os
from datetime import datetime

from cosmos import DbtDag, ProjectConfig, ProfileConfig, ExecutionConfig
from cosmos.profiles import DatabricksOauthProfileMapping

profile_config = ProfileConfig(
    profile_name="dev",
    target_name="dev",
    profile_mapping=DatabricksOauthProfileMapping(
        conn_id="databricks_conn", 
        profile_args={
            "host": os.getenv("DATABRICKS_HOST"), 
            "schema": os.getenv("DATABRICKS_SCHEMA"), 
            "http_path": os.getenv("DATABRICKS_HTTP_PATH"),
            "client_id": os.getenv("DATABRICKS_CLIENT_ID"), 
            "client_secret": os.getenv("DATABRICKS_CLIENT_SECRET")
        }
    )
)
dbt_databricks_dag = DbtDag(
    project_config=ProjectConfig("/usr/local/airflow-dbt-dag/dags/dbt/dbt_consumption_pipeline",),
    operator_args={"install_deps": True},
    profile_config=profile_config,
    execution_config=ExecutionConfig(dbt_executable_path=f"{os.environ['AIRFLOW_HOME']}/dbt_venv/bin/dbt",),
    schedule_interval="@daily",
    start_date=datetime(2023, 9, 10),
    catchup=False,
    dag_id="dbt_dag",
)
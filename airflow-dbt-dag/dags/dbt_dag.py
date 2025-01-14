import os
from datetime import datetime
from dotenv import load_dotenv
from dotenv import load_dotenv

from cosmos import DbtDag, ProjectConfig, ProfileConfig, ExecutionConfig
from cosmos.profiles import DatabricksTokenProfileMapping

# Load environment variables from .env file
load_dotenv()

profile_config = ProfileConfig(
    profile_name="dev",
    target_name="dev",
    profile_mapping=DatabricksTokenProfileMapping(
        conn_id="databricks_conn", 
        profile_args={
            "host": os.getenv("DATABRICKS_HOST"),
            "schema": os.getenv("DATABRICKS_SCHEMA"), 
            "http_path": os.getenv("DATABRICKS_HTTP_PATH"),
            "token": os.getenv("DATABRICKS_TOKEN"),
            "catalog" : os.getenv("DATABRICKS_CATALOG")
        }
    )
)
dbt_databricks_dag = DbtDag(
    project_config=ProjectConfig("/usr/local/airflow/dags/dbt/dbt_consumption_pipeline",),
    operator_args={"install_deps": True},
    profile_config=profile_config,
    execution_config=ExecutionConfig(dbt_executable_path=f"{os.environ['AIRFLOW_HOME']}/dbt_venv/bin/dbt",),
    schedule_interval="@daily",
    start_date=datetime(2025, 1, 10),
    catchup=False,
    dag_id="dbt_dag",
)
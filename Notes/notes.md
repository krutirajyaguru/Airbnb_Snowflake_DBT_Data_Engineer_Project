# IAM:   
		![](Notes/IAM.png)

        AWS Identity and Access Management (IAM) is a centralized web service that securely manages authentication and authorization for AWS resources.

# DBT Adapters:   
		![](Notes/dbt-adapters.png)

        A dbt adapter allows dbt Core to connect, authenticate, and communicate with specific data platforms (e.g., Snowflake, BigQuery, Redshift, Databricks). It acts as a translator, converting dbt’s generic SQL syntax into the specific SQL dialect of the target database

# Materialization Configuration & Precedence in dbt:   
		![](Notes/precedence.png)

        In dbt, materialization settings can be defined at multiple levels. When conflicts occur, dbt follows a priority order (highest to lowest precedence):

        1. Model-Level Configuration (Highest Priority)

        - Defined directly inside the .sql model file using Jinja:
            {{ config(materialized='view') }}
        - Applies only to the specific model
        - Overrides all other configurations

        2. Project-Level Configuration (dbt_project.yml)

        - Defined globally or for specific folders/models:
        models:
            aws_dbt_snowflake_project:
                demo:
                +materialized: table
        - Applies to all models within the specified path (models/demo/)
        - Can be overridden by model-level configuration

        3. Property File Configuration (.yml) (Lowest Priority)

        - Defined in schema/property YAML files inside the models/ directory:
        models:
            - name: demo
                config:
                materialized: view
        - Used for documentation and additional configurations
        - Lowest precedence among the three

# Incremental Load:   
		![](Notes/incremental_load.png)

        Incremental loading in data engineering is the process of loading only new, updated, or deleted data since the last successful data integration, rather than reprocessing the entire dataset. This technique reduces data volume, speeds up ET/ELT pipelines, and lowers costs.

# Macros:   
		![](Notes/macros.png)

        A macro in dbt is a reusable piece of code that you can invoke in various parts of your dbt project. Macros are primarily used to encapsulate logic that you need to repeat across multiple models or analyses.

# UPSERT:   
		![](Notes/upsert.png)

        An upsert (update + insert) is a database operation that automatically updates an existing record if it exists based on a unique key, or inserts a new record if it does not. It prevents duplicate entries and simplifies data workflows by combining two actions into one command.

# One Big Table:   
		![](Notes/obt.png)

        A One Big Table (OBT) is a data modeling approach where multiple datasets (typically from different tables such as facts and dimensions) are combined into a single, wide table.

# STAR Schema:   
		![](Notes/star_schema.png)

        A Star Schema is a data modeling technique where a central fact table is connected to multiple dimension tables, forming a structure that is organized in a star pattern.

        - Fact Table → Contains measurable, quantitative data (metrics)
        - Dimension Tables → Contain descriptive attributes related to the facts

# Tests:   
		![](Notes/tests.png)

        dbt testing ensures data quality and integrity by validating data against defined rules.

        Types of Tests:
        1. Generic Tests (in .yml):
            not_null, unique, accepted_values, relationships
        2. Singular Tests (in .sql):
            Custom queries
            Test fails if query returns rows

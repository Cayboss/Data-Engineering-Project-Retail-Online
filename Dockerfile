FROM quay.io/astronomer/astro-runtime:9.1.0
RUN python -m pip cache purge

# install dbt into a virtual environment
RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
    pip install --no-cache-dir dbt-bigquery==1.5.3 protobuf==3.13.0 && deactivate

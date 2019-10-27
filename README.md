# Carrefour interview demo
demo code for Data ETL pipelines on GCP, this code is developed to run commands on Google Bigquery to perform queries on data and dump results on destination tables

## Local development
### 1- Setup
All you need for setup is to have a docker installed on your machine once that in place you can then build the docker image by running the following command 

```docker build -t carrefour-etl .```

### 2- Running commands

once the image has been built you can run the following command to run the docker image with the command required for running the rule, note that you need to mount credentials in order to run sqoop sync commands to the path `/credentials/` withtin the container.

```docker run -v /tmp/credentials:/credentials carrefour-etl make -C testfolder testrule```

where `-C` is used to run commands from Makefile within a folder in the working directory so `testfolder` is the folder name and `testrule` is the rule name

### 3- Credentials
the credentials file required here is the following
* GCP service account credentials json that has roles to query and write data on BigQuery

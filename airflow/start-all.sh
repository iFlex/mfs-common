#!/bin/bash
cp airflow-scheduler.service /etc/systemd/system/
cp airflow-webserver.service /etc/systemd/system/ 

sudo systemctl daemon-reload

sudo systemctl enable airflow-scheduler
sudo systemctl enable airflow-webserver

sudo systemctl start airflow-scheduler
sudo systemctl start airflow-webserver

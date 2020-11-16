  
FROM python:LATEST

#WORKDIR /home
#
#ENV TELEGRAM_API_TOKEN=""
#ENV TELEGRAM_ACCESS_ID=""
#ENV TELEGRAM_PROXY_URL=""
#ENV TELEGRAM_PROXY_LOGIN=""
#ENV TELEGRAM_PROXY_PASSWORD=""

ENV TZ=Australia/Melbourne
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#RUN pip install -U pip aiogram pytz && apt-get update && apt-get install sqlite3
RUN pip install SmartPlug InfluxDBClient && apt-get update

#COPY *.py ./
# COPY createdb.sql ./

ENTRYPOINT ["python", "server.py"]

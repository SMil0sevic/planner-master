#### FLASK Docker FILE ####
FROM python:slim

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN pip install gunicorn pymysql cryptography

COPY app app
COPY migrations migrations
COPY microblog.py config.py boot.sh ./
RUN chmod a+x boot.sh

ENV FLASK_APP microblog.py

EXPOSE 5000

# Anweisung, um die Flask-App direkt auf dem Host auszuführen
CMD ["flask", "run", "--host=0.0.0.0"]
#############################
FROM python:alpine

ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY req.txt /app/
COPY simpleView/ /app/simpleView/
COPY webapi/ /app/webapi/
COPY db.sqlite3 /app/
COPY manage.py /app/

RUN pip install -r req.txt

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
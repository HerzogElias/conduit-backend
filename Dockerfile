FROM python:3.9-slim

WORKDIR /app

COPY . .

RUN chmod +x ./entrypoint.sh
RUN apt-get update && apt-get install -y gcc netcat-openbsd libpq-dev libffi-dev

RUN pip install -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["./entrypoint.sh"]
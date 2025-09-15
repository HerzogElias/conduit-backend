FROM python:3.5.2-slim

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt
RUN chmod +x entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["./entrypoint.sh"]
FROM python:3.11.8-alpine3.19
WORKDIR /app
COPY . .
CMD ["python3", "useragent.py"]

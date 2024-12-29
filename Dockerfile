FROM python:3.14.0a3-slim

WORKDIR /app

COPY requirements.txt requirements.txt
COPY requirements-dev.txt requirements-dev.txt
RUN pip install --upgrade pip && pip install -r requirements.txt && pip install -r requirements-dev.txt

COPY . .

CMD ["python", "src/app.py"]

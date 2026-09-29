FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV POETRY_NO_INTERACTION=1
ENV POETRY_VIRTUALENVS_CREATE=false

WORKDIR /app

RUN pip install --no-cache-dir poetry==2.5.1

COPY pyproject.toml poetry.lock ./

RUN poetry install --only main --no-root

COPY . .

WORKDIR /app/mysite

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
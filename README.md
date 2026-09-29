# Практическая работа 20

## Цели практической работы
- Научиться работать с SSH.
- Опубликовать проект приложения.

### Что нужно сделать
Воспользуйтесь кодовой базой из пройденных модулей или файлами из репозитория c практической работой.

- Примените Pipenv или Poetry для управления зависимостями в проекте.
- Соберите Docker-образ с приложением. Установите зависимости с помощью инструмента для их контроля. Убедитесь, что внутри Docker-образа система контроля зависимостей не создаёт новое виртуальное окружение (Docker-образ сам по себе виртуальное окружение — не в Python-понимании, но по общему принципу).
- Настройте использование SSH.
- Опубликуйте код приложения в удобном репозитории. Хорошим вариантом будет GitHub, так как там обычно хранят проекты и портфолио.
- Настройте виртуальную машину для публикации (например, на Timeweb - инструкцию вы найдете ниже).
- Опубликуйте приложение на виртуальной машине при помощи Docker и Docker Compose, укажите политику restart: always, чтобы при неожиданном падении приложение перезапустилось автоматически.
- Чтобы статика работала, запустите приложение с флагом DJANGO_DEBUG=1. Хоть это и запуск в production, но без этого статику нужно настраивать отдельно.

### Что оценивается
- Применена система контроля зависимостей Pipenv или Poetry.
- Приложение собрано в Docker-образ, где зависимости устанавливаются при помощи одного из инструментов контроля, но не создаётся виртуальное окружение (автоматическое создание виртуального окружения нужно отключить в конфигурации инструмента для управления зависимостью).
- Код размещён в публичном репозитории.
- Приложение запущено на публичном сервере.

### Как отправить работу на проверку
В поле ниже напишите «Сделано» и прикрепите ссылку на публичный репозиторий и ссылку на ваше приложение на публичном сервере.

# Django Practice 20

Django application published as part of Practical Work 20.

## Stack

- Python 3.12
- Django 4.2
- Poetry
- Docker
- Docker Compose
- SQLite
- SSH

## Dependency management

Dependencies are managed by Poetry:

```bash
poetry install
```

The repository contains:

- `pyproject.toml`
- `poetry.lock`

## Local start with Docker

1. Create an environment file:

```bash
cp .env.example .env
```

2. Build and start the application:

```bash
docker compose up -d --build
```

3. Open the application:

```text
http://127.0.0.1:8001/
```

The root URL redirects to the shop page.

## Poetry inside Docker

The Docker image installs dependencies through Poetry. Poetry virtual environments are disabled in the Docker image:

```dockerfile
ENV POETRY_VIRTUALENVS_CREATE=false
```

Check inside the running container:

```bash
docker compose exec web poetry config virtualenvs.create
```

Expected result:

```text
false
```

## Deployment

The project is deployed to a Cloud.ru virtual machine with Docker Compose.

The service uses the following restart policy:

```yaml
restart: always
```
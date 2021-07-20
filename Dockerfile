FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /usr/src/app

COPY ./requirements.txt /usr/src/app

RUN apt-get update && apt-get install -y netcat
RUN pip install --upgrade pip && pip install -r /usr/src/app/requirements.txt

COPY entrypoint.sh .

COPY . /usr/src/app

WORKDIR usr/src/app/project


ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
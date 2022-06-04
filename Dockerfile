FROM python:3.9.10

ENV APP_HOME /src
ENV PORT 8000

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

COPY . $APP_HOME/

RUN pip install -r requirements.txt

EXPOSE 8000

CMD gunicorn config.wsgi -b 0.0.0.0:$PORT

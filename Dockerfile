FROM python:3.9.10

ENV APP_HOME /src
ENV PORT 8000

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

COPY . $APP_HOME/

RUN pip install -r requirements.txt

EXPOSE 8000

RUN cd MatchQuiter/MatchQuiter

CMD exec gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 0 wsgi:application

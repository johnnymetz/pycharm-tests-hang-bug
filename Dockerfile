FROM python:3.9
WORKDIR /app

# install requirements
COPY requirements.txt ./
RUN pip install --upgrade pip && \
  pip install -r requirements.txt

COPY app.py ./

EXPOSE 5000

# run app when the container launches
ENV FLASK_APP app.py
ENV FLASK_ENV development
CMD [ "flask", "run", "--host=0.0.0.0" ]

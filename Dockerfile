FROM python:3.12.0a6-alpine3.17
ENV PYTHONUNBUFFERED=1
WORKDIR /app
RUN apk add --no-cache --virtual .build-deps \
    ca-certificates gcc postgresql-dev linux-headers musl-dev \
    libffi-dev jpeg-dev zlib-dev 
COPY ./requirements.txt ./ 
RUN pip install -r requirements.txt
COPY ./ ./
CMD ["python", "manage.py", "runserver" , "0.0.0.0:3000"]

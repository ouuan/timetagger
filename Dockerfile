FROM python:3

ARG version

SHELL ["/bin/bash", "-c"]

RUN pip --no-cache-dir install pip --upgrade
RUN pip --no-cache-dir install \
    uvicorn uvloop httptools \
    fastuaparser 'itemdb>=1.1.1' asgineer requests \
    jinja2 markdown pscript \
    pyjwt cryptography

WORKDIR /app
COPY . .
RUN sed -i "s/change_this_in_dockerfile/$version/" timetagger/server/_assets.py
CMD ["python", "run.py", "--datadir=data"]

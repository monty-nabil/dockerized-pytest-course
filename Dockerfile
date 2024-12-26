FROM python:3.7.12-bullseye

RUN apt-get update && apt-get install -y python3-distutils

RUN mkdir /pytest_project/
COPY ./test-requirements.txt /pytest_project/
COPY ./setup.py ./setup.py

RUN pip3 install --upgrade pip
RUN pip3 install -r /pytest_project/test-requirements.txt  # Install test requirements *before* setup.py
RUN pip3 install -e .  # Install the project using pip3 consistently

WORKDIR /pytest_project/

CMD ["pytest"] # Use an array for CMD to avoid shell issues.
ENV PYTHONDONTWRITEBYTECODE=true

FROM python:3.12.5-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    gcc \
    python3-dev \
    build-essential

RUN mkdir ETCMC

RUN curl -o ETCMC_Linux.zip https://github.com/Nowalski/ETCMC_Software/releases/download/Setup%2FWindows/ETCMC_Linux.zip
RUN unzip ETCMC_Linux.zip -d ETCMC

RUN chmod -R 777 ETCMC

WORKDIR /app/ETCMC

RUN pip install -r requirements.txt

EXPOSE 5000
CMD ["sh", "-c", "python Linux.py start --port 5000 & tail -f /dev/null"]

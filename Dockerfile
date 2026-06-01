FROM python:3.10-slim

RUN apt-get update && apt-get install -y aws-cli

RUN pip install boto3 sagemaker tensorflow

COPY script.sh /app/script.sh
RUN chmod +x /app/script.sh

WORKDIR /app
CMD ["/app/script.sh"]

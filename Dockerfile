FROM python:3
ENV AWS_ACCESS_KEY_ID_ENCRYPTED=QUtJQVlXRDRCRE5TUkxMWjVLRjM=
ENV AWS_SECRET_KEY_ID_ENCRYPTED=cUFSczhiWXJva0hyS0VDZVQ5Zi9YRkxjVlJSOTVQVC80a2pxcFkvSg==

WORKDIR /root 

RUN export ACCESS_KEY_ID=`echo $AWS_ACCESS_KEY_ID_ENCRYPTED | base64 -d` && \
    export SECRET_KEY_ID=`echo $AWS_SECRET_KEY_ID_ENCRYPTED | base64 -d` && \
    echo ACCESS_KEY_ID=$ACCESS_KEY_ID >> .env && \
    echo SECRET_KEY_ID=$SECRET_KEY_ID >> .env

RUN pip3 install boto3 

ADD main.py main.py

CMD ["python3", "main.py"]


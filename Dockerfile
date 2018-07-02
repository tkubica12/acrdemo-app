FROM tomasacrdemo.azurecr.io/base:flask
COPY app.py /opt/app.py
CMD ["python3", "/opt/app.py"]
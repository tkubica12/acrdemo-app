FROM tomasacrdemo.azurecr.io/base
COPY app.py /opt/app.py
CMD ["python3", "/opt/app.py"]
FROM tomasacrdemo/base
COPY app.py /opt/app.py
CMD ["python3", "/opt/app.py"]
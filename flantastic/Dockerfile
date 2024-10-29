FROM python

RUN pip install fastapi[standard]

COPY main.py .

CMD ["fastapi", "run", "main.py", "--port", "11434"]
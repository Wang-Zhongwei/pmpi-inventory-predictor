FROM python:3.11

RUN pip install jupyter pandas numpy scikit-learn matplotlib seaborn

WORKDIR /notebooks
COPY requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

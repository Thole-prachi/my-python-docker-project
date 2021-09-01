#our base image
FROM alpine:3.5

#install python and pip
RUN apk add --update py2-pip

#install python modules needed by the python app
COPY requirements.txt /usr/src/app
RUN pip install --no-cache-dir -r /root/my-python-docker-project/requirements.txt
#copy files required for the app to run
COPY app.py /usr/src/app/
COPY templates/index.html /root/my-python-docker-project/templates/

#tell the port number the container should expose
EXPOSE 5000

#run the application
CMD ["python", "/usr/src/app/app.py"]

 #The line below determines the build image to use
FROM tensorflow/tensorflow:latest-py3

#The next block determines what dependencies to load
RUN pip3 install absl-py==0.9.0
RUN pip3 install astor==0.8.1
RUN pip3 install cffi==1.13.2
RUN pip3 install Click==7.0
RUN pip3 install cycler==0.10.0
RUN pip3 install decorator==4.4.1
RUN pip3 install Flask==1.1.1
RUN pip3 install gast==0.3.2
RUN pip3 install gevent==1.4.0
RUN pip3 install google-pasta==0.1.8
RUN pip3 install greenlet==0.4.15
RUN pip3 install grpcio==1.26.0
RUN pip3 install gunicorn==20.0.4
RUN pip3 install h5py==2.10.0
RUN pip3 install imageio==2.6.1
RUN pip3 install itsdangerous==1.1.0
RUN pip3 install Jinja2==2.10.3
RUN pip3 install joblib==0.14.1
RUN pip3 install Keras-Applications==1.0.8
RUN pip3 install Keras-Preprocessing==1.1.0
RUN pip3 install kiwisolver==1.1.0
RUN pip3 install Markdown==3.1.1
RUN pip3 install MarkupSafe==1.1.1
RUN pip3 install matplotlib==3.1.2
RUN pip3 install networkx==2.4
RUN pip3 install numpy==1.18.1
RUN pip3 install Pillow==7.0.0
RUN pip3 install protobuf==3.11.2
RUN pip3 install pycparser==2.19
RUN pip3 install pyparsing==2.4.6
RUN pip3 install python-dateutil==2.8.1
RUN pip3 install PyWavelets==1.1.1
RUN pip3 install scikit-image==0.16.2
RUN pip3 install scikit-learn==0.21.3
RUN pip3 install scipy==1.1.0
RUN pip3 install six==1.13.0
RUN pip3 install tensorboard==1.14.0
RUN pip3 install tensorflow==1.14.0
RUN pip3 install tensorflow-estimator==1.14.0
RUN pip3 install termcolor==1.1.0
RUN pip3 install tflearn==0.3.2
RUN pip3 install Werkzeug==0.16.0
RUN pip3 install wrapt==1.11.2



# run as the user "galileo" with associated working directory
RUN useradd -ms /bin/bash galileo
USER galileo
WORKDIR /home/galileo

#This line determines where to copy project files from, and where to copy them to
COPY . .

#The entrypoint is the command used to start your project
ENTRYPOINT ["python3","MaxPoolGlobalMax3.py"]
 
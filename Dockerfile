FROM ubuntu:22.04 as base

RUN  DEBIAN_FRONTEND=noninteractive TZ=Indian 

RUN apt-get update -y \
&& apt-get install -y tzdata \
&& apt-get install -y software-properties-common \
&& add-apt-repository ppa:deadsnakes/ppa \
&& apt-get  install -y python3.9  \
&& apt install -y python3.10-venv \
&& apt-get install -y git \
&& add-apt-repository ppa:git-core/ppa \
&& apt-get update -y \ 
&& apt install -y git \
&& apt-get install -y python3-pip

ENV PIP_ROOT_USER_ACTION=ignore

#make directory for git clone
#RUN cd Documents
RUN mkdir Repo

WORKDIR /Repo

RUN git clone https://github.com/Vikas098766/Microservices.git


RUN cd Microservices
WORKDIR ./Microservices


RUN python3 -m venv venv
RUN . venv/bin/activate
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python3","app.py"]
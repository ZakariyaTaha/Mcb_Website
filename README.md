# Instructions

There are 3 ways to run the website.

## In the terminal using the CLI of streamlit (python)

Download the website’s code from the github public repository (https://github.com/ZakariyaTaha/Mcb_Website) using the following command:
```
git clone https://github.com/ZakariyaTaha/Mcb_Website.git
```

Go to the folder directory, and run the following command:
```
streamlit run app.py
```

## Using Docker

There are 2 ways you can use docker to run the website:

Either you pull the image from docker hub then run it using the following commands:
```
docker pull tahazakariya/mcb-website
docker container run -d -p 8080:8080 tahazakariya/mcb-website:latest
```
Or you can first build the image from scratch by going to the folder directory, using the following commands:
```
docker build -t tahazakariya/mcb-website:latest .
docker container run -d -p 8080:8080 tahazakariya/mcb-website:latest
```
After either of the run commands, you can access the website by going to: http://localhost:8080/

The second approach may take up a lot of time given that you’re building from scratch, but keep in mind that it’s the way to go if you want to deploy a new version on a server or a cloud service for example.

## Using the available website deployed on google cloud

You can directly use the available version of the website, deployed currently on google cloud, using the following link: https://toolbox---mcb-website-wuptr62oda-oa.a.run.app/

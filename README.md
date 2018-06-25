# Docker-node-serverless

[![Dockerhub badge](http://dockeri.co/image/hatchteam/python)](https://hub.docker.com/r/hatchteam/serverless-python)

Docker-powered build/deployment environment for Serverless projects. This Docker image is intended for use with CI/CD tools such as CircleCI.


---
This is required due to this bug
https://github.com/UnitedIncome/serverless-python-requirements/issues/106



docker build . -t hatchteam/serverless-python
docker push  hatchteam/serverless-python
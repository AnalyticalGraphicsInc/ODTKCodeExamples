# ODTK Runtime Containerization

This collection of code samples includes examples that demonstrate containerization of ODTK Runtime on Linux.

The following is a list of the examples in this collection along with a description of what they demonstrate.  
Each example project provides:
* A `README.md` file with instructions and explanations on what the example does and how to build and run the container 
either using directly the Docker command line or using Docker Compose (i.e., using the `docker-compose.yml` file in the 
same folder)
* A `Dockerfile` containing all the commands to assemble the image
* A `docker-compose.yml` file, enabling the use of Docker Compose to build and run the images

The images in these examples are built upon each other, and you need to build them in the correct order.  
Since all examples eventually derive from `odtk-runtime`, we recommend starting there.  
After that, if you have a specific example you'd like to experiment with, navigate to that folder's `README.md` file and 
follow the prerequisites section to determine what images need to be built for that example to work.

Further information can be found in the ODTK Help.


## [Custom Environment](custom-environment)
Provides the environment required to communicate with the Yum and Pip package managers in your organization. 
This is optional if you are directly connected to the internet. It is required if you are using a proxy/firewall or 
isolated network requiring different certificates, settings, or both.

## [Base ODTK Runtime Docker image](odtk-runtime)	
Provides the ODTK Runtime installation with the configuration (environment variables) to run ODTK.  This also installs
the required version of Python and any needed Python package dependencies.

## [Python ODTK Runtime Docker image](odtk-python)	
Derives from the base ODTK Runtime image and adds the ODTK Python api to the image.

## [Jupyter ODTK Runtime Docker image](odtk-jupyter)
Derives from the Python ODTK image and exposes JupyterLab from the container. Go to JupyterLab in your web browser 
to exercise Python notebooks using ODTK Runtime for computations. AGI also provides an example notebook.

## [Custom ODTK Runtime Service Docker image](odtk-webservice)	
Derives from the Python ODTK Engine image and shows how to develop and include your own web service(s) in the Docker 
image. You can write those web services in Java and Python for Linux, and also with .NET if using a Windows container. 
This is just a bare-bones minimal web service example using the Flask development server and is not production ready. 
Please refer to the Flask documentation for best practices on how to create and deploy a production-ready web service.

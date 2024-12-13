# DOCS
# https://github.com/jupyter/docker-stacks
# https://quay.io/organization/jupyter
# https://quay.io/repository/jupyter/all-spark-notebook

# Use the all-spark-notebook image as the base image
FROM quay.io/jupyter/all-spark-notebook:latest
ARG JUPYTERHUB_VERSION=5.2.1

# Make sure jupyterhub version matches with server
RUN pip3 install --no-cache \
    jupyterhub==$JUPYTERHUB_VERSION

# Install Node.js and npm
RUN conda install -c conda-forge nodejs

# Install the jupyterlab-git extension
RUN pip install jupyterlab-git

# Install the jupyter_scheduler extension
RUN pip install jupyter_scheduler

# make sure extensions are installed correctly
RUN jupyter lab build --dev-build=False --minimize=False

# Expose the default JupyterLab port
EXPOSE 8888

# Set the default command to start JupyterLab
CMD ["start-notebook.sh"]
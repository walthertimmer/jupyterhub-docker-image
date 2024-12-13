# DOCS
# https://github.com/jupyter/docker-stacks
# https://quay.io/organization/jupyter
# https://quay.io/repository/jupyter/all-spark-notebook

# Use the all-spark-notebook image as the base image
FROM quay.io/jupyter/all-spark-notebook:latest
ARG JUPYTERHUB_VERSION=5.2.1

RUN pip3 install --no-cache \
    jupyterhub==$JUPYTERHUB_VERSION

# Install Node.js and npm
RUN conda install -c conda-forge nodejs

# Install the jupyterlab-git extension
RUN pip install jupyterlab-git && \
    jupyter lab build --dev-build=False --minimize=False

# Expose the default JupyterLab port
EXPOSE 8888

# Set the default command to start JupyterLab
CMD ["start-notebook.sh"]

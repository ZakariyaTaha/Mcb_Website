FROM python:3.9

WORKDIR /app

# Install R
RUN apt-get update && apt-get install -y r-base
RUN apt-get update && apt-get install -y libharfbuzz-dev libfribidi-dev libgsl-dev
RUN apt-get install -y libmpfr-dev libgsl-dev libnlopt-dev cmake

# Copy all the files to the container
COPY . /app

# Install R libraries
RUN Rscript install.R
RUN R -e "install.packages('remotes', repos='http://cran.rstudio.com/', dependencies=TRUE)"
RUN R -e "if (!requireNamespace('remotes', quietly = TRUE)) stop('remotes package not found')"
RUN R -e "library(remotes); remotes::install_github('microbiome/mia')"


# Install Python libraries
RUN pip install -r requirements.txt

EXPOSE 8080

# Run Streamlit app
CMD streamlit run --server.port 8080 app.py
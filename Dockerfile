FROM python:3.9

WORKDIR /app

# Install dependencies for building R and required libraries
RUN apt-get update && apt-get install -y \
    software-properties-common \
    dirmngr \
    gnupg2 \
    build-essential \
    gfortran \
    libreadline-dev \
    libbz2-dev \
    liblzma-dev \
    libpcre2-dev \
    libpcre3-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libx11-dev \
    libxt-dev \
    libcairo2-dev \
    libpng-dev \
    libjpeg-dev \
    libtiff5-dev \
    libglib2.0-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libtiff-dev \
    libgtk2.0-dev \
    libmpfr-dev \
    libgmp3-dev \
    libnlopt-dev \
    cmake \
    wget \
    libgsl-dev \
    libblas-dev \
    liblapack-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install R 4.4.0 from source
RUN wget https://cran.r-project.org/src/base/R-4/R-4.4.0.tar.gz \
    && tar -xzvf R-4.4.0.tar.gz \
    && cd R-4.4.0 \
    && ./configure --enable-R-shlib --with-blas --with-lapack \
    && make \
    && make install \
    && cd .. \
    && rm -rf R-4.4.0 R-4.4.0.tar.gz

# Set R home environment variables
ENV R_HOME=/usr/local/lib/R
ENV PATH=$R_HOME/bin:$PATH
ENV LD_LIBRARY_PATH=$R_HOME/lib:$LD_LIBRARY_PATH

# Verify R installation
RUN R --version

# Install Python dependencies
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Copy all the files to the container
COPY . /app

# Install R libraries from install.R
RUN Rscript install.R

# Expose the port your app runs on
EXPOSE 8080

# Run Streamlit app
CMD ["streamlit", "run", "--server.port", "8080", "app.py"]

FROM huggingface/transformers-tensorflow-gpu

# Install additional Global Flood Monitor dependencies

RUN apt-get update
# Avoid being asked for a geographical location
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    python3-pandas python3-elasticsearch python3-psycopg2 python3-numpy python3-dill \
    python3-twitter python3-sklearn python3-keras python3-tz python3-gdal python3-nltk \
    python3-geopy python3-xlrd
# Only keras-radam is not on Ubuntu
RUN pip install keras-radam

# We already satisfy all requirements. Running pip again would install tensorflow twice.
#COPY requirements.txt ./
#RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "/bin/bash" ]

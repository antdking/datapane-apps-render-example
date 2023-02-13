ARG PYTHON_VERSION='3.10'

FROM python:${PYTHON_VERSION}
WORKDIR /app/

# load your files into the image
# To exclude files, setup a .dockerignore
COPY ./ /app/

# Install the App dependencies
RUN \
  if test -f 'requirements.txt'; then \
  pip install --no-cache-dir -r requirements.txt ;\
  fi

ENV PORT="8081"

# execute your app (what to run on the server)
CMD exec python 'app.py'

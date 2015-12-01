FROM java:latest

RUN apt-get update && yes | apt-get install closure-compiler

CMD closure-compiler --js /app.js > /build/app.min.js

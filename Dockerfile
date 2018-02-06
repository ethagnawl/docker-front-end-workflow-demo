FROM openjdk:10-slim

RUN apt-get update && yes | apt-get install closure-compiler

CMD closure-compiler --js /app.js > /build/app.min.js

# Dockerfile

# Use an official Python runtime as a parent image for ARM architecture
FROM arm64v8/python:3.9-slim

# Install system dependencies
RUN apt-get update && apt-get install -y sudo libgomp1
RUN apt-get update && apt-get install -y smartmontools

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5001

# Define environment variable
ENV FLASK_APP=app.py

# Run app.py when the container launches
CMD ["flask", "run", "--host=0.0.0.0"]

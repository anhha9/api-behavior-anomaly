# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the model file and the app into the container
COPY model/hgbt_final.joblib .
COPY app_model.py .

# Expose the port the app runs on
EXPOSE 5000

# Command to run the application
CMD ["python", "app_model.py"]









# Use the official Python base image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install gunicorn
# Expose port 5000 for the application
EXPOSE 5000

# Set environment variable for Flask
ENV FLASK_APP=app

# Run the application using Gunicorn
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:5000"]


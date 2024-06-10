FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

RUN pip install --upgrade pip

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# Replace this with your repository URL
RUN git clone https://github.com/DilmurodMak/yolov8n-streamlit.git .

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Expose port 8000 for Azure Web Apps
EXPOSE 8000

# Health check endpoint for Azure Web Apps
HEALTHCHECK CMD curl --fail http://localhost:8000/_stcore/health || exit 1

# Entry point to run the Streamlit app on port 8000
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8000", "--server.address=0.0.0.0"]

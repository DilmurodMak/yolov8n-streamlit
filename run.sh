echo "Updating package list and installing dependencies..."
apt-get update && apt-get install -y ffmpeg libsm6 libxext6

echo "Starting Streamlit application..."
python -m streamlit run app.py --server.port 8000 --server.address 0.0.0.0
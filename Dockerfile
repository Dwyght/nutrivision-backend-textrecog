FROM python:3.11-slim


RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    libtesseract-dev \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    ffmpeg \
    libsm6 \
    libxext6 \
    python3-opencv \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


WORKDIR /app


COPY requirements.txt .


RUN pip install --no-cache-dir -r requirements.txt


COPY . .


EXPOSE 8000


CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install git (jika dibutuhkan)
RUN apt-get update && apt-get install -y git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy all project files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt


EXPOSE 7860

CMD ["uvicorn", "run:main_app", "--host", "0.0.0.0", "--port", "7860", "--workers", "4"]

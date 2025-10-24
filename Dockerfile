# ------------------------------------------------------------
# COE379L Project 2 — FastAPI Inference Server
# ------------------------------------------------------------
# Base image: lightweight Python 3.11
FROM python:3.11-slim

# ---- Environment Variables ----
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    TF_CPP_MIN_LOG_LEVEL=2 \
    MODEL_PATH=/code/results/best_model.h5

# ---- System Dependencies (for Pillow, TensorFlow) ----
RUN apt-get update && apt-get install -y --no-install-recommends \
    libglib2.0-0 libsm6 libxrender1 libxext6 && \
    rm -rf /var/lib/apt/lists/*

# ---- Set Work Directory ----
WORKDIR /code

# ---- Python Dependencies ----
RUN pip install --no-cache-dir \
    tensorflow==2.15.0 \
    fastapi==0.110.0 \
    uvicorn[standard]==0.29.0 \
    pillow==10.0.0 \
    numpy==1.26.4 \
    python-multipart==0.0.6

# ---- Copy Source Code ----
COPY src/ /code/src/
COPY results/best_model.h5 /code/results/best_model.h5

# ---- Expose API Port (grader expects 5000) ----
EXPOSE 5000

# ---- Run FastAPI App ----
CMD ["uvicorn", "src.app:app", "--host", "0.0.0.0", "--port", "5000"]

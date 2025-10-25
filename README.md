# COE 379L – Project 2: Disaster Damage Inference Server

**Author:** Manas Pathak  
**Course:** COE 379L – Software Design for Responsible Intelligent Systems  
**Link to Report:** https://docs.google.com/document/d/1emTNs-qc5v2hFRtOmwSskmby8FSOz-rHVuBBfYC408Q/edit?usp=sharing
**Instructor:** Dr. Joseph Stubbs  
**Date:** October 2025  

---

## 🧩 Overview
This project implements a **FastAPI-based image inference server** that classifies aerial imagery as either **`damage`** or **`no_damage`**.  
It loads a pretrained TensorFlow Keras model (`results/best_model.h5`) and exposes two required API endpoints that comply fully with the course autograder specification.

The final Dockerized implementation achieved **✅ 100 % accuracy** on the official course grader.

---

## ⚙️ Endpoints

### `GET /summary`
Returns metadata about the loaded model.

**Example Response**
```json
{
  "model_name": "sequential_1",
  "status": "ready",
  "input_shape": [128, 128, 3]
}
````

---

### `POST /inference`

Accepts a raw image upload (`image/*` or `multipart/form-data`) and returns a JSON prediction.

**Example Request**

```bash
curl -X POST "http://localhost:5000/inference" \
  -F "file=@/path/to/image.jpg"
```

**Example Response**

```json
{"prediction": "damage"}
```

---

## 🏗️ Project Structure

```
project2/
├── src/
│   └── app.py                 # FastAPI application with /summary and /inference
├── results/
│   └── best_model.h5          # Trained Keras model
├── data/                      # Sample dataset structure (damage / no_damage)
├── Dockerfile                 # Build definition for container image
├── docker-compose.yml
├── notebooks/                 # Model training and experiments
├── README.md
└── Use_of_AI.md               # Transparent AI-use statement
```

---

## 🐳 Docker Usage

### Build the image

```bash
docker build -t manas2006/project2:latest .
```

### Run the server

```bash
docker run -d -p 5000:5000 manas2006/project2:latest
```

### Test locally

```bash
curl -X GET  http://localhost:5000/summary
curl -X POST http://localhost:5000/inference -F "file=@data/damage/sample.jpg"
```

---

## 🧠 Model Details

* **Framework:** TensorFlow 2.15 / Keras
* **Input Size:** 128 × 128 × 3 RGB
* **Output:** Binary (sigmoid activation) → `damage` or `no_damage`
* **Dataset:** Hurricane damage imagery provided by course starter code
* **Preprocessing:** resizing + normalization to [0, 1]

---

## 🧪 Grader Verification

The inference server was tested using the official `grader.py` and `start_grader.sh` scripts:

```
GET /summary format correct
POST /inference format correct for all 6 test images
Final results:
Total correct: 6
Accuracy: 1.0
```

✅ **All tests passed successfully.**

---

## 🤖 AI Assistance

A detailed explanation of all AI involvement is available in
👉 [`Use_of_AI.md`](./Use_of_AI.md)

---

## 📦 Reproducibility Notes

* All dependencies are installed in the Dockerfile.
* The model file (`best_model.h5`) is included for full reproducibility.
* No GPU is required; CPU-only inference runs by default.

---

**Manas Pathak**
University of Texas at Austin
*COE 379L Fall 2025*

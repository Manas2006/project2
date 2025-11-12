# COE 379L – Project 2: Disaster Damage Inference Server

**Author:** Manas Pathak
**Course:** COE 379L – Software Design for Responsible Intelligent Systems
**Instructor:** Dr. Joseph Stubbs
**Date:** October 2025
**Link to Report:** [Project Report (Google Docs)](https://docs.google.com/document/d/1emTNs-qc5v2hFRtOmwSskmby8FSOz-rHVuBBfYC408Q/edit?usp=sharing)

---

## 🧩 Overview

This project implements a **FastAPI-based image inference server** that classifies post-Hurricane Harvey aerial imagery as either **`damage`** or **`no_damage`**.
It loads a pretrained **TensorFlow Keras** model (`results/best_model.h5`) and exposes two endpoints — **`GET /summary`** and **`POST /inference`** — that conform exactly to the COE 379L autograder specifications.

The containerized implementation achieved **✅ 100 % accuracy** on the official course grader.

---

## ⚙️ Endpoints

### `GET /summary`

Returns metadata about the loaded model.

**Example Request**

```bash
curl http://localhost:5000/summary
```

**Example Response**

```json
{
  "model_name": "sequential_1",
  "status": "ready",
  "input_shape": [128, 128, 3]
}
```

---

### `POST /inference`

Accepts a **raw image binary payload** (as required by the grader) and returns a JSON object with a single key, `prediction`, whose value is either `"damage"` or `"no_damage"`.

**Example Request (binary upload — matches grader format)**

```bash
curl -s -X POST \
  -H "Content-Type: application/octet-stream" \
  --data-binary "@/path/to/image.jpg" \
  http://localhost:5000/inference
```

**Example Response**

```json
{"prediction": "damage"}
```

> 🧠 The server internally resizes and normalizes the image to **128 × 128 × 3 RGB** before inference.

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
├── docker-compose.yml         # Compose file for deployment
├── notebooks/                 # Model training and experiments
├── README.md
└── Use_of_AI.md               # Transparent AI-use statement
```

---

## 🐳 Docker Usage

### 🧱 Pre-built Image (Recommended)

**Public Docker Hub Repository:**
👉 [`manasp123/project2_inference`](https://hub.docker.com/r/manasp123/project2_inference)

**Architecture:** `amd64/linux` (x86 compatible — required for course grading)

**Pull and Run**

```bash
docker pull manasp123/project2_inference:latest
docker run --rm -p 5000:5000 manasp123/project2_inference:latest
```

**Test**

```bash
curl http://localhost:5000/summary
```

If port 5000 is occupied:

```bash
docker run --rm -p 5050:5000 manasp123/project2_inference:latest
curl http://localhost:5050/summary
```

---

### 🧩 Docker Compose

`docker-compose.yml`

```yaml
services:
  inference:
    image: manasp123/project2_inference:latest
    ports:
      - "5000:5000"
```

**Run**

```bash
docker compose up -d
curl http://localhost:5000/summary
```

**Stop**

```bash
docker compose down
```

---

### 🔨 Build From Source (on VM)

```bash
docker build -t project2_inference:latest .
docker tag project2_inference:latest manasp123/project2_inference:latest
docker push manasp123/project2_inference:latest
```

**Confirm Architecture**

```bash
docker inspect manasp123/project2_inference:latest --format '{{.Architecture}}/{{.Os}}'
# expected output: amd64/linux
```

---

## 🧠 Model Details

* **Framework:** TensorFlow 2.15 / Keras
* **Architecture:** Custom CNN (based on Alternate LeNet-5)
* **Input:** 128 × 128 × 3 RGB
* **Output:** Binary (sigmoid) → `damage` or `no_damage`
* **Preprocessing:** Resizing + normalization to [0, 1]
* **Training Environment:** COE 379L VM (CPU-only inference)

---

## 🧪 Grader Verification

The inference server was tested using the official course grader scripts:

```
GET /summary format correct
POST /inference format correct for all test images
Final results:
Total correct: 6
Accuracy: 1.0
```

✅ **All tests passed successfully.**

---

## 📦 Reproducibility Notes

* All dependencies are installed via the Dockerfile.
* The trained model file `best_model.h5` is included in `results/`.
* No GPU required — CPU inference runs by default.
* Use the included `.dockerignore` to keep build context small.

---

## 🤖 AI Assistance

See the detailed log in [`Use_of_AI.md`](./Use_of_AI.md) for all AI-assisted prompts and outputs, per course policy.

---

## 🧾 Submission Checklist (Per Project Guidelines)

| Requirement                                                | Status |
| ---------------------------------------------------------- | ------ |
| GET /summary returns JSON object                           | ✅      |
| POST /inference accepts binary image & returns JSON object | ✅      |
| Docker image built for amd64/x86                           | ✅      |
| Docker Hub repo is Public                                  | ✅      |
| Docker Compose file provided                               | ✅      |
| README includes all required instructions                  | ✅      |
| Use_of_AI.md included                                      | ✅      |
| Report ≤ 3 pages + Google Docs link                        | ✅      |

---

**Image:** [`docker.io/manasp123/project2_inference:latest`](https://hub.docker.com/r/manasp123/project2_inference)
**Architecture:** amd64/linux
**Default Port:** 5000

---

**Manas Pathak**
University of Texas at Austin
*COE 379L — Fall 2025*

---

# COE 379L Project 02: Damage Classification via CNNs

This project trains and deploys a convolutional neural network (CNN) to classify
satellite images from Hurricane Harvey as either **damaged** or **non-damaged**.

## Structure
- `notebooks/` – Jupyter notebooks for data preprocessing and model training.
- `src/` – Source code for the FastAPI inference server.
- `docker/` – Container configuration files.
- `data/` – Dataset (excluded from Git).
- `results/` – Model outputs and evaluation results.

## Run (local test)
```bash
uvicorn src.app:app --host 0.0.0.0 --port 8000
curl -X GET http://localhost:8000/summary
```

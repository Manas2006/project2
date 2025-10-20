from fastapi import FastAPI

app = FastAPI()

@app.get("/summary")
def summary():
    return {"model": "init", "status": "setup complete"}

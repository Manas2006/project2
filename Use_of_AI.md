# Use of AI Documentation — COE 379L Project 2

## Overview
AI tools (primarily **ChatGPT (GPT-5)**) were used as an assistive resource during the development of this project.  
All conceptual understanding, code integration, debugging, and testing were ultimately performed by **Manas Pathak**.  
This document transparently records where and how AI assistance was applied.

---

## 1. Purpose of AI Use
AI was used to **accelerate development**, **clarify implementation details**, and **validate design correctness** for the following:

- Debugging TensorFlow model-loading and inference logic.  
- Verifying FastAPI route specifications (`/summary`, `/inference`) matched the official grader requirements.  
- Generating boilerplate for the `Dockerfile` and runtime dependencies (`python-multipart`, port 5000 exposure).  
- Diagnosing 500-error responses and assisting with final successful integration with the course autograder.  
- Producing documentation (this file) and a clean project summary for reproducibility.

No AI tool was used to fabricate results, modify evaluation metrics, or misrepresent project outcomes.

---

## 2. Extent of AI-Generated Code
AI contributed **syntactically correct scaffolding** for several components, which were subsequently reviewed, edited, and tested by the author:

| File | AI Contribution | Human Verification |
|------|------------------|--------------------|
| `src/app.py` | Initial endpoint structure and request parsing logic | All model I/O, preprocessing, and error handling verified manually |
| `Dockerfile` | Base image, dependency setup, and port configuration | Adjusted to ensure correct environment variables and compatibility |
| `docker-compose.yml` | Generated minimal container orchestration template | Verified by local Docker testing |
| `Use_of_AI.md` | Fully generated for transparency | Reviewed and finalized without modification to content integrity |

All code was executed, validated, and debugged by **Manas Pathak** to ensure correctness and compliance with assignment expectations.

---

## 3. Tools and Models Used
- **ChatGPT (GPT-5, OpenAI)** — used interactively for code review, debugging, and documentation generation.  
- **Python 3.11**, **TensorFlow 2.15**, **FastAPI 0.110**, **Uvicorn**, and **Docker** were used for all final execution.  

No external pretrained models or auto-labeling systems outside those provided in the assignment were used.

---

## 4. Reflection
AI tools were valuable for improving productivity and clarity during the debugging process, particularly for diagnosing environment-related errors and refining Docker configuration.  
However, all design decisions, architecture choices, and dataset handling remained **student-directed** and **independently verified**.

---

**Author:** Manas Pathak  
**Date:** October 2025  
**Course:** COE 379L – Software Design for Responsible Intelligent Systems  
**Instructor:** Dr. Joseph Stubbs

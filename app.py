import uvicorn
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from inference_engine import PrologInferenceEngine
from database import all_symptoms, words_map, reversed_words_map

app = FastAPI()
app.mount("/static", StaticFiles(directory="static"), name="static")
templates = Jinja2Templates(directory="templates")

engine = PrologInferenceEngine()

@app.get("/", response_class=HTMLResponse)
async def home(request: Request):
    return templates.TemplateResponse("index.html", {"request": request, "symptoms": [words_map[symptom] for symptom in all_symptoms]})

@app.post("/diagnose")
async def diagnose(symptoms: list[str]):
    ranking = engine.rank_diseases([reversed_words_map[symptom] for symptom in symptoms])
    clean_ranking = []
    if ranking:
        for rank in ranking:
            disease, prob = rank
            clean_ranking.append((words_map[disease], int(prob)))
        return {"diagnoses": clean_ranking}
    else:
        return {"message": "No match found yet. Please consult a real doctor."}

@app.post("/diagnose_text")
async def diagnose_text(input_text: str):
    # Parse the user's textual description of symptoms
    symptoms = engine.parse_input_to_symptoms(input_text)
    if not symptoms:
        return {"message": "No recognized symptoms found. Please try again."}
    ranking = engine.rank_diseases(symptoms)
    clean_ranking = []
    if ranking:
        for rank in ranking:
            disease, prob = rank
            clean_ranking.append((words_map[disease], int(prob)))
        return {"diagnoses": clean_ranking}
    else:
        return {"message": "No match found yet. Please consult a real doctor."}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
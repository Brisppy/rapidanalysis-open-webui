from fastapi import FastAPI, Request

app = FastAPI()


@app.post("/api/chat")
async def read_test(request: Request):
    body = await request.json()
    print(body)
    return {"message": {"content": request.client.host}, "done": False}


@app.get("/")
def read_root():
    return "flantastic is running"


@app.get("/api/version")
def api_version():
    return { "version" : "0.1.00" }


@app.get("/api/tags")
def api_tags():
    return {
    "models": [
        {
            "name": "flantastic",
            "model": "Flan:0.5b",
            "digest": "",
            "details": {
                "parameter_size": "494.03M",
            }
        }
    ]
}

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Any, Dict
import subprocess
import tempfile
import json
import os

app = FastAPI(title="KodeKid Python Sandbox", version="0.1.0")

class ExecuteRequest(BaseModel):
    code: str
    timeout_ms: int = 1500

class ExecuteResponse(BaseModel):
    stdout: str
    stderr: str
    success: bool

@app.get("/health")
def health() -> Dict[str, Any]:
    return {"status": "ok"}

@app.post("/execute", response_model=ExecuteResponse)
def execute(req: ExecuteRequest) -> ExecuteResponse:
    # Simplified MVP execution; replace with better sandboxing (e.g., Pyodide, firejail)
    with tempfile.TemporaryDirectory() as tmpdir:
        script_path = os.path.join(tmpdir, "main.py")
        with open(script_path, "w", encoding="utf-8") as f:
            f.write(req.code)
        try:
            cp = subprocess.run(
                ["python3", script_path],
                capture_output=True,
                text=True,
                timeout=max(0.1, req.timeout_ms / 1000.0),
                cwd=tmpdir,
            )
            return ExecuteResponse(
                stdout=cp.stdout,
                stderr=cp.stderr,
                success=cp.returncode == 0,
            )
        except subprocess.TimeoutExpired as e:
            return ExecuteResponse(stdout=e.stdout or "", stderr="Timeout", success=False)
        except Exception as e:  # noqa: BLE001
            raise HTTPException(status_code=500, detail=str(e))

#!/usr/bin/env bash
# Activate venv if present (ignore errors if not)
source venv/bin/activate 2>/dev/null || true
# Bind to all interfaces in WSL; Windows forwards to localhost
jupyter notebook --no-browser --ip=0.0.0.0 --port=8888

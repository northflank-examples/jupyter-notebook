FROM ghcr.io/pytorch/pytorch:2.11.0-cuda12.9-cudnn9-devel

RUN rm -f /usr/lib/python3.12/EXTERNALLY-MANAGED \
 && pip install --no-cache-dir jupyterlab

ENV PIP_USER=1 \
    PYTHONUSERBASE=/root/.local \
    PATH="/root/.local/bin:$PATH"

WORKDIR /workspace
EXPOSE 8888

CMD ["jupyter", "lab", \
     "--ip=0.0.0.0", \
     "--port=8888", \
     "--no-browser", \
     "--allow-root", \
     "--ServerApp.root_dir=/workspace"]

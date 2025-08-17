import subprocess
from libqtile.lazy import lazy

@lazy.function
def shutdown(_):
    exe = "/home/perry/scripts/prompt"
    prompt = "Are you sure you want to shutdown?"
    kill = "/home/perry/scripts/_shutdown"
    subprocess.call(["sh", exe, prompt, kill])

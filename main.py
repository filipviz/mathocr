import subprocess
from PIL import Image
from pix2tex.cli import LatexOCR

screenshot_path = "/tmp/latex-shot.png"
subprocess.run(["screencapture", "-i", screenshot_path])
image = Image.open(screenshot_path)
model = LatexOCR()

text = model(image)
subprocess.run(["pbcopy"], input=text.encode())

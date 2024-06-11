# mathocr

1. Press keyboard shortcut.
2. Select math equation on your screen.
3. Get LaTeX code in clipboard.

`mathocr` sets up a MacOS Quick Action that uses [`lukas-blecher/LaTeX-OCR`](https://github.com/lukas-blecher/LaTeX-OCR) to convert an image of a math equation to LaTeX code. You can trigger the Quick Action with a keyboard short cut. The LaTeX code is copied to your clipboard.

To install:

```bash
git clone https://github.com/filipviz/mathocr
cd mathocr
chmod +x setup.sh
./setup.sh
```

Once you run `setup.sh`, go to System Preferences -> Keyboard -> Keyboard Shortcuts... -> Services -> General and assign a keyboard shortcut to `mathocr`. 

I made this for personal use and it may have bugs. After making it I saw [Pix2Text](https://github.com/breezedeus/pix2text) which may be a better option for you.

# tr: translate or delete chars

## sample: transform a picture into a string (to serve as a json endpoint)

    base64 base.png | tr -d '\n' | v -
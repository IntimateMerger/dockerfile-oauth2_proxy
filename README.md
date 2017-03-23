[![Circle CI](https://circleci.com/gh/IntimateMerger/dockerfile-oauth2_proxy/tree/master.svg?style=svg)](https://circleci.com/gh/IntimateMerger/dockerfile-oauth2_proxy/tree/master)

# oauth2_proxy Dockerfile
Dockerfile for [oauth2_proxy](https://github.com/bitly/oauth2_proxy)

## How to use this image

### Environment

none

### Example

```bash
$ docker run -p 4180:4180 -t intimatemerger/oauth2_proxy \
    -upstream=http://127.0.0.1:8080 \
    -client-id=123456.apps.googleusercontent.com \
    -client-secret=XXXXXXXXXXXXXXXXXXXXX \
    -email-domain=example.com \
    -cookie-secret=secret \
    -cookie-domain=www.example.com
```

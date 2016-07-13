[![Circle CI](https://circleci.com/gh/IntimateMerger/dockerfile-oauth2_proxy/tree/master.svg?style=svg)](https://circleci.com/gh/IntimateMerger/dockerfile-oauth2_proxy/tree/master)

# oauth2_proxy Dockerfile
Dockerfile for [oauth2_proxy](https://github.com/bitly/oauth2_proxy)

This Container supports Google Apps only.

## How to use this image

### Environment

If you don't set the env, Rundeck use the default env.

| name | default | description |
| --- | --- | --- |
| UPSTREAM |  | the http url(s) of the upstream endpoint |
| CLIENT_ID |  | the OAuth Client ID: ie: "123456.apps.googleusercontent.com" |
| CLIENT_SECRET |  | the OAuth Client Secret |
| EMAIL_DOMAIN | | authenticate emails with the specified domain |
| COOKIE_SECRET | secret |  |
| COOKIE_DOMAIN | "" |  |

### Example

```bash
$ docker run -p 4180:4180 \
  -e "UPSTREAM=http://127.0.0.1:8080" \
  -e "CLIENT_ID=123456.apps.googleusercontent.com" \
  -e "CLIENT_SECRET=XXXXXXXXXXXXXXXXXXXXX" \
  -e "EMAIL_DOMAIN=example.com" \
  -t intimatemerger/oauth2_proxy
```

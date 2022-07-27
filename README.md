```
curl -X GET 'https://api.newrelic.com/v2/applications.json' \
     -H "Api-Key:$API_KEY" -i \
     -d "filter[name]=$NAME"

def url = "https://api.newrelic.com/v2/applications/${app_id}/deployment.json"
def apiKey = 'adfadalkdjnadajkhdilalds'
def data = [
    'description' : "${desccption}",
    'user' : "${env.GIT_COMMITTER_NAME}",
    'timestamp': "${timestamp}",
    'revision' : "${env.BUILD_ID}",
    'changelog': "${env.JOB_NAME}"
]

def deploy = [
    'deployment': data
]

def dataStr = writeJSON returnText: true, json: deploy

httpRequest contentType: 'APPLICATION_JSON',
    customHeaders: [[maskValue: true, name: 'Api-Key', value: apiKey]],
    httpMode: 'POST', 
    requestBody: dataStr,
    responseHandle: 'NONE',
    url: url,
    wrapAsMultipart: false
```

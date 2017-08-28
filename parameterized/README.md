# Parameterized nomad job

Demonstrates how to use the parameterized stanza for nomad.
`sls` is the job name, which stands for serverless.

```bash

# Start a nomad server
$ nomad agent -dev


# There are severals way to dispatch a job
# 1. Through CLI
$ nomad job dispatch -meta dispatcher_email=john.doe@mail.com \
    -meta pager_email=john.doe@mail.com sls config.json

# 2. Through REST API
# POST	/v1/job/:job_id/dispatch
{
  "Payload": "A28C3==", #  Specifies a base64 encoded string containing the payload. This is limited to 15 KB.
  "Meta": { # Specifies arbitrary metadata to pass to the job.
    "key": "Value"
  }
}

$ curl -X POST -d '{"Payload": "ew0KICAgICJkYXRhIjogMQ0KfQ==", "Meta": {"dispatcher_email": "hello@mail.com"}}' \
http://localhost:4646/v1/job/sls/dispatch
```

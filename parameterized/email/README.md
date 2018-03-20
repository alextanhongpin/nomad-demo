# Nomad Parameterized Job

## Build go binary

```bash
$ go build -o email
```

## Run nomad

Run a nomad development agent and also set the data directory relative to the current directory. This allows us to monitor the logs that are created for the jobs, in order to verify that the job is invoked.

```bash
$ nomad agent -data-dir ./tmp/nomad -dev
```

## Register Job

```bash
$ nomad plan email.nomad

# Submit
$ nomad run -check-index 0 email.nomad
```

## Dispatch Job

Dispatch a job with the meta.

```bash
$ nomad job dispatch -detach -meta NAME=john -meta hello=doe email
```

## Error 

Stop nomad. Delete the `tmp` folder. Restart nomad.

```
Error querying allocation: Unexpected response code: 500 (alloc lookup failed: index error: Invalid UUID: encoding/hex: invalid byte: U+006D 'm')
```
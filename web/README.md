# Web

Running golang web applications with nomad.


## Port

There are three ways to setup the port in nomad:


First is by listening to the env called `NOMAD_PORT_web`: 
```golang
port := os.Getenv("NOMAD_PORT_web")
if port == "" {
    port = "8080"
}
```

The `_web` suffix is from the name of the port in the nomad template.

```hcl
port "web" {}
```

The second method is by passing an enviroment called PORT through flags: 

```hcl
args  = ["-PORT", "${NOMAD_PORT_web}"]
```

This would be the preferred way as it will not cause changes on the server side.

The third way is by passing it through the env:

```env
env {
    PORT = "${NOMAD_PORT_web}"
}
```
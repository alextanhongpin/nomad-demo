# nomad-demo

## Start a nomad instance

```bash
$ nomad agent -dev
```

## Init a nomad file:

```bash
$ nomad init
```

## Register our job


```bash
$ nomad run example.nomad
$ nomad status example
$ nomad plan example.nomad
$ nomad alloc-status 39c6bce3
$ nomad logs 39c6bce3 redis

# Redis should be up and running at 127.0.0.1:54703
# redis-cli -p 54703
$ nomad stop example
```


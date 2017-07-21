# Nomad

This particular repo demonstrates the capability of `nomad`.

## Questions

There are several questions that needs to be answered here:

1. What is nomad
2. How is it different than Docker
3. Why use nomad?
4. What can you do with nomad?
5. What are the best practices?


## Setup

Start a nomad agent by running the following command. For development purpose, a single instance is sufficient. (TODO: What are the recommended number of nomad running, and why?)

```bash
$ nomad agent -dev
```

## Init:

Initialize a new nomad project with the command below. It will create an `example.nomad` file. (TODO: What is this file?)

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


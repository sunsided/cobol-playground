# 🛝🦕 COBOL Playground

## Get going

Install the GnuCOBOL (`gnucobol`/`cobc`) compiler, then compile and run the examples.

### Simple Example

```shell
cobc -x hello_world.cbl
./hello_world
```

Alternatively, use Make:

```shell
make run_hello_world
```

### Example using a Shared Library

This is a bit more involved to build and run, so just use Make:

```shell
make run_hello_driver
```

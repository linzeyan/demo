# demo

## usage

### command1

```bash
docker run -d -p 80:80 --name demo zeyanlin/gin-demo /usr/bin/demo -a args
```

Output

```shell
→ curl localhost
args
```

### command2

```bash
docker run -d -p 80:80 --name demo zeyanlin/gin-demo
```

Output

```shell
→ curl localhost
```
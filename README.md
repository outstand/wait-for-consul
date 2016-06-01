# wait-for-consul

This docker image is intended to be used with https://github.com/outstand/consul_stockpile to protect against a race condition when setting up a cluster.

We use this at Outstand to delay the startup of `amazon-ecs-agent` until consul is fully bootstrapped.

Example RancherOS service:
```yaml
wait-for-consul:
  image: outstand/wait-for-consul:latest
  labels:
    io.rancher.os.scope: system
    io.rancher.os.after: consul-client
    io.rancher.os.detach: "false"
  environment:
    CONSUL_HOST: 172.18.0.1
```

You can then use `io.rancher.os.after: wait-for-consul` in another service description.

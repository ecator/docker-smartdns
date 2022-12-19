# docker-smartdns

[pymumu/smartdns](https://github.com/pymumu/smartdns)的容器版本，可以直接通过下面命令启动：

```
docker run -d --name smartdns --restart always -p 53:53/udp -v smartdns:/app/smartdns.conf.d ecat/smartdns
```

初次启动会生成默认的配置文件，可以手动修改容器里面的`/app/smartdns.conf.d/smartdns.conf`文件后重新启动即可。

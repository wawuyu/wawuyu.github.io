# 本地环境搭建

## minikube

1. [安装教程](http://soulmz.me/2020/04/29/minikube-installed-for-mac/)

如下命令将自动使用阿里云服务来支持minikube的环境配置

```
minikube start --image-mirror-country='cn'
```

minikube 提供了非常多的配置参数，

常用配置参数如下

- `--driver=***` 从1.5.0版本开始，Minikube缺省使用系统优选的驱动来创建Kubernetes本地环境，比如您已经安装过Docker环境，minikube 将使用 `docker` 驱动
- `--cpus=2`: 为minikube虚拟机分配CPU核数
- `--memory=2048mb`: 为minikube虚拟机分配内存数
- `--registry-mirror=***` 为了提升拉取Docker Hub镜像的稳定性，可以为 Docker daemon 配置镜像加速，参考[阿里云镜像服务](https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors)
- `--kubernetes-version=***`: minikube 虚拟机将使用的 kubernetes 版本



安装命令： 

```sh
minikube start --image-mirror-country='cn' --registry-mirror='https://9sznap3j.mirror.aliyuncs.com'
```


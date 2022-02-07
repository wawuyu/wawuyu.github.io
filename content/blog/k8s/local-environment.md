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



启动：

```sh
minikube dashboard
```



## 核心概念

### Pod

​	Pod 是 Kubernetes 的一个最小调度以及资源单元。用户可以通过 Kubernetes 的 Pod API 生产一个 Pod，让 Kubernetes 对这个 Pod 进行调度，也就是把它放在某一个 Kubernetes 管理的节点上运行起来。一个 Pod 简单来说是对一组容器的抽象，它里面会包含一个或多个容器。

+ 最小的调度以及资源单元
+ 由一个或者多个容器组成
+ 定义容器运行的方式（Command 、环境变量等）
+ 提供给容器共享的运行环境（网络、进程空间）

---



### Volume

​	Volume 就是卷的概念，它是用来管理 Kubernetes 存储的，是用来声明在 Pod 中的容器可以访问文件目录的，一个卷可以被挂载在 Pod 中一个或者多个容器的指定路径下面。

+ 声明在 Pod 中的容器可访问的文件目录
+ 可以被挂载在 Pod 中一个（或者多个）容器的指定路径下
+ 支持多种后端存储的抽象
  + 本地、分布式、云存储

---



### Deployment

​	Deployment 是在 Pod 这个抽象上更为上层的一个抽象，它可以定义一组 Pod 的副本数目、以及这个 Pod 的版本。一般大家用 Deployment 这个抽象来做应用的真正的管理，而 Pod 是组成 Deployment 最小的单元。

+ 定义一组 Pod 的副本数目、版本等
+ 通过控制器（Controller）维持 Pod 的数目
  + 自动恢复失败的 Pod
+ 通过控制器以指定的策略控制版本
  + 滚动升级、重新生成、回滚等

---



### Service

​	Service 提供了一个或者多个 Pod 实例的稳定访问地址。

+ 提供访问一个或者多个 Pod 实例的稳定访问地址
+ 支持多种访问方式时间
  + ClusterIP
  + NodePort
  + LoadBalancer

---



### Namespace

​	Namespace 是用来做一个集群内部的逻辑隔离的，它包括鉴权、资源管理等。Kubernetes 的每个资源，比如刚才讲的 Pod、Deployment、Service 都属于一个 Namespace，同一个 Namespace 中的资源需要命名的唯一性，不同的 Namespace 中的资源可以重名。

+ 一个集群内部的逻辑隔离机制（鉴权、资源额度）
+ 每个资源都属于一个 Namespace
+ 同一个 Namespace 中的资源命名唯一
+ 不同的 Namespace 中的资源可重名

---





## 参考

[李响    从零开始入门 K8s:  详解 K8s 核心概念](https://www.infoq.cn/article/knmavdo3jxs3qpkqtzbw)


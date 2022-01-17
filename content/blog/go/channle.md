---
title: "Channle 的使用"
date: 2020-05-14T22:00:00+06:00
draft: false

# post thumb
image: "images/featured-post/post-1.jpg"

# meta description
description: "this is meta description"

# taxonomies
categories: 
  - "channel"
tags:
  - "Go"

# post type
type: "featured"
---



## channel 介绍

​		goroutine是Go语言程序的并发体的话，那么channel则是它们之间的通信机制。一个channel是一个通信机制，它可以让一个goroutine通过它给另一个goroutine发送值信息。每个channel都有一个特殊的类型，也就是channels可发送数据的类型。

## channel 使用场景

+ 消息传递、消息过滤
+ 信号广播
+ 事件订阅与广播
+ 请求、响应转发
+ 任务分发
+ 结果汇总
+ 并发控制
+ 同步与异步

---

## channel 状态

+ nil，未初始化的状态，只进行了声明，或者手动赋值为`nil`
+ active，正常的channel，可读或者可写
+ closed，已关闭，**千万不要误认为关闭channel后，channel的值是nil**

---

## channel 操作

+ 读
+ 写
+ 关闭

|   操作    | nil的channel | 正常channel | 已关闭channel |
| :-------: | :----------: | :---------: | :-----------: |
|   <- ch   |     阻塞     | 成功或阻塞  |   读到零值    |
|   ch <-   |     阻塞     | 成功或阻塞  |     panic     |
| close(ch) |    panic     |    成功     |     panic     |

```html
对于nil通道的情况，也并非完全遵循上表，**有1个特殊场景**：当`nil`的通道在`select`的某个`case`中时，这个case会阻塞，但不会造成死锁。
```

---



## 阻塞场景

**无论是有缓存通道、无缓冲通道都存在阻塞的情况**。阻塞场景共4个，有缓存和无缓冲各2个。

**无缓冲通道**的特点是，发送的数据需要被读取后，发送才会完成，它**阻塞场景**：

+ 通道中无数据，但执行读通道。
+ 通道中无数据，向通道写数据，但无协程读取。



**有缓存通道**的特点是，有缓存时可以向通道中写入数据后直接返回，缓存中有数据时可以从通道中读到数据直接返回，这时有缓存通道是不会阻塞的，它**阻塞场景是**

+ 通道的缓存无数据，但执行读通道。
+ 通道的缓存已经占满，向通道写数据，但无协程读。


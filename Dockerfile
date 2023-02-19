# 使用官方提供的 alpine 镜像作为基础镜像
FROM alpine:3.14

# 设置工作目录
WORKDIR /app

# 安装必要的依赖
RUN apk add --no-cache wget

# 下载 nps 并解压
RUN wget https://github.com/ehang-io/nps/releases/download/v0.26.10/linux_amd64_server.tar.gz && \
    tar -xzf linux_amd64_server.tar.gz && \
    rm -f linux_amd64_server.tar.gz

# 暴露 nps 服务端口
EXPOSE 80

# 运行 nps 服务
CMD ["./nps", "server"]

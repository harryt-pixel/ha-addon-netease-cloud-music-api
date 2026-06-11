# NetEase Cloud Music API for Home Assistant

基于 [moefurina/ncm-api](https://hub.docker.com/r/moefurina/ncm-api) 预构建镜像的 Home Assistant addon，提供网易云音乐 API 服务。

## 安装

将此仓库添加到 Supervisor > Add-on Store > Repository:

```
https://github.com/harryt-pixel/ha-addon-netease-cloud-music-api
```

## 配置

| 选项 | 默认值 | 说明 |
|------|--------|------|
| port | 3000 | API 服务端口 |
| enable_flac | true | 启用无损音质 |
| cors_allow_origin | * | 跨域允许的域名 |
| enable_proxy | false | 启用代理 |
| proxy_url | | 代理地址 |
| enable_general_unblock | true | 全局解灰 |
| select_max_br | false | 选择最高码率 |
| unblock_source | pyncmd,qq,bodian,migu,kugou,kuwo | 音源优先级 |

## 使用

启动后访问 `http://你的HA地址:3000`，可配合 `ha_cloud_music` 自定义组件使用。

## 许可证

MIT

# JSONP

JSONP 就是为了跨域获取资源而产生的一种技术手段，因为[同源策略](https://developer.mozilla.org/zh-CN/docs/Web/Security/Same-origin_policy)会限制不同源间的请求，jsonp就是利用[“跨源网络访问”](https://developer.mozilla.org/zh-CN/docs/Web/Security/Same-origin_policy#%E8%B7%A8%E6%BA%90%E7%BD%91%E7%BB%9C%E8%AE%BF%E9%97%AE)中跨域资源嵌入使用`Script`标签的`src`属性发起跨域请求的原理来实现的。
 

使用Script标签：
![](https://user-images.githubusercontent.com/26270009/156151400-f38f5ec0-8120-4359-911a-18b504c20bfe.png)

还可以使用`jquery`：
![](https://user-images.githubusercontent.com/26270009/156152133-1dc7c826-f022-4439-a8ae-6adcdfefd9b8.png)


#  JSONP跨域漏洞 

## Callback自定义导致的XSS
> 挺鸡肋的，不深入研究了

如果 `callback` 的参数可控的话：

- script:
```html
<script src="http://localhost:8081/jsonp?callback=alert(2333),test"></script>
```
- jquery:

![](https://user-images.githubusercontent.com/26270009/156290671-2477949b-d708-46b2-aa2f-7b655cedb0d3.png)

## JSONP劫持

JSONP劫持其实和CSRF的攻击是类似的，当服务端没有校验请求来源，如未严格校验Referer或未存在token机制等。在受害者不知情的情况下，访问了攻击者的网站，攻击者通过JSONP接口获取用户在其它网站的敏感信息。因此通常用做：
- 敏感信息泄露引发的精准诈骗。
- 防守方的溯源能力之一，获取攻击者画像。

### 自动化检测

检测规则：
1. 通过判断 content-type 过滤非JS资源。
2. 检查 query key 是否满足 `(?m)(?i)(callback)|(jsonp)|(^cb$)|(function)`。
3. Referer配置为同域，请求JS获取响应，将响应生成 AST，如果满足：
	1. Callee.Name == callback 函数名。
	2. 递归遍历 AST 获取所有的字段和对应的value。
	3. 字段为敏感字段（满足正则`(?m)(?i)(uid)|(userid)|(user_id)|(nin)|(name)|(username)|(nick)|(nickname)|(memberid)|(loginid)|(mobilephone)|(passportid)|(profile)|(profile)|(c)|(loginid)|(email)|(realname)|(birthday)|(sex)|(ip)`，且value不为空。
4. 替换Referer后再请求一次，重新验证步骤3。

---

之前在 `taser(demo)` 项目中实现了这一自动化检测的过程，可以检测各种调用的方式：
```javascript
callback({"data": {username:"name"}});
callback({"data": {a:"name",test:0, args:["123", 1,{username:"xx"}]}});
callback([{"info": {"username": "name"}}])
cb('  {"username":"name"}  ')
/*aa*/ window.cb({"username":"name"})
/*aa*/ window.cb && window.cb({"username":"name"})
/*aa*/ cb && cb({"username":"name"})
a={"username": "name"}; cb({"s": a});
a={"username": "name"}; cb(a);
```

（javascript parser 部分如果可以希望自己写个(留坑）


*一个非常简单环境 ：* [example](./example/)
- Docker

```
$ cd example
$ docker build -t jsonp .
$ docker run -p 8080:8080 -p 8081:8081 jsonp
```

- golang

```
$ cd example
$ go run main.go
```
# thx

- [JSONP跨域漏洞总结](https://www.mi1k7ea.com/2019/08/20/JSONP%E8%B7%A8%E5%9F%9F%E6%BC%8F%E6%B4%9E%E6%80%BB%E7%BB%93)
- [基于语义分析的Jsonp劫持检测](https://www.jweny.top/2020/08/29/基于语义分析的Jsonp劫持检测)
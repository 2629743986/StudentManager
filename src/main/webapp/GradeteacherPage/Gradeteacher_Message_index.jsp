<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@page import="java.util.*" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<SCRIPT language=javascript src="js/AdminUpdateVerification.js"></script>
	<SCRIPT language=javascript src="../js/AdminUpdateVerification.js"></script>
	<link href="css/StudentStyle.css" rel="stylesheet" type="text/css" />
	<link href="css/ks.css"  rel="stylesheet" type="text/css" />	
	<link href="../css/StudentStyle.css" rel="stylesheet" type="text/css" />
	<link href="../css/ks.css" rel="stylesheet" type="text/css" />	
	<%
		//登录验证
		Object admin_message = session.getAttribute("gradeteacher_message"); 
		if(admin_message==null){
			response.sendRedirect("404.html"); 
		}
 	%>
<title>信工学生管理系统-辅导员</title>

</head>
<body>
   <div class="banner">
        <div class="bgh">
            <div class="page" id="page">
            <div id="logo">
            	<a>
                	<img src="images/logo.png" alt="" width="300" height="67" />
                </a>
            </div>
                <div class="topxx">
                   辅导员：${gradeteacher_message.gradeteacherName }欢迎您！
                     <a href="GradeTeacherquitSession">安全退出</a>
                </div>
            </div>
        </div>
    </div>
    <div class="page">
        <div class="box mtop">
            <div class="leftbox">
                <div class="l_nav2">
                <div class="ta1">
					 <strong>信息中心</strong>
					 <div class="leftbgbt2">
					 </div>
				</div>
				<div class="cdlist">
				 <div>
				   <a href="showPageSysteminformationGradeTeacher">系统公告</a>
				 </div>
				 <div>
				    <form action="showNoReply" method="post" name="from2" id="from2">
						<input type="hidden" name="gradeteacherId" value="${gradeteacher_message.gradeteacherId }"/>
						<a href="javascript:document:from2.submit();">学生咨询信息</a>
					</form>
				 </div>
				</div>
                    <div class="ta1">
                        <strong>个人中心</strong>
                        <div class="leftbgbt">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                           <form action="ShowGradeTeacher" method="post" name="from1" id="from1">
							<input type="hidden" name="gradeteacherId" value="${gradeteacher_message.gradeteacherId }"/>
								<a href="javascript:document:from1.submit();">辅导员信息</a>
							</form>
                        </div>
                        
                        
                    </div>  
                    <div class="ta1">
                        <strong>教务中心</strong>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="StudentPageGradeTeacher">学生信息 </a>
                        </div>
                        <div>
                            <a href="AddSutdentGradeTeacherPage">添加学生 </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightbox">
<h2 class="mbx">辅导员信息 &gt;辅导员信息</h2>  
<div class="morebt">
    

<ul id="ulStudMsgHeadTab">
    <li><a class="tab2">辅导员资料</a></li>
     <li><a class="tab2" href="updateGradeTeacher">修改辅导员资料</a></li>
</ul>

</div>
<div class="cztable">
    <table width="100%" cellpadding="0" cellspacing="0">
    <tbody>
    	<tr>
            <td align="left" colspan="4" style="color: red;">基本资料：</td>
        </tr>
        <tr>
            <td align="right" width="80">姓名：</td>
            <td>${gradeteacher_message.gradeteacherName }&nbsp;</td>
            <td align="right" width="90">登录帐号：</td>
            <td>${gradeteacher_message.users.userName }&nbsp;</td>
            <td rowspan="9"><div align="center"><img id="pic_face"  height="160" width="120" src="GradeTeacherHeadportrait/${gradeteacher_message.headportrait }" style="padding:2px 2px 5px; border:1px #ddd solid;"></div> </td>
        </tr>
         <tr>
            <td align="right" width="80">工作号码：</td>
            <td colspan="3">${gradeteacher_message.workNumber }&nbsp;</td>
        </tr>
       
        <tr>
            <td align="left" colspan="4" style="color: red;">联系方式：</td>
        </tr>
         <tr>
            <td align="right">联系地址：</td>
            <td>${gradeteacher_message.address}&nbsp;</td>
            <td align="right">电话号码：</td>
            <td>${gradeteacher_message.gradeteacherPhone}&nbsp;</td>
        </tr>
        
         <tr>
         	<td align="right">QQ号码：</td>
            <td colspan="3">${gradeteacher_message.gradeteacherQqnumber}&nbsp;</td>
         </tr>
        <tbody>
    </table>
</div>
            </div>   
        </div>
        <div class="footer">
            <p>
            	学生管理系统
            </p>
        </div>
 </div>
</body>
</html>
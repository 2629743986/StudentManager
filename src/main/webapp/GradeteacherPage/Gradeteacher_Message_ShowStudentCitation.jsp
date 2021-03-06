<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@page import="java.util.*" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<h2 class="mbx">学生获奖信息 &gt;学生获奖信息</h2>  
<div class="morebt">
    

<ul id="ulStudMsgHeadTab">
	<li><a class="tab2" href="class_ShowStudentGreadTeacher">学生个人资料</a> </li>
   <li><a class="tab2" href="StudentAchievementPageGradeTeacher?studentId=${student_admin_message.studentId }">学生成绩</a> </li>
    <li><a class="tab2">学生获奖情况</a> </li>
    <li><a class="tab2" href="clasee_MessageGradeTeacher?gradeId=${student_admin_message.grade.gradeId }&classmessageId=${student_admin_message.classmessage.classmessageId}">学生班级信息</a> </li>
</ul>

</div>
<div class="cztable">
	 <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="15%" align="right"><div align="right">奖项主题： </div></td>
            <td style="text-align: center;">${citatio_message.citationTitle }</td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="right">奖项图片： </div></td>
            <td>
                	 <div align="center"><img height="650" width="500" alt="奖状图片" src="CitationImage/${citatio_message.citationImg}"/></div>
            </td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="right">获项内容： </div></td>
            <td>${citatio_message.citationMessage }</td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="right">审批情况： </div></td>
            <td>
            	<c:if test="${citatio_message.state==0 }">
            		<label style="color: red;">没通过审批</label>
            	</c:if>
            	<c:if test="${citatio_message.state==1 }">
            		<label style="color: red;">通过审批</label>
            	</c:if>
            	<c:if test="${citatio_message.state==2 }">
            		<label style="color: red;">辅导员审批</label>
            	</c:if>
            	<c:if test="${citatio_message.state==3}">
            		<label style="color: red;">辅导员助理审批</label>
            	</c:if>
            </td>
        </tr>
         <tr>
        
          <td style="text-align: center;" colspan="4"> 
          	<form action="UpdateCitationGradeTeacher?citationId=${ citatio_message.citationId}&studentId=${citatio_message.student.studentId }" method="post">
          		<input type="submit" name="Submit" value="审批通过" id="id_ok" class="input2" onClick="return confirm('确定通过审批吗?')">
          	</form> 
          </td>
        </tr>
        
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
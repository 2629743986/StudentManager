<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%
		//登录验证
		Object admin_message = session.getAttribute("admin_message"); 
		if(admin_message==null){
			response.sendRedirect("404.html"); 
		} 
		/* ${pageContext.request.contextPath} */
 	%>
 	
	<link href="css/StudentStyle.css" rel="stylesheet" type="text/css" />
	<link href="css/ks.css"  rel="stylesheet" type="text/css" />
	<link href="../css/StudentStyle.css" rel="stylesheet" type="text/css" />
	<link href="../css/ks.css" rel="stylesheet" type="text/css" />	
	<script src="js/uploadPreview.js" type="text/javascript"></script>
	<script src="../js/uploadPreview.js" type="text/javascript"></script>
	
	<script src="js/UpdateTeacherVerification.js" type="text/javascript"></script>
	<script src="../js/UpdateTeacherVerification.js" type="text/javascript"></script>
	
	<script src="js/checkUserNameAjax.js" type="text/javascript"></script>
	<script src="../js/checkUserNameAjax.js" type="text/javascript"></script>					
<title>信工学生管理系统-管理员</title>
</head>
<body>
<div class="banner">
      <div class="bgh">
            <div class="page">
            <div id="logo">
            	<a>
                	<img src="images/logo.png" alt="" width="300" height="67" />
                </a>
            </div>
                <div class="topxx">
                     管理员：${admin_message.adminName }欢迎您！
                   <a href="quitSession">安全退出</a>
                </div>
                <div class="blog_nav">
                    <ul>
                       	<li><a href="CollegePageBeanAdmin">所有学院</a></li>
                        <li><a href="ProfessionPageAdmin">所有专业</a></li>
                        <li><a href="ClassmessagePageAdmin">所有班级</a></li>
                    </ul>
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
				   <a href="showPageSysteminformationAdmin">发布系统公告</a>
				 </div>
				</div>
				<div class="cdlist">
					<div>
					<a href="AdminAdminmessagePage">学生咨询信息</a>
					</div>
				</div>
				
                	<div class="ta1">
                        <strong>个人中心</strong>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                         <div>
                           <a href="findAdminById?adminId=${admin_message.adminId }">管理员信息</a>
                        </div>
                    </div>
                    <div class="ta1">
                        <strong>信息中心</strong>
                        <div class="leftbgbt">
                        </div>
                    </div>
                    <div class="cdlist">
                       
                        <div>
                            <a href="StudentPageAdmin">学生信息 </a>
                        </div>
                         <div>
                            <a href="GradeteacherPageAdmin">辅导员信息  </a>
                        </div>
                         <div>
                            <a href="TeacherPageAdmin">辅导员助理信息  </a>
                        </div>
                    </div> 
                    <div class="ta1">
                        <strong>添加信息</strong>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                    	 <div>
                           <!-- <a href="addGradeTeacher">添加年级辅导员信息 </a> -->
                           <a href="addGradeTeacher">添加辅导员信息 </a>
                        </div>
                    	 <div>
                           <a href="addTeacherList">添加辅导员助理信息 </a>
                        </div>
                         
                         <div>
                           <a href="addStudenrAdmin">添加学生信息 </a>
                        </div>
                    </div> 
                    <div class="ta1">
                        <strong>添加学院</strong>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
	                    <div>
	                          <a href="addCollegeIndex">添加学院 </a>
	                    </div>
	                    <div>
	                          <a href="addProfessionIndex">添加专业 </a>
	                    </div> 
	                    <div>
	                          <a href="addClassmessage">添加班级 </a>
	                    </div> 
	               </div>
                </div>
            </div>
            <div class="rightbox">
                
<h2 class="mbx">更改辅导员助理信息 &gt; 更改辅导员助理资料 &nbsp;&nbsp;&nbsp;</h2>   
<div class="morebt">
    

<ul id="ulStudMsgHeadTab">
    <li><a class="tab2">修改辅导员助理资料</a> </li>
</ul>

</div>

<div class="cztable">
<form action="updateTeacherAdminMessage?teacherId=${teacher_message.teacherId }&userId=${teacher_message.users.userId}" method="post" enctype="multipart/form-data" onSubmit="return verificationInput()">
	<input type="hidden" name="picName" value="${teacher_message.headportrait }"/>
    <table width="100%" cellpadding="0" cellspacing="0">
    	<tr>
            <td align="left" colspan="4" style="color: red;">基本资料：</td>
        </tr>
        <tr>
            <td align="right" width="80">姓名：</td>
            <td><input type="text" value="${teacher_message.teacherName }" id="teacherName" name="teacherName" maxlength="10"/></td>
            <td align="right" width="90">登录帐号：</td>
            <td><input value="${teacher_message.users.userName }" name="userName" id="userName" type="text" maxlength="10" onChange="return checkName()"/></td>
            <td rowspan="9">
          	  <div align="center" style="text-align: center;">	没修改前</div>
            <div align="center">
            <img id="pic_face"  height="160" width="120" src="TeacherHeadportrait/${teacher_message.headportrait }"  style="padding:2px 2px 5px; border:1px #ddd solid;"/>
            <br/>
            修改预览<label style="color: red;">(必须选择图片)</label>
            <ul id="warp">
			  <li>
			    <input type="file" id="up_img_WU_FILE_0" name="myFile"/>
			    <img id="imgShow_WU_FILE_0" width="100" height="100" />
			  </li>
			</ul>
			</div> 
        </td>
         <tr>
         	<td align="right" width="80">新密码：</td>
         	<td><input value="" type="password" id="userPwd" name="userPwd" maxlength="10"/></td>
        	<td align="right" width="80">工号：</td>
        	<td><input value="${teacher_message.workNumber }" id="workNumber" name="workNumber" type="text"/></td>
        </tr>
         <tr>
         	<td align="left" style="color: red;">管理班级：</td>
            <td colspan="3">
            	<c:forEach var="list_classmessage" items="${requestScope.list_classmessage}" > 
				  ${list_classmessage.classmessageName }<br/>
				</c:forEach>
            </td>
           
          </tr>
        
        <tr>
            <td colspan="4" align="left" style="color: red;">联系方式:</td>
        </tr>
        <tr>
            <td align="right">联系地址：</td>
            <td><input type="text" value="${teacher_message.teacherAddress}" id="teacherAddress" name="teacherAddress" maxlength="12"/></td>
            <td align="right">电话号码：</td>
            <td><input type="text" name="teacherPhone" id="teacherPhone" value="${teacher_message.teacherPhone }" maxlength="10"/></td>
        </tr>
        <tr>
        	<td align="right">QQ：</td>
            <td colspan="3"><input value="${teacher_message.teacherQq }" type="text" id="teacherQq" name="teacherQq" maxlength="10"/></td>
        </tr>
        
        <tr>
       	<td colspan="4" align="left" valign="middle" style="text-align: center;">
        	<input type="submit" name="Submit" value="确定修改" id="id_ok" class="input2" onClick="return confirm('确定修改吗?')">              
        </td>
        </tr>         
    </table>
    </form>
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
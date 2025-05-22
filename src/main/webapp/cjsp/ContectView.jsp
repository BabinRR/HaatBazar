<%@page import="onlinefruitshop.controller.ContectCtl"%>
<%@page import="onlinefruitshop.util.DataUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Contact</title>
</head>
<body style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f4f6f8; margin: 0; padding: 0;">
<%@ include file="Header.jsp" %>

<section style="background: linear-gradient(to right, #00c6ff, #0072ff); color: white; padding: 50px 0; text-align: center; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);">
    <h1 style="margin: 0; font-size: 40px; font-weight: bold;">Contact Us</h1>
</section>

<div style="max-width: 1100px; margin: 30px auto; padding: 20px;">
    <nav style="margin-bottom: 25px;">
        <ol style="list-style: none; display: flex; padding: 0; background: #fff; border-radius: 5px; box-shadow: 0 2px 6px rgba(0,0,0,0.1);">
            <li style="padding: 10px 20px;"><a href="<%=SOTGView.WELCOME_CTL%>" style="text-decoration: none; color: #007bff;">Home</a></li>
            <li style="padding: 10px 20px; color: #555;">/</li>
            <li style="padding: 10px 20px;"><a href="<%=SOTGView.USER_REGISTRATION_CTL%>" style="text-decoration: none; color: #007bff;">Contact</a></li>
        </ol>
    </nav>

    <div style="display: flex; gap: 25px; flex-wrap: wrap;">
        <!-- Contact Form -->
        <div style="flex: 2; background: #fff; border-radius: 8px; padding: 25px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);">
            <h2 style="margin-bottom: 20px; color: #343a40;">Send us a message</h2>
            
            <font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
            <%
                String successMsg = ServletUtility.getSuccessMessage(request);
                if (successMsg != null && !successMsg.trim().isEmpty()) {
            %>
            <script>
                alert("<%= successMsg %>");
            </script>
            <font color="green"><%= successMsg %></font>
            <%
                }
            %>

            <form action="<%=SOTGView.CONTECT_CTL%>" method="post" style="margin-top: 20px;">
                <jsp:useBean id="bean" class="onlinefruitshop.bean.ContectBean" scope="request" />

                <input type="hidden" name="id" value="<%=bean.getId()%>">
                <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
                <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
                <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
                <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

                <div style="margin-bottom: 20px;">
                    <label style="font-weight: 600;">Name</label><br>
                    <input type="text" name="name" placeholder="Enter your name" value="<%=DataUtility.getStringData(bean.getName())%>"
                        style="width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ccc; box-shadow: inset 0 1px 2px rgba(0,0,0,0.05);">
                    <font color="red"><%=ServletUtility.getErrorMessage("name", request)%></font>
                </div>

                <div style="margin-bottom: 20px;">
                    <label style="font-weight: 600;">Email Address</label><br>
                    <input type="text" name="email" placeholder="Enter your email" value="<%=DataUtility.getStringData(bean.getEmail())%>"
                        style="width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ccc; box-shadow: inset 0 1px 2px rgba(0,0,0,0.05);">
                    <font color="red"><%=ServletUtility.getErrorMessage("email", request)%></font>
                </div>

                <div style="margin-bottom: 20px;">
                    <label style="font-weight: 600;">Message</label><br>
                    <textarea name="message" rows="5" placeholder="Type your message..."
                        style="width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ccc; box-shadow: inset 0 1px 2px rgba(0,0,0,0.05);"><%=DataUtility.getStringData(bean.getMessage()) %></textarea>
                    <font color="red"><%=ServletUtility.getErrorMessage("message", request)%></font>
                </div>

                <div style="text-align: center; margin-top: 30px;">
                    <input type="submit" name="operation" value="<%=ContectCtl.OP_SAVE%>"
                        style="padding: 10px 25px; background: #28a745; color: white; border: none; border-radius: 5px; font-weight: bold; cursor: pointer; transition: 0.3s;">
                    <input type="submit" name="operation" value="<%=ContectCtl.OP_RESET%>"
                        style="padding: 10px 25px; background: #6c757d; color: white; border: none; border-radius: 5px; font-weight: bold; cursor: pointer; margin-left: 10px; transition: 0.3s;">
                </div>
            </form>
        </div>

        <!-- Contact Info Card -->
        <div style="flex: 1; min-width: 250px; background: #fff; border-radius: 8px; padding: 20px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);">
            <div style="background: #28a745; color: white; padding: 12px 15px; border-radius: 5px; font-weight: bold;">
                <i class="fa fa-home"></i> Address
            </div>
            <div style="padding: 15px 0; color: #444; line-height: 1.6;">
                <p>Kathmandu</p>
                <p>Provine 03</p>
                <p>Nepal</p>
                <p>Email: haatbazaar@gmail.com</p>
                <p>Phone: +977-9874632578</p>
            </div>
        </div>
    </div>
</div>

<%@ include file="Footer.jsp" %>
</body>
</html>

<%@page import="onlinefruitshop.controller.CheckoutCtl"%>
<%@page import="onlinefruitshop.bean.ProductBean"%>
<%@page import="onlinefruitshop.model.ProductModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="onlinefruitshop.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Checkout</title>
</head>
<body style="margin:0; font-family:Arial, sans-serif; background-color:#f5f5f5; color:#333;">
<%@ include file="Header.jsp" %>

<!-- Jumbotron Section -->
<section style="background-color:#007bff; color:#fff; padding:40px 0; text-align:center;">
    <h1>Checkout</h1>
</section>

<!-- Breadcrumb -->
<div style="padding: 20px;">
    <div style="font-size: 16px; margin-bottom: 10px;">
        <a href="#" style="text-decoration:none; color:#007bff;">Review Order</a>
    </div>
</div>

<!-- Order Table -->
<form action="<%=SOTGView.CHECKOUT_CTL%>" method="post">
    <div style="padding: 0 20px 40px;">
        <div style="overflow-x:auto;">
            <table style="width:100%; border-collapse:collapse; background:#fff;">
                <thead>
                    <tr style="background:#007bff; color:#fff;">
                        <th style="padding:12px; border:1px solid #ddd;">S No.</th>
                        <th style="padding:12px; border:1px solid #ddd;">Product</th>
                        <th style="padding:12px; border:1px solid #ddd;">Description</th>
                        <th style="padding:12px; border:1px solid #ddd;">Quantity</th>
                        <th style="padding:12px; border:1px solid #ddd;">Price</th>
                        <th style="padding:12px; border:1px solid #ddd;">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;
                   	CartBean bean = null;
                    List list = ServletUtility.getList(request);
                    Iterator<CartBean> it = list.iterator();
                    double n1=0, n2=0, n3=0;
                    while (it.hasNext()) {
                        bean = it.next();
                        ProductModel pModel = new ProductModel();
                        ProductBean pBean = pModel.findByPK(bean.getProductId());
                    %>
                    <tr>
                        <td style="padding:12px; border:1px solid #ddd;"><%=index++%></td>
                        <td style="padding:12px; border:1px solid #ddd;"><%=pBean.getName()%></td>
                        <td style="padding:12px; border:1px solid #ddd;"><%=pBean.getDescription()%></td>
                        <td style="padding:12px; border:1px solid #ddd; text-align:center;"><%=bean.getQuantity()%></td>
                        <td style="padding:12px; border:1px solid #ddd; text-align:right;">$<%=pBean.getPrice()%></td>
                        <td style="padding:12px; border:1px solid #ddd; text-align:right;">$<%=bean.getFinalAmount()%></td>
                    </tr>
                    <% 
                        n1 = bean.getFinalAmount();
                        n2 = n3 + n1;
                        n3 = n2;
                    } 
                    double sipping = 6.90;
                    %>
                    <tr>
                        <td colspan="4"></td>
                        <td style="padding:12px; border:1px solid #ddd;"><b>Sub-Total</b></td>
                        <td style="padding:12px; border:1px solid #ddd; text-align:right;">$<%=n3%></td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                        <td style="padding:12px; border:1px solid #ddd;"><b>Shipping</b></td>
                        <td style="padding:12px; border:1px solid #ddd; text-align:right;">$<%=sipping%></td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                        <td style="padding:12px; border:1px solid #ddd;"><b>Total</b></td>
                        <td style="padding:12px; border:1px solid #ddd; text-align:right;"><strong>$<%=sipping + n3%></strong></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- User Details -->
    <div style="padding: 0 20px 40px;">
        <div style="background:#fff; padding:20px; border-radius:8px; box-shadow:0 2px 5px rgba(0,0,0,0.1);">
            <div style="background:#007bff; color:#fff; padding:10px 15px; font-size:18px; border-radius:5px 5px 0 0;">Confirm Detail</div>
            <%
                UserBean uBean = (UserBean)session.getAttribute("user");
            %>
            <div style="padding:15px;">
                <p><b>Name:</b> <span style="font-size:14px;"><%=uBean.getFirstName() + " " + uBean.getLastName()%></span></p>
                <p><b>Email:</b> <span style="font-size:14px;"><%=uBean.getEmailAddress()%></span></p>
                <p><b>Mobile No:</b> <span style="font-size:14px;"><%=uBean.getMobileNo()%></span></p>
                <p><b>Shipping Address:</b> <span style="font-size:14px;"><%=uBean.getShippingAddress()%></span></p>
                <p><b>Billing Address:</b> <span style="font-size:14px;"><%=uBean.getBillingAddress()%></span></p>
                <div style="text-align:center; margin-top:20px;">
                    <input type="submit" name="operation" value="<%=CheckoutCtl.OP_SUBMIT%>" 
                        style="padding:10px 25px; background:#007bff; color:#fff; border:none; border-radius:4px; font-size:16px; cursor:pointer;">
                </div>
            </div>
        </div>
    </div>
</form>

<%@ include file="Footer.jsp" %>
</body>
</html>

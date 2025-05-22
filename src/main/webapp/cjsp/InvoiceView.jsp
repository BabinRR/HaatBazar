<%@page import="onlinefruitshop.bean.ProductBean"%>
<%@page import="onlinefruitshop.bean.UserBean"%>
<%@page import="onlinefruitshop.model.ProductModel"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invoice</title>
</head>
<body style="font-family:Arial, sans-serif; background-color:#f9f9f9; color:#333; margin:0; padding:0;">
<%@ include file="Header.jsp" %>

<!-- Jumbotron -->
<div style="background-color:#007bff; color:white; text-align:center; padding:40px 0;">
    <h1 style="margin:0;">Checkout</h1>
</div>

<!-- Breadcrumb & Messages -->
<div style="padding:20px;">
    <div style="font-size:16px;">
        <span style="color:red;"><%=ServletUtility.getErrorMessage(request)%></span>
        <span style="color:green;"><%=ServletUtility.getSuccessMessage(request)%></span>
    </div>
</div>

<form action="<%=SOTGView.CHECKOUT_CTL%>" method="post">
    <div style="padding: 0 20px 40px;">
        <div style="overflow-x:auto;">
            <table style="width:100%; border-collapse:collapse; background:#fff; margin-bottom:40px;">
                <thead>
                    <tr style="background:#007bff; color:#fff;">
                        <th style="padding:12px; border:1px solid #ddd;">S No.</th>
                        <th style="padding:12px; border:1px solid #ddd;">Product</th>
                        <th style="padding:12px; border:1px solid #ddd;">Description</th>
                        <th style="padding:12px; border:1px solid #ddd; text-align:center;">Quantity</th>
                        <th style="padding:12px; border:1px solid #ddd; text-align:right;">Price</th>
                        <th style="padding:12px; border:1px solid #ddd; text-align:right;">Total</th>
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
                    double n1 = 0, n2 = 0, n3 = 0;
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
                    <!-- Totals -->
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

                    <!-- User Info -->
                    <%
                        UserBean uBean = (UserBean)session.getAttribute("user");
                    %>
                    <tr style="background:#f1f1f1;">
                        <td colspan="2" style="padding:12px; border:1px solid #ddd;"><strong>Name :</strong></td>
                        <td colspan="4" style="padding:12px; border:1px solid #ddd;"><strong><%=uBean.getFirstName() + " " + uBean.getLastName()%></strong></td>
                    </tr>
                    <tr style="background:#f1f1f1;">
                        <td colspan="2" style="padding:12px; border:1px solid #ddd;"><strong>Shipping Address :</strong></td>
                        <td colspan="4" style="padding:12px; border:1px solid #ddd;"><strong><%=uBean.getShippingAddress()%></strong></td>
                    </tr>
                    <tr style="background:#f1f1f1;">
                        <td colspan="2" style="padding:12px; border:1px solid #ddd;"><strong>Billing Address :</strong></td>
                        <td colspan="4" style="padding:12px; border:1px solid #ddd;"><strong><%=uBean.getBillingAddress()%></strong></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</form>
  <div style="text-align:center; margin: 30px 0;">
        <a href="<%=SOTGView.PRODUCT_LIST_CTL%>" 
           style="display:inline-block; padding:12px 24px; background-color:#28a745; color:white; text-decoration:none; font-size:16px; border-radius:4px;">
            Continue Shopping
        </a>
    </div>
<%@ include file="Footer.jsp" %>
</body>
</html>

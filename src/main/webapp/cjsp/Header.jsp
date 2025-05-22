<%@page import="onlinefruitshop.util.ServletUtility"%>
<%@page import="onlinefruitshop.controller.UserProductCtl"%>
<%@page import="java.util.List"%>
<%@page import="onlinefruitshop.bean.CartBean"%>
<%@page import="onlinefruitshop.model.CartModel"%>
<%@page import="onlinefruitshop.controller.LoginCtl"%>
<%@page import="onlinefruitshop.controller.SOTGView"%>
<%@page import="onlinefruitshop.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Haat Bazaar</title>
<link href="/OnlineFruitShop/css/style.css" rel="stylesheet" >

<script type="text/javascript">
$(document).ready(function(){
    var quantity = 1;

    $('.quantity-right-plus').click(function(e){
        e.preventDefault();
        var quantity = parseInt($('#quantity').val());
        $('#quantity').val(quantity + 1);
    });

    $('.quantity-left-minus').click(function(e){
        e.preventDefault();
        var quantity = parseInt($('#quantity').val());
        if(quantity > 1){
            $('#quantity').val(quantity - 1);
        }
    });

});

</script>
</head>
<body>
 <%
    UserBean userBean = (UserBean) session.getAttribute("user");

    boolean userLoggedIn = userBean != null;

    String welcomeMsg = "Hi, ";

    if (userLoggedIn) {
        String role = (String) session.getAttribute("role");
        welcomeMsg += userBean.getFirstName() + " (" + role + ")";
    } else {
        welcomeMsg += "Guest";
    }

%>
<!-- ... keep all your import statements as-is ... -->

<nav style="background-color: #343a40; padding: 20px 0;">
    <div style="width: 100%; margin: 0 auto; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap;">
        <a href="#" style="color: white; text-decoration: none; font-size: 20px;">
            Haat bazaar<br>
            <span style="font-size: 13px;">Buy fruits and vegetables</span>
        </a>
        <div style="display: flex; flex-wrap: wrap; align-items: center;">
            <ul style="list-style: none; display: flex; flex-wrap: wrap; margin: 0; padding: 0;">
                <% if(userLoggedIn){ %>
                    <% if(userBean.getRoleId() == 1){ %>
                        <li style="margin: 0 10px;"><a href="<%=SOTGView.HOME_CTL%>" style="color: white; text-decoration: none;">Home</a></li>
                        <li style="margin: 0 10px;"><a href="<%=SOTGView.ADMIN_CTL%>" style="color: white; text-decoration: none;">Add Admin</a></li>
                        <li style="margin: 0 10px;"><a href="<%=SOTGView.CATEGORY_LIST_CTL%>" style="color: white; text-decoration: none;">Categories</a></li>
                        <li style="margin: 0 10px;"><a href="<%=SOTGView.PRODUCT_LIST_CTL%>" style="color: white; text-decoration: none;">Product</a></li>
                        <li style="margin: 0 10px;"><a href="<%=SOTGView.INVOICE_LIST_CTL%>" style="color: white; text-decoration: none;">Sell History</a></li>
                    <% } else if(userBean.getRoleId() == 2){ %>
                        <li style="margin: 0 10px;"><a href="<%=SOTGView.HOME_CTL%>" style="color: white; text-decoration: none;">Home</a></li>
                        <li style="margin: 0 10px;"><a href="<%=SOTGView.USER_PRODUCT_LIST_CTL%>" style="color: white; text-decoration: none;">Product</a></li>
                        <li style="margin: 0 10px;"><a href="<%=SOTGView.INVOICE_LIST_CTL%>" style="color: white; text-decoration: none;">History</a></li>
                        <li style="margin: 0 10px;"><a href="/OnlineFruitShop/cjsp/AboutUsView.jsp" style="color: white; text-decoration: none;">About Us</a></li>
                        <li style="margin: 0 10px;"><a href="/OnlineFruitShop/contact" style="color: white; text-decoration: none;">Contact Us</a></li>
                    <% } %>
                <% } else { %>
                    <li style="margin: 0 10px;"><a href="<%=SOTGView.HOME_CTL%>" style="color: white; text-decoration: none;">Home</a></li>
                    <li style="margin: 0 10px;"><a href="<%=SOTGView.USER_PRODUCT_LIST_CTL%>" style="color: white; text-decoration: none;">Product</a></li>
                    <li style="margin: 0 10px;"><a href="/OnlineFruitShop/cjsp/AboutUsView.jsp" style="color: white; text-decoration: none;">About Us</a></li>
                    <li style="margin: 0 10px;"><a href="/OnlineFruitShop/contact" style="color: white; text-decoration: none;">Contact Us</a></li>
                <% } %>
            </ul>

            <%-- Search Form --%>
            <form action="<%=SOTGView.USER_PRODUCT_LIST_CTL%>" method="post" style="display: flex; align-items: center; margin-left: 20px;">
                <input type="text" name="name" placeholder="Search Product..." value="<%=ServletUtility.getParameter("name", request)%>" 
                       style="padding: 5px; font-size: 14px; width: 150px;">
                <input type="submit" name="operation" value="<%=UserProductCtl.OP_SEARCH%>" 
                       style="margin-left: 5px;margin-right:5px; background-color: #17a2b8; color: white; padding: 5px 10px; border: none; cursor: pointer;">
            </form>

            <% if(userLoggedIn) { %>
                <% if(userBean.getRoleId() == 2) { %>
                    <%
                        CartModel cModel = new CartModel();
                        CartBean cBean = new CartBean();
                        cBean.setUserId(userBean.getId());
                        List list = cModel.search(cBean);
                    %>
                    <a href="<%=SOTGView.CART_LIST_CTL%>" style=" background-color: #28a745; color: white; padding: 6px 12px; text-decoration: none; display: inline-block;">
                        <i class="fa fa-shopping-cart"></i> Cart 
                        <span style="background-color: white; color: black; padding: 2px 6px; border-radius: 50%; font-weight: bold; margin-left: 3px;"><%=list.size()%></span>
                    </a>
                <% } %>

                <a href="<%=SOTGView.MY_PROFILE_CTL%>" style="margin-left: 10px; background-color: #28a745; color: white; padding: 6px 12px; text-decoration: none;">
                    <i class="fa fa-user"></i> My Profile
                </a>
                <a href="<%=SOTGView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>" style="margin-left: 10px; margin-right:10px;background-color: #28a745; color: white; padding: 6px 12px; text-decoration: none;">
                    <i class="fa fa-sign-out"></i> Logout
                </a>
            <% } else { %>
                <a href="<%=SOTGView.LOGIN_CTL%>" style="margin-left: 10px; background-color: #28a745; color: white; padding: 6px 12px; text-decoration: none;">
                    <i class="fa fa-sign-in"></i> Login
                </a>
                <a href="<%=SOTGView.USER_REGISTRATION_CTL%>" style="margin-left: 10px; margin-right:10px; background-color: #28a745; color: white; padding: 6px 12px; text-decoration: none;">
                    <i class="fa fa-user-plus"></i> Register
                </a>
            <% } %>
        </div>
    </div>
</nav>


</body>
</html>
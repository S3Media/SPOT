<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="Create an Account at SPoT Skate Shop">
<meta itemprop="description" content="All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="Your Account at SPoT Skate Shop"/>
<meta property="og:type" content="company"/>
<meta property="og:image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="Your Account at SPoT Skate Shop"/>
<meta property="og:description" content="Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>



<script language="javascript" type="text/javascript">

    $(document).ready(function () {

        $("#txtState").val('<%=txtState %>');

        $("#txtZip").keydown(function (e) {
            var key = e.which || e.keyCode;

            if (!e.shiftKey && !e.altKey && !e.ctrlKey &&
            // numbers   
                         key >= 48 && key <= 57 ||
            // Numeric keypad
                         key >= 96 && key <= 105 ||
            // comma, period and minus, . on keypad
                        key == 190 || key == 188 || key == 109 || key == 110 ||
            // Backspace and Tab and Enter
                        key == 8 || key == 9 || key == 13 ||
            // Home and End
                        key == 35 || key == 36 ||
            // left and right arrows
                        key == 37 || key == 39 ||
            // Del and Ins
                        key == 46 || key == 45)
                return true;

            return false;

        });


        $("#cmdSubmitNew").click(function (event) {
            //alert(validateEmail());
            if (validateEmail() == false) {
                event.preventDefault();
                $("#ErrorMessage").html('Please enter a valid email address.');
                $("#txtEmailNew").focus();
            }
            if (passwordMatch() == false) {

                event.preventDefault();
                $("#PasswordMatch").html('Your passwords don\'t match.');
                $("#txtPassword1").focus();
            }
            else { $("#PasswordMatch").html(''); }

            if (requiredCheck() == false) {
                event.preventDefault();
                $("#ErrorMessage").html('Please fill in all fields.');
            }
        });

    });



    function validateEmail() {

      //  var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
      //  var address = $("#txtEmailNew").attr('value');
      //  if (!reg.test(address)) {
      //      return false;
      //  }
      //  else {
      //      return true;
        }
    }

    function passwordMatch() {


        if ($("#txtPassword1").attr('value') != $("#txtPassword2").attr('value')) {
            return false;
        }
        else {
            return true;
        }
    }

    function requiredCheck() {
        var blnValid = true;

        if ($("#txtPassword1").attr('value').length < 2) {
            $("#txtPassword1").css('background-color', '#ffb2b2');
            $("#txtPassword1").focus();
            blnValid = false;
        }
        else { $("#txtPassword1").css('background-color', '#ffffff'); }

        if ($("#txtPassword2").attr('value').length < 2) {
            $("#txtPassword2").css('background-color', '#ffb2b2');
            $("#txtPassword2").focus();
            blnValid = false;
        }
        else { $("#txtPassword2").css('background-color', '#ffffff'); }


        if ($("#txtPhone").attr('value').length < 2) {
            $("#txtPhone").css('background-color', '#ffb2b2');
            $("#txtPhone").focus();
            blnValid = false;
        }
        else { $("#txtPhone").css('background-color', '#ffffff'); }



        if ($("#txtZip").attr('value').length < 2) {
            $("#txtZip").css('background-color', '#ffb2b2');
            $("#txtZip").focus();
            blnValid = false;
        }
        else { $("#txtZip").css('background-color', '#ffffff'); }

        if ($("#txtState").attr('value').length < 2) {
            $("#txtState").css('background-color', '#ffb2b2');
            $("#txtState").focus();
            blnValid = false;
        }
        else { $("#txtState").css('background-color', '#ffffff'); }

        if ($("#txtCity").attr('value').length < 2) {
            $("#txtCity").css('background-color', '#ffb2b2');
            $("#txtCity").focus();
            blnValid = false;
        }
        else { $("#txtCity").css('background-color', '#ffffff'); }

        if ($("#txtAddress1").attr('value').length < 2) {
            $("#txtAddress1").css('background-color', '#ffb2b2');
            $("#txtAddress1").focus();
            blnValid = false;
        }
        else { $("#txtAddress1").css('background-color', '#ffffff'); }

        if ($("#txtLastName").attr('value').length < 2) {
            $("#txtLastName").css('background-color', '#ffb2b2');
            $("#txtLastName").focus();
            blnValid = false;
        }
        else { $("#txtLastName").css('background-color', '#ffffff'); }

        if ($("#txtFirstName").attr('value').length < 2) {
            $("#txtFirstName").css('background-color', '#ffb2b2');
            $("#txtFirstName").focus();
            blnValid = false;
        }
        else { $("#txtFirstName").css('background-color', '#ffffff'); }

        if ($("#txtEmailNew").attr('value').length < 2) {
            $("#txtEmailNew").css('background-color', '#ffb2b2');
            $("#txtEmailNew").focus();
            blnValid = false;
        }
        else { $("#txtEmailNew").css('background-color', '#ffffff'); }

        return blnValid;
    }

</script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">

<asp:Label runat="server" ID="lblConfirm" />


<asp:Panel runat="server" ID="pnlLogin" Visible="false">
    <div class="row">
<div class="col-md-5">


    <form method="post" action="login.aspx">
    <h2>Create New Account - US Orders</h2>
    <div id="ErrorMessage" class="ErrorMessages"></div>
    <div>
    Email:
    <input class="Checkout" type="email" id="txtEmailNew" name="txtEmailNew" value="<%=txtEmailNew %>" /><br />
    First Name: <input type="text" class="Checkout" id="txtFirstName" value="<%=txtFirstName %>" name="txtFirstName" /><br />
    Last Name: <input type="text" class="Checkout" id="txtLastName" value="<%=txtLastName %>" name="txtLastName" /><br />
    Street: <input type="text" class="Checkout" id="txtAddress1" name="txtAddress1" value="<%=txtAddress1 %>" /><br />
    Apt/Company: <input type="text" class="Checkout" id="txtAddress2" name="txtAddress2" value="<%=txtAddress2 %>" /><br />
    City: <input type="text"  class="Checkout" name="txtCity" id="txtCity" value="<%=txtCity %>" /><br />
    State:  <select id="txtState" name="txtState" class="Checkout">
            <option value="">Choose...</option>
            <option  value="AL">Alabama</option>
            <option  value="AK">Alaska</option>
            <option  value="AZ">Arizona</option>
            <option  value="AR">Arkansas</option>
            <option  value="CA">California</option>
            <option  value="CO">Colorado</option>
            <option  value="CT">Connecticut</option>
            <option  value="DE">Delaware</option>
            <option  value="DC">District of Columbia</option>
            <option  value="FL">Florida</option>
            <option  value="GA">Georgia</option>
            <option  value="HI">Hawaii</option>
            <option  value="ID">Idaho</option>
            <option  value="IL">Illinois</option>
            <option  value="IN">Indiana</option>
            <option  value="IA">Iowa</option>
            <option  value="KS">Kansas</option>
            <option  value="KY">Kentucky</option>
            <option  value="LA">Louisiana</option>
            <option  value="ME">Maine</option>
            <option  value="MD">Maryland</option>
            <option  value="MA">Massachusetts</option>
            <option  value="MI">Michigan</option>
            <option  value="MN">Minnesota</option>
            <option  value="MS">Mississippi</option>
            <option  value="MO">Missouri</option>
            <option  value="MT">Montana</option>
            <option  value="NE">Nebraska</option>
            <option  value="NV">Nevada</option>
            <option  value="NH">New Hampshire</option>
            <option  value="NJ">New Jersey</option>
            <option  value="NM">New Mexico</option>
            <option  value="NY">New York</option>
            <option  value="NC">North Carolina</option>
            <option  value="ND">North Dakota</option>
            <option  value="OH">Ohio</option>
            <option  value="OK">Oklahoma</option>
            <option  value="OR">Oregon</option>
            <option  value="PA">Pennsylvania</option>
            <option  value="RI">Rhode Island</option>
            <option  value="SC">South Carolina</option>
            <option  value="SD">South Dakota</option>
            <option  value="TN">Tennessee</option>
            <option  value="TX">Texas</option>
            <option  value="UT">Utah</option>
            <option  value="VT">Vermont</option>
            <option  value="VA">Virginia </option>
            <option  value="WA">Washington</option>
            <option  value="WV">West Virginia</option>
            <option  value="WI">Wisconsin</option>
            <option  value="WY">Wyoming</option>
            </select>
    <div style="font-size:.8em;">
        International customers, please see below.
        </div>
    Zip: <input type="text" class="Checkout" id="txtZip" name="txtZip" value="<%=txtZip %>" /><br />
    Phone: <input type="text" class="Checkout" id="txtPhone" name="txtPhone" value="<%=txtPhone %>" /><br />
    <div id="PasswordMatch" class="ErrorMessages"></div>
    Choose Password: <input type="password" class="Checkout" id="txtPassword1" name="txtPassword1" value="<%=txtPassword1 %>" /><br />
    Confirm Password: <input type="password" class="Checkout" id="txtPassword2" name="txtPassword2" value="<%=txtPassword2 %>" /><br />
    </div>
    <input type="submit" class="BuyButtonInput" id="cmdSubmitNew" name="cmdSubmitNew" value="Create Account" />
    <br />
    <div class="NotesAndTips">
    If you are not in the US, please use the International Checkout below.
    </div>
    <input type="hidden" id="txtFromNewCustomer" name="txtFromNewCustomer" value="LoginPage" />
    </form>

    <form name="icForm" id="icForm" method="post" action="https://www.internationalcheckout.com/cart.php">
    <h1>International Checkout</h1>
        <asp:SqlDataSource runat="server" ID="sdsIntl" SelectCommand="SPOT2012CartInternationalCheckout"
             SelectCommandType="StoredProcedure" ConnectionString="<%$ConnectionStrings:CS %>">
            <SelectParameters><asp:CookieParameter Name="CartID" CookieName="CartID" /></SelectParameters>
        </asp:SqlDataSource>
        <asp:Repeater runat="server" ID="rptIntl" DataSourceID="sdsIntl">
            <ItemTemplate>
                <input type="hidden" name="ItemDescription<%#Eval("RowNumber") %>"
                     value="<%# Server.HtmlEncode(Eval("ItemDescription").ToString()) %>" />
                <input type="hidden" name="ItemSKU<%#Eval("RowNumber") %>"
                    value="<%#Eval("InventoryID") %>" />
                <input type="hidden" name="ItemSize<%#Eval("RowNumber") %>"
                    value=""<%# Server.HtmlEncode(Eval("Size").ToString()) %>" />
                <input type="hidden" name="ItemColor<%#Eval("RowNumber") %>"
                    value=""<%# Server.HtmlEncode(Eval("Color").ToString()) %>" />
                <input type="hidden" name="ItemQuantity<%#Eval("RowNumber") %>"
                    value="<%#Eval("Quantity") %>" />
                <input type="hidden" name="ItemPrice<%#Eval("RowNumber") %>"
                    value="<%#Eval("YourPriceUnit") %>" />
                <input type="hidden" name="ItemImage<%#Eval("RowNumber") %>"
                    value="<%#Eval("Photo") %>" />
                
            </ItemTemplate>
        </asp:Repeater>
        <input type="hidden" name="p" value="skateparkoftampa" />
        <input type="submit" class="BuyButtonInput"  value="International Checkout" />
    </form>

</div>


<div class="col-md-7">
    <form method="post">
    <h2>Login</h2>
    If you already have an account with us, login here.
    
    <div>
    Email: <input type="text" value="<%=Request["txtEmailLogin"] %>" class="Checkout" name="txtEmailLogin" id="txtEmailLogin" />
    </div>
    <div>
    Password: <input type="password" class="Checkout" value="<%=Request["txtPasswordLogin"] %>" name="txtPasswordLogin" id="txtPasswordLogin"  />
    </div>
    <input type="submit" value="Login and Checkout" />  
    <span style="font-size:.8em;">
    <input type="checkbox" style="margin-right:0px; padding:0px;" id="chkSave" name="chkSave" /> Save Login
    </span>
    <div style="margin:0px; padding:0px; font-size:.7em;">Note: if you forgot your password, just put in your email address, click the button, and we will email it to you.</div>
    </form>
</div>
</div>
</asp:Panel>



<asp:Panel runat="server" ID="pnlInfo" Visible="false">

<div class="BlogPost">
    <asp:Repeater runat="server" ID="rptCustomerInfo">
    <ItemTemplate>
        <h1>Howdy <%#Eval("FirstName") %>!</h1>
    
        <%#Eval("FirstName") %> <%#Eval("LastName") %>
        <br />
        <%#Eval("Address") %>
        <%#CheckForCompany(Eval("Company").ToString())%>
        <br />
        <%#Eval("City") %>, <%#Eval("State") %> <%#Eval("Zip") %><br />
        <%#Eval("Phone") %><br />
        <%#Eval("Email") %><br /><br />
        <span class="BuyButton"><a href="checkout.aspx">Checkout</a></span>
        <span class="BuyButton"><a href="checkout_editshipping.aspx">Edit Shipping Address</a></span>
        <span class="BuyButton"><a href="checkout_pwd.aspx">Change Password</a></span>
        <span class="BuyButton"><a href="logout.aspx">Logout</a></span>

    </ItemTemplate>
    </asp:Repeater>
</div>


    <asp:Repeater runat="server" ID="rptMain" OnItemDataBound="rptMain_ItemDataBound">
    <HeaderTemplate>
    <div class="BlogPost">
    <h1>Your Order History</h1>
    First of all, thank you so much for getting your stuff from us.  Email questions anytime to info@skateparkoftampa.com to reach our 
    packers and customer service staff.
    </div>
    
    </HeaderTemplate>
    <ItemTemplate>
        <div class="BlogPost">
            <h1>Order #<%#Eval("OrderID") %> on <%#Eval("DateAndTime", "{0:D}") %> at <%#Eval("DateAndTime", "{0:t}") %></h1>
            Date Shipped: <%#Eval("DateShipped", "{0:D}") %> <%#Eval("DateShipped", "{0:t}") %> <%#Eval("Void") %><br />
            Items Ordered: <%#Eval("TotalItemsOrdered") %>, Total: <%#Eval("TotalSale", "{0:c}") %>, Sales Tax: <%#Eval("TotalTax", "{0:c}")%>
            <div><%#Eval("ShippingOption")%>, <%#Eval("OriginalShippingCost", "{0:c}") %>, Tracking Number: <%#Eval("TrackingNumber") %></div>
            Billed: <%#Eval("Captured")%> <strong><%#Eval("CapturedAmount", "{0:c}") %></strong><br />
            <div class="BlogPost">
                <asp:Repeater runat="server" ID="rptSub">
                    <ItemTemplate>
                        <div>
                            Item #<%#Eval("InventoryID") %> <a href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>">
                            <img src="<%#Eval("Photo") %>" style="float:left; margin:10px; width:300px;" /></a>
                            <a href="m.aspx?ID=<%#Eval("ManufacturerID") %>"><%#Eval("Name") %></a>, 
                            <a href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>">
                                <%#Eval("ShortDescr") %>
                            </a>
                            Size: <%#Eval("Size") %>, Color: <%#Eval("Color") %>
                            <div style="padding:20px;">
                                Ordered: <%#Eval("QuantityOrdered")%>, Shipped: <%#Eval("QuantityShipped")%>
                                <div style="color:red; font-weight:bold;"><%#Eval("EmployeeNotes") %></div>
                                Price: <%#Eval("UnitPrice", "{0:c}") %><br />
                                Tax: <%#Eval("UnitTax", "{0:c}")%><br />
                                Total: <%#Eval("LineTotal", "{0:c}")%>
                            </div>
                        </div>
                        <div style="clear:both;"></div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </ItemTemplate>
    <FooterTemplate>
    </FooterTemplate>
    </asp:Repeater>

</asp:Panel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">


<asp:SqlDataSource runat="server" ID="sdsMfgrs" SelectCommand="SPOT2012ManufacturersFeaturedRandom" SelectCommandType="StoredProcedure" 
 EnableCaching="true" CacheDuration="4000" ConnectionString="<%$ConnectionStrings:CS %>" />
<asp:Repeater runat="server" ID="rptMfgrs" DataSourceID="sdsMfgrs">
    <HeaderTemplate><div class="BlogPost">
    <h1>Featured Companies</h1>
    <ul class="GridMfgs280"></HeaderTemplate>

    <ItemTemplate>
            <div class="col-xs-3">
                <a href="m.aspx?ID=<%#Eval("ManufacturerID") %>" title="<%#Eval("Name") %>">
                <img class="img-responsive img-center" src="http://www.skateparkoftampa.com/spot/productimages/<%#Eval("ManufacturerID") %>mfgrthumb.jpg"
                 title="<%#Eval("Name") %>" />
                </a>
            </div>
    </ItemTemplate>

    <FooterTemplate></ul></div></FooterTemplate>
</asp:Repeater>




<div class="BlogPost">
<h1>Shop Categories</h1>

    <asp:SqlDataSource runat="server" ID="sdsCategoryMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012CategoryList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="3000" />
    <asp:Repeater ID="rptCategories" runat="server" DataSourceID="sdsCategoryMenu">
        <HeaderTemplate><ul></HeaderTemplate>
        <ItemTemplate>
            <li>
                <a title="Skateboarding <%# Eval("Description")%>"
                href="c.aspx?ID=<%# Eval("CategoryID")%>">
                <%# Eval("Description") %>
                </a>
            </li>
        </ItemTemplate>
        <FooterTemplate></ul></FooterTemplate>
    </asp:Repeater>
</div>




<div class="BlogPost CategoryListSmall">
<h1>Additional Products</h1>
    <asp:SqlDataSource runat="server" ID="sdsFlagsMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012FlagList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="10000" />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsFlagsMenu">
        <ItemTemplate>
            | <a title="<%# Eval("SearchTextDescription").ToString().Replace("\"", "")%>" 
	            href="f.aspx?ID=<%# Eval("FlagID")%>">
                <%# Eval("Description")%>
            </a>
        </ItemTemplate>
        <FooterTemplate> | </FooterTemplate>
    </asp:Repeater>
</div>




</asp:Content>


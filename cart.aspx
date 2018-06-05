<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
<meta name="description" content="All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="Your Shopping Cart at SPoT Skate Shop">
<meta itemprop="description" content="All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="https://www.skateparkoftampa.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="Your Shopping Cart at SPoT Skate Shop"/>
<meta property="og:type" content="company"/>
<meta property="og:image" content="https://www.skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="Your Shopping Cart at SPoT Skate Shop"/>
<meta property="og:description" content="Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>


<script language="javascript" type="text/javascript">

    $(document).ready(function () {


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
          //  if (validateEmail() == false) {
           //     event.preventDefault();
           //     $("#ErrorMessage").html('Please enter a valid email address.');
           //     $("#txtEmailNew").focus();
         //   }
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

        var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        var address = $("#txtEmailNew").attr('value');
        if (!reg.test(address)) {
            return false;
        }
        else {
            return true;
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
<h1>Your Shopping Cart</h1>
<asp:Label runat="server" ID="lblMessage" />
<div class="BuyButton">
<a href="checkout.aspx">Checkout</a> 
<a href="email.aspx">Save/Send Your Cart</a>
<a href="login.aspx">My Account</a>
    <form name="icForm" id="icForm" method="post" action="https://www.internationalcheckout.com/cart.php">
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
        <input type="submit" class="ICButton"  value="International Checkout" />
    </form>
</div>

<div class="BlogPost" >
Quantities in your cart are limited to what's in stock, so you can't add more than what we have in stock for a certain item.  We also automatically remove items
from your cart that go out of stock.  Email <a href="mailto:info@skateparkoftampa.com">info@skateparkoftampa.com</a> for a quick reply to any questions you have.
</div>


<asp:Repeater runat="server" ID="rptCartRegular">
	<HeaderTemplate><table width="100%"></HeaderTemplate>
	<ItemTemplate>
		
							
				<div class="BlogPost">
                    <div class="row">
                    <div class="col-md-6">
					<a href="p.aspx?ID=<%#Eval("ProductID") %>">
					<img class="img-responsive img-center" src="<%#Eval("Photo") %>"  />
					</a>
                        <hr class="visible-xs"/>
                        </div>
                    <div class="col-md-6">
					<div style="font-size:.8em;margin:0px;padding:0px;">Item #<%#Eval("InventoryID") %> </div>
					<div style=" font-weight:bold;"><%#Eval("Manufacturer")%> <%#Eval("ShortDescr") %>
					</div>
					Your Price: <%#Eval("YourPriceUnit", "{0:c}")%><br />
					<b>Quantity: <%#Eval("Quantity") %></b>
                    <%#Eval("MaxQtyAlert") %> <%#Eval("LastOneAlert")%>
					<div style=" font-weight:bold;">Total: <%#Eval("LineTotal", "{0:c}")%></div>
					<div class="BuyButton">
						<a href="cart.aspx?InventoryID=<%#Eval("InventoryID") %>&Quantity=1">Add One</a> 
						<a href="cart.aspx?InventoryID=<%#Eval("InventoryID") %>&Quantity=-1"">Remove One</a>
						<a href="cart.aspx?InventoryID=<%#Eval("InventoryID") %>&Quantity=-1000"">Delete</a>
					</div>
                        </div>
                        </div>
				</div>
	</ItemTemplate>
	<FooterTemplate>
	</table>
	</FooterTemplate>
</asp:Repeater>

<asp:Repeater runat="server" ID="rptCartDiscount">
	<HeaderTemplate>

</HeaderTemplate>
	<ItemTemplate>			
				<div class="BlogPost">
                    <div class="row">
                    <div class="col-md-6">
					<a href="p.aspx?ID=<%#Eval("ProductID") %>">
					<img src="<%#Eval("Photo") %>" class="img-responsive img-center" />
					</a>
                        <hr class="visible-xs"/>
                        </div>
                    <div class="col-md-6">
					<div style="font-size:.8em;margin:0px;padding:0px;">Item #<%#Eval("InventoryID") %> </div>
					<div style=" font-weight:bold;"><%#Eval("Manufacturer")%> <%#Eval("ShortDescr") %>
					</div>
					Regular Price: <%#Eval("RegularPrice", "{0:c}") %><br />
					<span style="color:#b80b10;">Sale Discount: <%#Eval("CalculatedSaleDiscount", "{0:c}")%><br />
					Coupon Discount: <%#Eval("CalculatedCouponDiscount", "{0:c}") %></span><br />
					Your Price: <b><%#Eval("YourPriceUnit", "{0:c}")%></b><br />
					<b>Quantity: <%#Eval("Quantity") %></b>
                    <%#Eval("MaxQtyAlert") %> <%#Eval("LastOneAlert")%>
                    <br />
					<div style=" font-weight:bold;">Total: <%#Eval("LineTotal", "{0:c}")%></div>
					<div class="BuyButton">
						<a href="cart.aspx?InventoryID=<%#Eval("InventoryID") %>&Quantity=1">Add One</a> 
						<a href="cart.aspx?InventoryID=<%#Eval("InventoryID") %>&Quantity=-1"">Remove One</a>
						<a href="cart.aspx?InventoryID=<%#Eval("InventoryID") %>&Quantity=-1000"">Delete</a>
					</div>
				</div>
                        </div>
                        </div>
	</ItemTemplate>

	<FooterTemplate>
	</FooterTemplate>
</asp:Repeater>



<asp:Repeater runat="server" ID="rptTotalsRegular">
<HeaderTemplate>
</HeaderTemplate>
<ItemTemplate>

<form method="get" action="cart.aspx">

<h2>Your Order Summary</h2>  
Total Items: <%# Eval("TotalItems")%><br />
Your Total Price: <%# Eval("LineTotalTotal", "{0:c}")%>


<%# Eval("FreeShipping")%>

<div style="margin:0px; padding:0px; color:#b80b10; text-align:center;">
<%=strCouponApplyFeedback %>
</div>

<div>
Shipping and taxes are based on your cart weight and zip code. You will be shown these amounts when checking out before you pay.

Free shipping cannot be combined with any other offers like coupons.
All orders over $59 without other offers like coupons get free UPS Ground shipping in the Continental US.
</div>

<div>
	Coupon Code: <input type="text" id="CID" name="CID" /> <input style="font-size: 1em;" type="submit" value="Apply" />
</div>


</form>


</ItemTemplate>
</asp:Repeater>


<asp:Repeater runat="server" ID="rptTotalsDiscount">
<HeaderTemplate>
</HeaderTemplate>
<ItemTemplate>
<form method="get" style="font-size: 1em;" action="cart.aspx">

<div style="border:0px; padding:0px; text-align:center;"><h2>Your Order Summary</h2>  Total Items: <%# Eval("TotalItems")%></div>
<table>
	<tr>
		<td align="right">Regular Price Subtotal</td>
		<td align="right" width="100"><%# Eval("TotalRegularPrice", "{0:c}")%></td>
	</tr>
	<tr>
		<td align="right" style="color:#b80b10;">Sale Discounts</td>
		<td align="right" style="color:#b80b10;" width="100"><%# Eval("SaleDiscountTotal", "{0:c}")%></td>
	</tr>
	<tr>
		<td align="right" style="color:#b80b10;">Coupon Discounts</td>
		<td align="right" style="color:#b80b10;" width="100"><%# Eval("CouponDiscountTotal", "{0:c}")%></td>
	</tr>
	<tr>
		<td align="right" style="color:#b80b10;">Total Discounts</td>
		<td align="right" style="color:#b80b10;" width="100"><%# Eval("TotalDiscount", "{0:c}")%></td>
	</tr>
	<tr>
		<td align="right">Your Total Price</td>
		<td align="right" width="100"><b><%# Eval("LineTotalTotal", "{0:c}")%></b></td>
	</tr>
</table>

    
    <%=strCouponSummary %>

    <div style="margin:0px; padding:0px; color:#b80b10; text-align:center;">
        <%=strCouponApplyFeedback %>
    </div>

    <div>
    Shipping and taxes are based on your cart weight and zip code. You will be shown these amounts when checking out before you pay.
    If you have a coupon code, you can't combine it with
    any other offers such as free shipping over $59 or other coupons.  Sorry, no double dipping.  Thanks for shopping with us!</div>

    Coupon Code: <input type="text" id="CID" name="CID" style="width:50px;" /> <input style="font-size: 1em;" type="submit" value="Apply" />


</form>


</ItemTemplate>
</asp:Repeater>



</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">



<asp:Panel runat="server" ID="pnlNotLoggedIn">
<h1>Checkout</h1>

    <form action="login.aspx" method="post">
    <h1>Returning Customers: Login</h1>
    <div>
    Email: <input type="email" class="Checkout" name="txtEmailLogin" id="txtEmailLogin"  />
    </div>
    <div>
    Password: <input type="password" class="Checkout" name="txtPasswordLogin" id="txtPasswordLogin"  />
    <input type="hidden" id="txtFrom" name="txtFrom" value="CartPage" />
    </div>

    <input type="submit" value="Login and Checkout" class="BuyButtonInput" style="margin-right:0px;" />  
    <span>
    <input type="checkbox" style="margin-right:0px; padding:0px;" id="chkSave" name="chkSave" /> Save Login
    </span>
    <div>Note: if you forgot your password, just put in your email address, click the button, and we will email it to you.</div>
    </form>

    <form method="post" action="login.aspx">
    <h2>New Customers - United States</h2>
    <div id="ErrorMessage" class="ErrorMessages"></div>
    <div>
    Email:
    <input class="Checkout" type="email" id="txtEmailNew" name="txtEmailNew" /><br />
    First Name: <input type="text" class="Checkout"  id="txtFirstName" name="txtFirstName" /><br />
    Last Name: <input type="text" class="Checkout"  id="txtLastName" name="txtLastName" /><br />
    Street: <input type="text" class="Checkout"  id="txtAddress1" name="txtAddress1" /><br />
    Apt/Company: <input type="text"  class="Checkout" id="txtAddress2" name="txtAddress2" /><br />
    City: <input type="text" class="Checkout" id="txtCity" name="txtCity" /><br />
    State: 
    
            <select id="txtState" name="txtState" class="Checkout">
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
        <div >
        International customers, please select the international checkout option.
        </div>
    Zip: <input type="text" class="Checkout" id="txtZip" name="txtZip" /><br />
    Phone: <input type="text" class="Checkout" id="txtPhone" name="txtPhone" /><br />
    <div id="PasswordMatch" class="ErrorMessages"></div>
    Choose Password: <input type="password" class="Checkout" id="txtPassword1" name="txtPassword1" /><br />
    Confirm Password: <input type="password" class="Checkout" id="txtPassword2" name="txtPassword2" /><br />
    </div>
    <input type="submit" class="BuyButtonInput" id="cmdSubmitNew" name="cmdSubmitNew" value="Submit and Checkout" />
    <br />
    
    <input type="hidden" id="txtFromNewCustomer" name="txtFromNewCustomer" value="CartPage" />

    </form>

    
</asp:Panel>

<asp:Panel runat="server" ID="pnlLoggedIn">
<h1>Pick Shipping &amp; Checkout</h1>
<form method="get" action="<%=ConfigurationSettings.AppSettings["PaymentURL"] %>">
    <asp:Panel runat="server" ID="pnlUPS" style="font-size: .8em;">
        <%=strShippingOptions %>
        <%=strShippingErrorExplanation %>
    </asp:Panel>
    <%=strMessage %>
    <input type="submit" value="Checkout" class="BuyButtonInput" />
    <input type="hidden" id="W" name="W" value="<%=strWhoDat %>" />
    <input type="hidden" id="C" name="C" value="<%=strCartID %>" />
</form>   

<h1>Returns and Exchanges</h1>
<div class="BlogPost">
Returns and exchanges are accepted within 30 days of your order as long as the items are still in brand new condition with all packaging. No returns or exchanges may be made on sale or discounted items. All decks that are set-up or gripped upon request of the customer are not eligible for return or exchange. Shipping costs are your responsibility unless we made a mistake with your order. In that case, we pay for all shipping costs, including reimbursing you for your return shipping costs. All sales of specialty and limited products are final. No order cancellations or returns may be made for any specialty or limited products. Examples include Nike SB QuickStrike releases and limited edition boards.
</div>


<h1>Notes About UPS Shipping</h1>
<div class="BlogPost chkout-shipping">
    <ul style="margin: 0px 10px 0px 0px; ">
        <li>Your shipping options are based on your cart's estimated weight (<%=strWeight %> lb) and your zip code (<%=strZip %>).</li>
        <li>The UPS "clock" starts ticking the DAY AFTER your order is handed to them.</li>
        <li>Examples:
	        <ul>
		        <li>Order on Monday before 2pm and choose 3 Day Select.  Tuesday is the first business day, Wednesday is the second, and your order arrives the third business day: Thursday.</li>
				<li>Order on Friday before 2pm and choose Second Day Air.  Monday is the first business day, and Tuesday is the second business day when your order arrives.</li>
		        <li>Order on Thursday before 2pm and choose Next Day Air.  Since it's before 2pm, your order arrives on the first business day: Friday.</li>
		        <li>Contact us with any questions you have about shipping times.</li>
		        <li>All orders shipping to Florida get there the next business day so you should always choose UPS Ground if you live in Florida.</li>
	        </ul>
        </li>
		<li>The free shipping offer for orders over $59 cannot be combined with coupon codes or other offers.  We would have been
		gone a long time ago with prices that low AND free shipping.  
        If you <a href="cart.aspx?CIDNO=1">remove any coupons from your cart</a>, the free shipping over $59 
        offer stands and will be shown here. The free shipping offer is only for the continental US.</li>
    </ul>
</div>

</asp:Panel>

</asp:Content>


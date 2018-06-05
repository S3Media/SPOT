<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="https.aspx.cs" Inherits="https" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="Skatepark of Tampa Secure Payment Form. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="Skatepark of Tampa Features Secure Payment Form">
<meta itemprop="description" content="Skatepark of Tampa Secure Payment Form. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="image" content="https://skateparkoftampa.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="Skatepark of Tampa Secure Payment Form"/>
<meta property="og:type" content="company"/>
<meta property="og:image" content="https://skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="Skatepark of Tampa Secure Payment Form"/>
<meta property="og:description" content="Skatepark of Tampa Secure Payment Form. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>
<script language="javascript" type="text/javascript">

    $(document).ready(function () {
        $("#CVV2").click(function (event) {
            $("#CVV2Display").html("<h1>Card Security Code:</h1><img src=cvv2numberdisplay.gif />");
            event.preventDefault();
        });
    });
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">


<form class="PaymentForm" runat="server" id="frmForm">
    <div style="text-align:center;">
        <asp:Label runat="server" ID="lblConfirm" />
        <asp:Label runat="server" ID="lblCardProcessingError" />
        <asp:Label runat="server" ID="lblMessage" />
    </div>
<asp:Panel runat="server" ID="pnlPayment">
    <div class="BlogPost finalpay">     
        <h1>Credit Card Billing Address</h1>
                    <div class="NotesAndTips">Note: this has to mach what's on file at the credit card company. Change it here if necessary. We will still ship to your shipping address.</div>
                    <div>
                        <h5>First Name:</h5> <asp:TextBox runat="server"  id="txtFirstName" />
                    </div>
                    <div>
                        <h5>Last Name: </h5> <asp:TextBox runat="server" id="txtLastName" />
                    </div>
                    <div>
                       <h5> Billing Street Address: </h5> <asp:TextBox runat="server" id="txtAddress" />
                    </div>
                    <div>
                       <h5> Company/ Apt#: </h5><asp:TextBox runat="server"  id="txtCompany" />
                    </div>
                    <div>
                       <h5> Billing City: </h5> <asp:TextBox runat="server" ID="txtCity"  />
                    </div>
                    <div>
                   <h5> State: </h5> <asp:DropDownList runat="server" ID="txtState">
                        <asp:ListItem Value="">Choose State</asp:ListItem>
                        <asp:ListItem Value="AL">Alabama</asp:ListItem>
                        <asp:ListItem Value="AK">Alaska</asp:ListItem>
                        <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                        <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                        <asp:ListItem Value="CA">California</asp:ListItem>
                        <asp:ListItem Value="CO">Colorado</asp:ListItem>
                        <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                        <asp:ListItem Value="DE">Delaware</asp:ListItem>
                        <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                        <asp:ListItem Value="FL">Florida</asp:ListItem>
                        <asp:ListItem Value="GA">Georgia</asp:ListItem>
                        <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                        <asp:ListItem Value="ID">Idaho</asp:ListItem>
                        <asp:ListItem Value="IL">Illinois</asp:ListItem>
                        <asp:ListItem Value="IN">Indiana</asp:ListItem>
                        <asp:ListItem Value="IX">International</asp:ListItem>
                        <asp:ListItem Value="IA">Iowa</asp:ListItem>
                        <asp:ListItem Value="KS">Kansas</asp:ListItem>
                        <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                        <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                        <asp:ListItem Value="ME">Maine</asp:ListItem>
                        <asp:ListItem Value="MD">Maryland</asp:ListItem>
                        <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                        <asp:ListItem Value="MI">Michigan</asp:ListItem>
                        <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                        <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                        <asp:ListItem Value="MO">Missouri</asp:ListItem>
                        <asp:ListItem Value="MT">Montana</asp:ListItem>
                        <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                        <asp:ListItem Value="NV">Nevada</asp:ListItem>
                        <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                        <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                        <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                        <asp:ListItem Value="NY">New York</asp:ListItem>
                        <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                        <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                        <asp:ListItem Value="OH">Ohio</asp:ListItem>
                        <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                        <asp:ListItem Value="OR">Oregon</asp:ListItem>
                        <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                        <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                        <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                        <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                        <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                        <asp:ListItem Value="TX">Texas</asp:ListItem>
                        <asp:ListItem Value="UT">Utah</asp:ListItem>
                        <asp:ListItem Value="VT">Vermont</asp:ListItem>
                        <asp:ListItem Value="VA">Virginia </asp:ListItem>
                        <asp:ListItem Value="WA">Washington</asp:ListItem>
                        <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                        <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                        <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                    </asp:DropDownList> <asp:Label runat="server" ID="lblState" />
                        <div class="NotesAndTips">International credit card? No problem, select International in the above list. Thank you!<br /></div>
                    </div>
                    
                    <div>
                      <h5>  Billing Zip Code </h5> <asp:TextBox runat="server" ID="txtZip"  />
                    </div>

                    <div>
                       <h5> Phone:</h5><asp:TextBox runat="server" ID="txtPhone" />
                    </div>

                                                    <asp:RequiredFieldValidator CssClass="ErrorMessages" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Please enter First Name." />
                                <asp:RequiredFieldValidator CssClass="ErrorMessages" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Please enter Last Name." />
                                <asp:RequiredFieldValidator CssClass="ErrorMessages" ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPhone" ErrorMessage="Please enter your billing phone number." />
                                <asp:RequiredFieldValidator CssClass="ErrorMessages" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCity" ErrorMessage="Please enter your billing city." />
                                <asp:RequiredFieldValidator CssClass="ErrorMessages" ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtZip" ErrorMessage="Please enter your billing zip code." />
                                <asp:RequiredFieldValidator CssClass="ErrorMessages" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress" ErrorMessage="Please enter your billing street address." />


                    <h1>Payment Information</h1>                   
			                    <h5>Card Type:</h5>
			                    <div style="font-size:.7em;">
                                <input type="radio" style="margin:0px 0px 0px 10px;" name="cardtype" /> Visa
			                    <input type="radio" style="margin:0px 0px 0px 10px;" name="cardtype" /> Mastercard
			                    <input type="radio" style="margin:0px 0px 0px 10px;" name="cardtype" /> AMEX
			                    <input type="radio" style="margin:0px 0px 0px 10px;" name="cardtype" /> Discover
                                </div>
                                    <img src="https://skateparkoftampa.com/spot/images5/cards.jpg" />
   
				                <h5>Card Number</h5>
				                <asp:TextBox Runat="server" ID="x_Card_Num" />
                                 <h5> Expire Month: </h5>
					                <asp:DropDownList runat="server" id="x_Exp_Date_MONTHPORTION">
						                <asp:ListItem value="01">01 - Jan</asp:ListItem>
						                <asp:ListItem value="02">02 - Feb</asp:ListItem>
						                <asp:ListItem value="03">03 - Mar</asp:ListItem>
						                <asp:ListItem value="04">04 - Apr</asp:ListItem>
						                <asp:ListItem value="05">05 - May</asp:ListItem>
						                <asp:ListItem value="06">06 - Jun</asp:ListItem>
						                <asp:ListItem value="07">07 - Jul</asp:ListItem>
						                <asp:ListItem value="08">08 - Aug</asp:ListItem>
						                <asp:ListItem value="09">09 - Sep</asp:ListItem>
						                <asp:ListItem value="10">10 - Oct</asp:ListItem>
						                <asp:ListItem value="11">11 - Nov</asp:ListItem>
						                <asp:ListItem value="12">12 - Dec</asp:ListItem>
					                </asp:DropDownList>
					                <h5>Year:</h5>
					                <asp:DropDownList runat="server" id="x_Exp_Date_YEARPORTION" />

				                <h5>Card Security Code <a href="cvv2numberdisplay.gif" id="CVV2">&#128712;</a></h5>
    				                <asp:TextBox  runat="server" id="x_card_code"/> 
                                  <h1>Optional Notes</h1>
                            <h5>You can add a note about your order here:</h5>
                            <br /><asp:TextBox runat="server" ID="txtOrderNote" MaxLength="200" />
                            <asp:Label runat="server" ID="lblBillingNote" style="color:Red;" />  
    
                            <asp:Button ID="Button1" runat="server" Text="Submit Order" 
                            CssClass="BuyButton" style="margin-top: 20px; padding:10px; background-color: #b80b10; 
                                color:#ffffff; font-size:1.1em; float:left;" OnClick="cmdSubmit" />        

                          

                            



<!--
SiteSeal Html Builder Code:
Shows the logo at URL https://seal.networksolutions.com/images/basicrecgreen.gif
Logo type is  ("NETSB")
//-->
<!--
<script language="JavaScript" type="text/javascript">    SiteSeal("https://seal.networksolutions.com/images/basicrecgreen.gif", "NETSB", "none");</script>
//-->
         
                    <div style="clear:both;" id="CVV2Display"></div>
    </div>
</asp:Panel>
<asp:Label runat="server" ID="lblGeneralError" />

    <div style="font-size:.6em;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="x_Card_Num" ErrorMessage="Enter your credit card number, please." CssClass="ErrorMessages" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="x_card_code" ErrorMessage="Please enter the three digit security code from the back of your card. For American Express, it's the four digits on the front of the card." CssClass="ErrorMessages" />
                            </div>
    <div class="BlogPost">
                            
                            
                            <h1>Security Notes</h1>
                            <ul style="font-size:.8em; margin: 0px 5px 0px 5px;">
                                <li>We do not save credit card information.</li>
                                <li>For security reasons, we don't offer this option.</li>
                                <li>Your information is never sold or given away. We've been here since 1993 and online since 1997. Email info@skateparkoftampa.com for a quick reply to any questions.</li>
                                <li><!-- (c) 2005, 2012. Authorize.Net is a registered trademark of CyberSource Corporation --> <div class="AuthorizeNetSeal"> <script type="text/javascript" language="javascript">                                                                                                                                                                   var ANS_customer_id = "8da780be-c547-4d14-b0e3-3ee2fbfba8ba";</script> <script type="text/javascript" language="javascript" src="//verify.authorize.net/anetseal/seal.js" ></script> <a href="http://www.authorize.net/" id="AuthorizeNetText" target="_blank">Online Payment System</a> </div></li>
                                <li><img style="margin-top:10px;" src="https://seal.networksolutions.com/images/basicrecgreen.gif" /></li>
                            </ul>
        </div>

</form>




<asp:Panel runat="server" ID="pnlReceipt" Visible="false">


<h1>Thank You, Your Order Is Complete</h1>
<div class="BlogPost">
<asp:Repeater runat="server" id="rptTotals">
<ItemTemplate>

	            Your OrderID is <%# DataBinder.Eval(Container.DataItem, "OrderID")%>
                <br /><br />
                You will get an email when it ships.  
	            Other than that, we never send mail that you don't ask for.  If you want to stay up to date, make sure
	            you're on the 
	            <a href="http://www.skateparkoftampa.com/spot/rssinfo.aspx">
	            NEW SPoT Skate Shop Mailing List - click here to join.</a>  We never sell or give out your information and you
	            can unsubscribe at any time.
</ItemTemplate>
</asp:Repeater>
</div>



<asp:Repeater runat="server" ID="rptReceipt">

<HeaderTemplate>
<h1>Items Ordered</h1>
</HeaderTemplate>
<ItemTemplate>
<div class="BlogPost">
    <a href="<%=ConfigurationManager.AppSettings["FullyQualifiedDomain"] %>p.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "ProductID")%>"><%# DataBinder.Eval(Container.DataItem, "InventoryColorImageThumb")%></a>
    <%# DataBinder.Eval(Container.DataItem, "Manufacturer")%>: 
    <a href="<%=ConfigurationManager.AppSettings["FullyQualifiedDomain"] %>p.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "ProductID")%>">
    <%# DataBinder.Eval(Container.DataItem, "ShortDescr")%></a><br />
    Quantity: <%# DataBinder.Eval(Container.DataItem, "QuantityOrdered")%>
    Price <%# DataBinder.Eval(Container.DataItem, "UnitPrice", "{0:c}")%>
    <br />
    Subtotal: <%# DataBinder.Eval(Container.DataItem, "LineSubTotal", "{0:c}")%><br />
    Sales Tax: <%# DataBinder.Eval(Container.DataItem, "LineTotalTax", "{0:c}")%><br />
    Total: <%# DataBinder.Eval(Container.DataItem, "LineTotal", "{0:c}")%>
</div>
</ItemTemplate>

<FooterTemplate>
</FooterTemplate>
</asp:Repeater>


</asp:Panel>




</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">
<h1>Order Summary</h1>
<div class="BlogPost">


<asp:Repeater runat="server" ID="rptOrderDetailsRegular">
<HeaderTemplate>
</HeaderTemplate>
<ItemTemplate>
    
    <table width="250">
        <tr>
            <td>Total Items</td>
            <td align="right"><%# Eval("TotalItems")%></td>
        </tr>
	    <tr>
		    <td>Subtotal</td>
		    <td align="right" width="100"><%# Eval("LineTotalTotal", "{0:c}")%></td>
	    </tr>
	    <tr>
		    <td>Sales Tax</td>
		    <td align="right"><%=fltTax.ToString("#,###.00")%></td>
	    </tr>
	    <tr>
		    <td><%=strShipping%></td>
		    <td align="right"><%=fltShipping.ToString("#,###.00")%></td>
	    </tr>
	    <tr>
		    <td>Grand Total</td>
		    <td align="right"><b>$<%=fltGrandTotal.ToString("#,###.00")%></b></td>
	    </tr>
    </table>
</ItemTemplate>
</asp:Repeater>



    <asp:Repeater runat="server" ID="rptOrderDetailsDiscount">
    <HeaderTemplate>
    </HeaderTemplate>
    <ItemTemplate>

    <table width="250">
        <tr>
            <td>Total Items</td>
            <td align="right"><%# Eval("TotalItems")%></td>
        </tr>
	    <tr>
		    <td>Regular Price Subtotal</td>
		    <td align="right" width="100"><%# Eval("TotalRegularPrice", "{0:c}")%></td>
	    </tr>
	    <tr>
		    <td style="color:Red;">Sale Discounts</td>
		    <td align="right" style="color:Red;" width="100"><%# Eval("SaleDiscountTotal", "{0:c}")%></td>
	    </tr>
	    <tr>
		    <td style="color:Red;">Coupon Discounts</td>
		    <td align="right" style="color:Red;" width="100"><%# Eval("CouponDiscountTotal", "{0:c}")%></td>
	    </tr>
	    <tr>
		    <td style="color:Red;">Total Discounts</td>
		    <td align="right" style="color:Red;" width="100"><%# Eval("TotalDiscount", "{0:c}")%></td>
	    </tr>
	    <tr>
		    <td>Subtotal</td>
		    <td align="right" width="100"><b><%# Eval("LineTotalTotal", "{0:n}")%></b></td>
	    </tr>
	    <tr>
		    <td>Sales Tax</td>
		    <td align="right"><%=fltTax.ToString("#,###.00")%></td>
	    </tr>
	    <tr>
		    <td><%=strShipping%></td>
		    <td align="right"><%=fltShipping.ToString("#,###.00")%></td>
	    </tr>
	    <tr>
		    <td>Grand Total</td>
		    <td align="right"><b>$<%=fltGrandTotal.ToString("#,###.00")%></b></td>
	    </tr>
    </table>

		
    </ItemTemplate>
    </asp:Repeater>



</div>


<h1>Shipping Address</h1>
<div class="BlogPost">

<asp:Repeater runat="server" ID="rptShip">
<ItemTemplate>
    <%# Eval("FirstName") %> <%# Eval("LastName") %><br />
    <%# Eval("Address") %> <%# Eval("Company") %><br />
    <%# Eval("City") %>, <%# Eval("State") %> <%# Eval("Zip") %><br />
    <%# Eval("Phone") %><br />
    Email: <%# Eval("Email") %><br />
    <a href="http://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>checkout_editshipping.aspx">Update Shipping Information</a><br /><br />
</ItemTemplate>
</asp:Repeater>




</div>

</asp:Content>
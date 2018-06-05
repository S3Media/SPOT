<%@ Control Language="C#" AutoEventWireup="true" CodeFile="control_cartsmall.ascx.cs" Inherits="control_cartsmall" %>
<div>
    <h1>Your Cart</h1>
    <asp:Label runat="server" ID="lblMessage" />

    <asp:Repeater runat="server" ID="rptCartRegular">
	    <HeaderTemplate><table width="100%"></HeaderTemplate>
	    <ItemTemplate>
							
				    <div class="row">
                        <div class="col-sm-6">
					    <a href="p.aspx?ID=<%#Eval("ProductID") %>">
					    <img src="<%#Eval("Photo") %>" style="height:auto; width:100%;" />
					    </a>
                            </div>
                        <div class="col-sm-6">
					    <div class="cart-id-number">Item #<%#Eval("InventoryID") %> </div>
					    <div class="checkout-cart-title"><%#Eval("Manufacturer")%> <%#Eval("ShortDescr") %>
					    </div>
					    <div class="cart-price">Your Price: <%#Eval("YourPriceUnit", "{0:c}")%></div><br />
					    <b>Quantity: <%#Eval("Quantity") %></b>
                        <%#Eval("MaxQtyAlert") %> <br /><%#Eval("LastOneAlert")%>
					    <div class="cart-total">Total: <%#Eval("LineTotal", "{0:c}")%></div>
					    <div class="BuyButton">
						    <a href="cart.aspx?InventoryID=<%#Eval("InventoryID") %>&Quantity=1">Add One</a> 
						    <a href="cart.aspx?InventoryID=<%#Eval("InventoryID") %>&Quantity=-1"">Remove One</a>
						    <a href="cart.aspx?InventoryID=<%#Eval("InventoryID") %>&Quantity=-1000"">Delete</a>
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

							
				    <div class="row">
                        <div class="col-sm-6">
					    <a href="p.aspx?ID=<%#Eval("ProductID") %>">
					    <img src="<%#Eval("Photo") %>" style="height:auto; width:100%;" />
					    </a>
                            </div>
                        <div class="col-sm-6">
					    <div class="cart-id-number">Item #<%#Eval("InventoryID") %> </div>
					    <div class="checkout-cart-title"><%#Eval("Manufacturer")%> <%#Eval("ShortDescr") %>
					    </div>
					    <div class="cart-price">Regular Price: <%#Eval("RegularPrice", "{0:c}") %></div><br />
					    <span class="cart-discount">Sale Discount: <%#Eval("CalculatedSaleDiscount", "{0:c}")%><br />
					    Coupon Discount: <%#Eval("CalculatedCouponDiscount", "{0:c}") %></span><br />
					    Your Price: <b><%#Eval("YourPriceUnit", "{0:c}")%></b><br />
					    <b>Quantity: <%#Eval("Quantity") %></b>
                        <%#Eval("MaxQtyAlert") %> <br /><%#Eval("LastOneAlert")%>
                        <br />
					     <div class="cart-total">Total: <%#Eval("LineTotal", "{0:c}")%></div>
					    <div class="BuyButton">
						    <a href="cart.aspx?InventoryID=<%#Eval("InventoryID") %>&Quantity=1">Add One</a> 
						    <a href="cart.aspx?InventoryID=<%#Eval("InventoryID") %>&Quantity=-1"">Remove One</a>
						    <a href="cart.aspx?InventoryID=<%#Eval("InventoryID") %>&Quantity=-1000"">Delete</a>
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


    <div class="order-summary">
    <h2>Your Order Summary</h2>  
    Total Items: <%# Eval("TotalItems")%><br />
    Your Total Price: <%# Eval("LineTotalTotal", "{0:c}")%>

    


    </div>


    </ItemTemplate>
    </asp:Repeater>


    <asp:Repeater runat="server" ID="rptTotalsDiscount">
    <HeaderTemplate>
    </HeaderTemplate>
    <ItemTemplate>

    <div>
        <h2>Your Order Summary</h2>  Total Items: <%# Eval("TotalItems")%>

        <table>
	        <tr>
		        <td align="right">Regular Price Subtotal</td>
		        <td align="right" width="100"><%# Eval("TotalRegularPrice", "{0:c}")%></td>
	        </tr>
	        <tr>
		        <td align="right" style="color:#b90b10;">Sale Discounts</td>
		        <td align="right" style="color:#b90b10;" width="100"><%# Eval("SaleDiscountTotal", "{0:c}")%></td>
	        </tr>
	        <tr>
		        <td align="right" style="color:#b90b10;">Coupon Discounts</td>
		        <td align="right" style="color:#b90b10;" width="100"><%# Eval("CouponDiscountTotal", "{0:c}")%></td>
	        </tr>
	        <tr>
		        <td align="right" style="color:#b90b10;">Total Discounts</td>
		        <td align="right" style="color:#b90b10;" width="100"><%# Eval("TotalDiscount", "{0:c}")%></td>
	        </tr>
	        <tr>
		        <td align="right">Your Total Price</td>
		        <td align="right" width="100"><b><%# Eval("LineTotalTotal", "{0:c}")%></b></td>
	        </tr>
        </table>

    
        <%=strCouponSummary %>
    </div>

    </ItemTemplate>
    </asp:Repeater>

</div>

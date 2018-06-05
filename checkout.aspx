<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" %>
<%@ Register Src="control_cartsmall.ascx" TagName="Cart" TagPrefix="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="Checkout at SPoT Skate Shop">
<meta itemprop="description" content="All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="Checkout at SPoT Skate Shop"/>
<meta property="og:type" content="company"/>
<meta property="og:image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="Checkout at SPoT Skate Shop"/>
<meta property="og:description" content="Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">

    <h1>Checkout</h1>
    <div class="cart">
<Products:Cart runat="server" />
    </div>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

            <h1>Choose Your Shipping and Checkout</h1>
        <form method="get" action="<%=ConfigurationSettings.AppSettings["PaymentURL"] %>">
            <asp:Panel runat="server" ID="pnlUPS">
                <%=strShippingOptions %>
                <%=strShippingErrorExplanation %>
            </asp:Panel>
            <%=strMessage %>
            <input type="submit" value="Checkout" class="BuyButtonInput" />
            <input type="hidden" id="W" name="W" value="<%=strWhoDat %>" />
            <input type="hidden" id="C" name="C" value="<%=strCartID %>" />
        </form>        

    <asp:Repeater runat="server" ID="rptCustomerInfo">
    <ItemTemplate>
        
        <h1>Verify Your Shipping Address</h1>
        <div class="shipping-address">
            <%#Eval("FirstName") %> <%#Eval("LastName") %>
            <br />
            <%#Eval("Address") %>
            <%#Eval("Company") %>
            <br />
            <%#Eval("City") %>, <%#Eval("State") %> <%#Eval("Zip") %><br />
            <%#Eval("Phone") %><br />
            <span class="BuyButton"><a href="checkout_editshipping.aspx">Edit Shipping Address</a></span>
        </div>

        

    </ItemTemplate>
    </asp:Repeater>


</asp:Content>


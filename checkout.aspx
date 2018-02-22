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

<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">
<div class="cart">
<Products:Cart runat="server" />
    </div>




<!--<div class="BlogPost">


 <h1>Continue Shopping</h1>

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

<div class="BlogPost">

    <h1><a href="shoe.aspx">What's Your Shoe Size?</a></h1>

        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=6">5</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=7">5.5</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=8">6</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=9">6.5</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=10">7</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=11">7.5</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=12">8</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=13">8.5</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=14">9</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=15">9.5</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=16">10</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=17">10.5</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=18">11</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=19">11.5</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=20">12</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=22">13</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=24">14</a></div>        <div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=26">15</a></div></div> -->

</asp:Content>


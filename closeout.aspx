<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="closeout.aspx.cs" Inherits="closeout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

    <meta name="description" content="Skateboarding Closeout: This is all our discounted and sale gear. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
    <meta itemprop="name" content="Skateboarding Closeout in stock at SPoT Skate Shop">
    <meta itemprop="description" content="Skateboarding Closeout: This is all our discounted and sale gear. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
    <meta itemprop="image" content="http://www.skateparkoftampa.com/spot/images3/closeouticonimage.jpg">

    <meta property="og:title" content="Skateboarding Closeout in stock at SPoT Skate Shop"/>
    <meta property="og:type" content="product"/>
    <meta property="og:image" content="http://www.skateparkoftampa.com/spot/images3/closeouticonimage.jpg"/>
    <meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
    <meta property="og:description" content="Skateboarding Closeout: This is all our discounted and sale gear.  All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>

    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">

<div class="BlogPost">

    <h1>Sale/Closeout Items In Stock Now</h1>
    <asp:SqlDataSource runat="server" ID="sdsPages" SelectCommand="SPOT2012CloseoutProductsNumberOfPages" ConnectionString="<%$ConnectionStrings:CS %>"
        SelectCommandType="StoredProcedure" EnableCaching="true" CacheDuration="10000"> 
    </asp:SqlDataSource>
    <asp:Repeater runat="server" ID="rptPages" DataSourceID="sdsPages">
    <HeaderTemplate>
        <div class="ProductPager">
            <span>
    </HeaderTemplate>
    <ItemTemplate>
                <a class="NewArrivalsPagesLink" href="closeout.aspx?Page=<%#Eval("PageNumber") %>"><%#Eval("PageNumber") %></a>
    </ItemTemplate>
    <FooterTemplate>
            </span>
        </div>
    </FooterTemplate>
    </asp:Repeater>

    <div id="NewArrivals">


        <asp:SqlDataSource runat="server" ID="sdsNew"
        SelectCommand="SPOT2012CloseoutProductsPaged" SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:CS %>"
        EnableCaching="true" CacheDuration="2000">
        <SelectParameters>
            <asp:QueryStringParameter Name="Page" QueryStringField="Page" DefaultValue="1" />
        </SelectParameters>
        </asp:SqlDataSource>
        <asp:Repeater ID="rptNew" DataSourceID="sdsNew" 
        runat="server">
        <ItemTemplate>
                <div class="ProductBlock">
                
                    <a title="<%#Eval("Name") %> <%#Eval("Color") %> <%#Eval("ShortDescr") %>" 
                    href="/product/<%#Eval("ProductID") %>/<%#Eval("Name").ToString().Replace("\"", "").Replace(" ", "_") %>_<%#Eval("Color").ToString().Replace("\"", "").Replace(" ", "_").Replace("/", "") %>_<%#Eval("ShortDescr").ToString().Replace("\"", "").Replace(" ", "_") %>/&CID=<%#Eval("ColorID") %>"><img 
                        title="<%#Eval("Name").ToString().Replace("\"", "") %> <%#Eval("Color").ToString().Replace("\"", "") %> <%#Eval("ShortDescr").ToString().Replace("\"", "") %>" 
                        width="190" height="190" 
                        src="http://skateparkoftampa.com/spot/productimages/colors/<%#Eval("ColorID") %>_<%#Eval("ProductID") %>.jpg" /></a>
                
                    <div class="ProductBlockText">
                        <a title="<%#Eval("Name") %> <%#Eval("Color") %> <%#Eval("ShortDescr") %>" 
                            href="/product/<%#Eval("ProductID") %>/<%#Eval("Name").ToString().Replace("\"", "").Replace(" ", "_") %>_<%#Eval("Color").ToString().Replace("\"", "").Replace(" ", "_").Replace("/", "") %>_<%#Eval("ShortDescr").ToString().Replace("\"", "").Replace(" ", "_") %>/&CID=<%#Eval("ColorID") %>">
                        <%#Eval("Name")%> 
                        <%#Eval("ShortDescr")%> <%#Eval("Color")%></a> <%#Eval("CurrentPrice", "{0:c}")%>
                    </div>
                    <div class="ProductBlockTextAlert">
                        <%#Eval("SaleNote") %> <%#Eval("FreeShippingNote") %>
                        <%#Eval("InShopOnly")%>
                    </div>

                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
        <asp:Repeater runat="server" ID="rptPages2" DataSourceID="sdsPages">
    <HeaderTemplate>
        <div class="ProductPager">
            <span>
    </HeaderTemplate>
    <ItemTemplate>
                <a class="NewArrivalsPagesLink" href="closeout.aspx?Page=<%#Eval("PageNumber") %>"><%#Eval("PageNumber") %></a>
    </ItemTemplate>
    <FooterTemplate>
            </span>
        </div>
    </FooterTemplate>
    </asp:Repeater>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

        <div class="BlogPost">
        <h1>Companies With Sale/Closeout Items in Stock Now</h1>    
            

            <asp:SqlDataSource runat="server" ID="sdsMfgrs"
            SelectCommand="SPOT2012CloseoutProductsMfgrSummary" SelectCommandType="StoredProcedure"
            ConnectionString="<%$ ConnectionStrings:CS %>"
            EnableCaching="true" CacheDuration="2000"></asp:SqlDataSource>


            <asp:Repeater runat="server" ID="rptMfgrs" DataSourceID="sdsMfgrs">
                <ItemTemplate>
                <div class="NewArrivalSmallBlock" style="height:90px;">
                    <div>
                        <a title="<%#Eval("Name").ToString().Replace("\"", "")%>" 
                        href="closeoutm.aspx?ID=<%# Eval("ManufacturerID")%>">
                        <img height="60" width="60" src="http://www.skateparkoftampa.com/spot/productimages/<%# Eval("ManufacturerID")%>mfgrthumb.jpg" title="<%#Eval("Name").ToString().Replace("\"", "")%>" />
                        </a>
                    </div>
                    <div class="NotesAndTips">
                        <a title="<%#Eval("Name").ToString().Replace("\"", "")%>" 
                        href="m.aspx?ID=<%# Eval("ManufacturerID")%>">
                        <%# Eval("Name")%>
                        </a>
                    </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
</asp:Content>


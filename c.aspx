<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="c.aspx.cs" Inherits="c" %>
<%@ Register Src="control_categorylist.ascx" TagName="Categories" TagPrefix="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">


<meta name="description" content="Skateboarding <%=strTitle %>. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="Skateboarding <%=strTitle %> in stock at SPoT Skate Shop">
<meta itemprop="description" content="Skateboarding <%=strTitle %> in stock at SPoT Skate Shop. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg">
<meta property="og:title" content="<%=strTitle %> in stock at SPoT Skate Shop"/>
<meta property="og:type" content="product"/>
<meta property="og:image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="Skateboarding <%=strTitle %>. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>





</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">



<div class="BlogPost">
<h1><%=strTitle %> in Stock with Immediate Shipping</h1>

    <asp:SqlDataSource runat="server" ID="sdsPages" SelectCommand="SPOT2012CategoryProductsNumberOfPages" ConnectionString="<%$ConnectionStrings:CS %>"
        SelectCommandType="StoredProcedure" EnableCaching="true" CacheDuration="10000">
    <SelectParameters><asp:QueryStringParameter Name="CategoryID" QueryStringField="ID" /></SelectParameters> 
    </asp:SqlDataSource>
    <asp:Repeater runat="server" ID="rptPages" DataSourceID="sdsPages">
    <HeaderTemplate>
        <div class="ProductPager">
            <span>
    </HeaderTemplate>
    <ItemTemplate>
                <a class="NewArrivalsPagesLink" href="c.aspx?ID=<%=Request.QueryString["ID"] %>&P=<%#Eval("PageNumber") %>"><%#Eval("PageNumber") %></a>
    </ItemTemplate>
    <FooterTemplate>
            </span>
        </div>
    </FooterTemplate>
    </asp:Repeater>





    <div id="NewArrivals">
        <asp:SqlDataSource runat="server" ID="sdsNew"
            SelectCommand="SPOT2012CategoryProductsNewArrivalsPaged" SelectCommandType="StoredProcedure"
            ConnectionString="<%$ ConnectionStrings:CS %>"
            EnableCaching="true" CacheDuration="600">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="ID" Name="CategoryID" />
                <asp:QueryStringParameter QueryStringField="P" Name="Page" DefaultValue="1" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Repeater ID="rptNew" DataSourceID="sdsNew" runat="server">
        <ItemTemplate>
                <div class="col-xs-6 col-sm-4 ProductBlock">
                
                    <a 
                    title="<%#Eval("Name").ToString().Replace("\"", "") %> <%#Eval("Color").ToString().Replace("\"", "") %> <%#Eval("ShortDescr").ToString().Replace("\"", "") %>" 
                    href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>"><img class="img-responsive img-center"
                        title="<%#Eval("Name").ToString().Replace("\"", "") %> <%#Eval("Color").ToString().Replace("\"", "") %> <%#Eval("ShortDescr").ToString().Replace("\"", "") %>" width="190" height="190" 
                        src="http://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>productimages/colors/<%#Eval("ColorID") %>_<%#Eval("ProductID") %>.jpg" /></a>
                
                    <div class="ProductBlockText">
                    <a 
                    title="<%#Eval("Name").ToString().Replace("\"", "") %> <%#Eval("Color").ToString().Replace("\"", "") %> <%#Eval("ShortDescr").ToString().Replace("\"", "") %>" 
                    href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>">
                        <%#Eval("Name")%> 
                        <%#Eval("ShortDescr")%> <%#Eval("Color")%></a> <br /><span class="price"> <%#Eval("CurrentPrice", "{0:c}")%></span>
                    </div>
                    <div class="ProductBlockTextAlert">
                        <%#Eval("SaleNote") %> <%#Eval("FreeShippingNote") %>
                        <%#Eval("InShopOnly")%>
                    </div>

                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    
    <div id="loadmoreajaxloader" class="BlogPost" style="clear:both; text-align:center; display:none;"><img src="ajaxloadingmore.gif" /> Loading More... <img src="ajaxloadingmore.gif" /></div>




<asp:Repeater runat="server" ID="rptPages2" DataSourceID="sdsPages">
<HeaderTemplate>
    <div class="ProductPager">
    More New <%=strTitle %>: 
        <span>
</HeaderTemplate>
<ItemTemplate>
            <a class="NewArrivalsPagesLink" href="c.aspx?ID=<%=Request.QueryString["ID"] %>&P=<%#Eval("PageNumber") %>"><%#Eval("PageNumber") %></a>
</ItemTemplate>
<FooterTemplate>
        </span>
    </div>
</FooterTemplate>
</asp:Repeater>


</div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

<asp:Panel runat="server" ID="pnlSizePriceLinks">
    <div class="BlogPost">
        <ul>
            <li><a href="cz.aspx?ID=<%=Request.QueryString["ID"] %>">View <%=strTitle %> by Size</a></li>
        </ul>
    </div>
</asp:Panel>

<asp:Panel runat="server" ID="pnlShoeSizes" Visible="false">
    <div class="BlogPost">

        <h2><a href="shoe.aspx">What's Your Shoe Size?</a></h2>

            <div class="row">
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=6">5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=7">5.5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=8">6</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=9">6.5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=10">7</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=11">7.5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=12">8</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=13">8.5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=14">9</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=15">9.5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=16">10</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=17">10.5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=18">11</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=19">11.5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=20">12</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=22">13</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=24">14</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a href="cz.aspx?ID=7&SID=26">15</a></div></div>
        </div>



    </div>
</asp:Panel>
        



<Products:Categories runat="server" />



<asp:SqlDataSource runat="server" ID="sdsBrands" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012CategoryBrandSummary" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="6000">
    <SelectParameters>
        <asp:QueryStringParameter Name="CategoryID" QueryStringField="ID" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:Repeater ID="dlBrands" runat="server"
    DataSourceID="sdsBrands">
    <HeaderTemplate>
        
        <div class="BlogPost">
        <h1><%=strTitle %> in Stock Now:</h1>
    </HeaderTemplate>
    <ItemTemplate>
        <div class="col-xs-6 col-sm-4 NewArrivalSmallBlock">
            <div>
                <a title="<%#Eval("Name").ToString().Replace("\"", "")%> <%=strTitle %>" 
                href="m.aspx?ID=<%# Eval("ManufacturerID")%>">
                <img height="60" width="60" class="img-responsive img-center" src="http://www.skateparkoftampa.com/spot/productimages/<%# Eval("ManufacturerID")%>mfgrthumb.jpg" title="<%#Eval("Name").ToString().Replace("\"", "")%> <%=strTitle %>" />
                </a>
            </div>
            <div class="NotesAndTips">
                <a title="<%#Eval("Name").ToString().Replace("\"", "")%> <%=strTitle %>" 
                href="m.aspx?ID=<%# Eval("ManufacturerID")%>">
                <%# Eval("Name")%>
                </a>
            </div>
        </div>
    </ItemTemplate>
    <FooterTemplate>
        </div>
    </FooterTemplate>
</asp:Repeater>






</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="cat.aspx.cs" Inherits="cat" %>
<%@ Register Src="control_categorylist.ascx" TagName="Categories" TagPrefix="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="New skateboarding shoes and gear at Skatepark of Tampa.  All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="New Shoes and Skateboarding Stuff at SPoT Skate Shop">
<meta itemprop="description" content="New skateboarding shoes and gear at Skatepark of Tampa.  All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="http://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>images3/circlecity450.jpg">

<meta property="og:title" content="New Shoes and Skateboarding Stuff at SPoT Skate Shop"/>
<meta property="og:type" content="products"/>
<meta property="og:image" content="http://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>images3/circlecity450.jpg"/>
<meta property="og:site_name" content="New Shoes and Skateboarding Stuff at SPoT Skate Shop"/>
<meta property="og:description" content="New skateboarding shoes and gear at Skatepark of Tampa.  All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response."/>


<script language="javascript" type="text/javascript">

    $(document).ready(function () {
        $(".Page<%=Request.QueryString["P"]%>").css("color", "green");
    });

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">

<h1>New Arrivals In Stock With Immediate Shipping</h1>

<div class="BlogPost">

    <asp:SqlDataSource runat="server" ID="sdsPages" SelectCommand="SPOT2012NewArrivalsProductsNumberOfPages" ConnectionString="<%$ConnectionStrings:CS %>"
        SelectCommandType="StoredProcedure" EnableCaching="true" CacheDuration="600" />
    <asp:Repeater runat="server" ID="rptPages" DataSourceID="sdsPages">
    <HeaderTemplate>
        <div class="ProductPager">
        More: 
            <span>
    </HeaderTemplate>
    <ItemTemplate>
                <a class="NewArrivalsPagesLink Page<%#Eval("PageNumber") %>" href="cat.aspx?P=<%#Eval("PageNumber") %>"><%#Eval("PageNumber") %></a>
    </ItemTemplate>
    <FooterTemplate>
            </span>
        </div>
    </FooterTemplate>
    </asp:Repeater>





    <div id="NewArrivals">
        <asp:SqlDataSource runat="server" ID="sdsNew"
            SelectCommand="SPOT2012NewArrivalsProductsNewArrivalsPaged" SelectCommandType="StoredProcedure"
            ConnectionString="<%$ ConnectionStrings:CS %>"
            EnableCaching="true" CacheDuration="600">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="P" Name="Page" DefaultValue="1" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Repeater ID="rptNew" DataSourceID="sdsNew" runat="server">
        <ItemTemplate>
                <div class="col-xs-12 col-sm-6 col-md-4 ProductBlock">
                
                    <a 
                    title="<%#Eval("Name").ToString().Replace("\"", "") %> <%#Eval("Color").ToString().Replace("\"", "") %> <%#Eval("ShortDescr").ToString().Replace("\"", "") %>"
                    href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>"><img 
                        title="<%#Eval("Name").ToString().Replace("\"", "") %> <%#Eval("Color").ToString().Replace("\"", "") %> <%#Eval("ShortDescr").ToString().Replace("\"", "") %>" width="190" height="190" 
                        src="http://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>productimages/colors/<%#Eval("ColorID") %>_<%#Eval("ProductID") %>.jpg" /></a>
                
                    <div class="ProductBlockText">
                        <a 
                            title="<%#Eval("Name").ToString().Replace("\"", "") %> <%#Eval("Color").ToString().Replace("\"", "") %> <%#Eval("ShortDescr").ToString().Replace("\"", "") %>"
                            href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>">
                        <%#Eval("Name")%> 
                        <%#Eval("ShortDescr")%> <%#Eval("Color")%></a><br /> <%#Eval("CurrentPrice", "{0:c}")%>
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
        More: 
            <span>
    </HeaderTemplate>
    <ItemTemplate>
                <a class="NewArrivalsPagesLink Page<%#Eval("PageNumber") %>" href="cat.aspx?P=<%#Eval("PageNumber") %>"><%#Eval("PageNumber") %></a>
    </ItemTemplate>
    <FooterTemplate>
            </span>
        </div>
    </FooterTemplate>
    </asp:Repeater>
    
    <div class="BlogPost">
    <h1>More Product Categories</h1>

    <asp:SqlDataSource runat="server" ID="sdsFlagsMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012ProductFlagList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="10000" />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsFlagsMenu">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <div style="font-size:.8em; float:left; margin-right: 20px;">
            <a title="<%# Eval("SearchTextDescription").ToString().Replace("\"", "")%>" 
	            href="f.aspx?ID=<%# Eval("FlagID")%>">
                <%# Eval("Description")%>
            </a>
            </div>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </asp:Repeater>
</div>

</div>



</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

<h1><a href="shoe.aspx">What's Your Shoe Size?</a></h1>
<div class="BlogPost ShoeSizeGrid">
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

<Products:Categories runat="server" />


<div class="BlogPost">

<form 
action="http://feedburner.google.com/fb/a/mailverify" method="post" target="popupwindow" 
onsubmit="window.open('http://feedburner.google.com/fb/a/mailverify?uri=SPoTNewShoes&loc=en_US', 'popupwindow', 'scrollbars=yes,width=550,height=520');return true">
<h2 style="line-height:100%;">Get New Shoes Notifications</h2>
</br>
Enter your email: <input type="text" style="width:200px; font-size:18px; font-weight:bold;" name="email"/> <input type="hidden" value="spotnewshoes" name="uri"/><input type="hidden" name="loc" value="en_US"/><input style="margin-top:2px; font-size:18px; font-weight:bold;" type="submit" value="Subscribe" />

<div>
We will send you a summary of all new shoes
we've received for the day so you can come up before they're sold out.
</div>

</br>

<a href="https://feedburner.google.com/fb/a/mailverify?uri=SPoTNewShoes&amp;loc=en_US"><img src="http://feeds.feedburner.com/~fc/SPoTNewShoes?bg=FF3300&amp;fg=FFFFFF&amp;anim=0" height="26" width="88" style="border:0;" alt="" /></a>

</form>

</div>


<div class="BlogPost">

<form 
action="http://feedburner.google.com/fb/a/mailverify" method="post" target="popupwindow" 
onsubmit="window.open('https://feedburner.google.com/fb/a/mailverify?uri=SPoTNewProducts&amp;loc=en_US', 'popupwindow', 'scrollbars=yes,width=550,height=520');return true">
<h2 style="line-height:100%;">Get New Product Notifications</h2>
</br>
Enter your email: <input type="text" style="width:200px; font-size:18px; font-weight:bold;" name="email"/> <input type="hidden" value="spotnewproducts" name="uri"/><input type="hidden" name="loc" value="en_US"/><input style="margin-top:2px; font-size:18px; font-weight:bold;" type="submit" value="Subscribe" />
<div>
    We are constantly getting new products in. Stay on top of them by subscribing here.
</div>

</br>

<a href="https://feedburner.google.com/fb/a/mailverify?uri=SPoTNewProducts&amp;loc=en_US"><img src="http://feeds.feedburner.com/~fc/spotnewproducts?bg=FF3300&amp;fg=FFFFFF&amp;anim=0" height="26" width="88" style="border:0;" alt="" /></a>

</form>

</div>



<div class="BlogPost">
<div class="Ollie">
<h2 style="text-transform:none;">STALK US ON SOCIAL MEDIA @SPoTTAMPA</h2>
</br>
<a target="_blank" href="http://facebook.com/spottampa">
<img  src="http://skateparkoftampa.com/spot/images3/FACEBOOK-ICON.png" />
</a>
<a target="_blank" href="http://twitter.com/spottampa">
<img  src="http://skateparkoftampa.com/spot/images3/TWIT-ICON.png" />
</a>
<a target="_blank" href="http://instagram.com/spottampa">
<img  src="http://skateparkoftampa.com/spot/images3/INSTA-ICON.png" />
</a>
<a target="_blank" href="http://youtube.com/spottampa">
<img  src="http://skateparkoftampa.com/spot/images3/YOUTUBE-ICON.png" />
</a>

<img  src="http://skateparkoftampa.com/spot/images3/SNAP-ICON.png" />

</div>
</div>




</asp:Content>


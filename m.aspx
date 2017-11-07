<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="m.aspx.cs" Inherits="m" %>
<%@ Register Src="control_categorylist.ascx" TagName="Categories" TagPrefix="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">


<meta name="description" content="<%=strName %> All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="<%=strName %> in stock at SPoT Skate Shop">
<meta itemprop="description" content="<%=strName %> in stock at SPoT Skate Shop. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="<%=strImageURL %>">
<meta property="og:title" content="<%=strName %> in stock at SPoT Skate Shop"/>
<meta property="og:type" content="product"/>
<meta property="og:image" content="<%=strImageURL %>"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="<%=strName %> All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>

<script language="javascript" type="text/javascript">

    $(document).ready(function () {
        $(".Page<%=Request.QueryString["P"]%>").css("color", "green");

    });

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">


<div class="BlogPost">

<div style="float:right; padding-top:9px;">
        <span class="counter-fb-like">
            <iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fskateparkoftampa.com%2Fspot%2Fm.aspx%3FID%3D<%=Request.QueryString["ID"] %>&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21&amp;appId=128422270572394" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:100px; height:21px;" allowTransparency="true"></iframe>
        </span>
        <span class="counter-twitter">
            <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://skateparkoftampa.com/spot/m.aspx?ID=<%=Request.QueryString["ID"] %>" data-count="horizontal" data-via="SPoTTampa">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
        </span>
</div>

<h1><%=strName %> Products in Stock Now</h1>
    
<%if (strName.Equals("Lakai"))
    { %>
     <img src="http://www.skateparkoftampa.com/spot/images3/RILEY_HAWK_leaderboard.jpg" />
    <%} %>
    
 <!--<%if (strName.Equals("Supra"))
    { %>
    <img src="http://skateparkoftampa.com/spot/images3/supraxshakejunt.jpg" />
    <%} %>-->
   <!-- <%if (strName.Equals("Matix"))
    { %>
    <img src="http://skateparkoftampa.com/spot/images3/MATIX-HEADPHONES-aug14.jpg" />
    <%} %>-->
    <%if (strName.Equals("New Balance Numeric"))
    { %>
<div style="width:600px; height=390px">
<div class="Ollie">
   <iframe src="https://player.vimeo.com/video/140447838?title=0&byline=0&portrait=0" width="500" height="219" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> 
</div>
</div>
    <%} %>  
    <%if (strName.Equals("Anti-Hero"))
    { %>
    <img src="http://www.skateparkoftampa.com/spot/images3/AntiHero_600x150.gif" />
    <%} %>  
   <%if (strName.Equals("Volcom"))
    { %>
    <img src="http://www.skateparkoftampa.com/spot/images3/AntiHero_600x150.gif" />
    <%} %>
<%if (strName.Equals("Converse"))
    { %>
    <img src="http://www.skateparkoftampa.com/spot/images3/CONS_FY18_SKATEPARKOFTAMPA_600x150_WO_CTA.jpg" />    <%} %>
<%if (strName.Equals("Theories"))
    { %>
    <img src="http://www.skateparkoftampa.com/spot/images3/SpotTheoriesBanner.jpg" />
    <%} %> 
<%if (strName.Equals("Hopps"))
    { %>
    <img src="http://www.skateparkoftampa.com/spot/images3/SpotHoppsBanner.jpg" />
    <%} %>             
<%if (strName.Equals("Magenta"))
    { %>
    <img src="http://www.skateparkoftampa.com/spot/images3/SpotMagentaBanner.jpg" />
    <%} %>            
<%if (strName.Equals("Isle"))
    { %>
    <img src="http://www.skateparkoftampa.com/spot/images3/SpotIsleBanner.jpg" />
    <%} %>    
<%if (strName.Equals("Polar Skateboards"))
    { %>
    <img src="http://www.skateparkoftampa.com/spot/images3/SpotPolarBanner.jpg" />
    <%} %>             
<%if (strName.Equals("Traffic Skateboards"))
    { %>
    <img src="http://www.skateparkoftampa.com/spot/images3/SpotTrafficBanner.jpg" />
    <%} %>             
<%if (strName.Equals("Spitfire"))
    { %>
     <img src="http://www.skateparkoftampa.com/spot/images3/spotfire.jpg" />  
   <%} %>
<%if (strName.Equals("Skatepark of Tampa"))
    { %>
     <img src="http://www.skateparkoftampa.com/spot/images3/spotfire.jpg" />
<%} %>
<%if (strName.Equals("Alien Workshop"))
    { %>
     <img src="http://www.skateparkoftampa.com/spot/images3/aw-banner16.png" />
<%} %> 

<%if (strName.Equals("Emerica"))
    { %>
     <img src="http://www.skateparkoftampa.com/spot/images3/em-WinoG6-SPoT600x150.jpg" />

<%} %> 
<%if (strName.Equals("Glassy Sunglasses"))
    { %>
     <img src="http://www.skateparkoftampa.com/spot/images3/skatewarehouse banner2.jpg" />
<%} %>  
<%if (strName.Equals("eS Footwear"))
    { %>
     <img src="http://www.skateparkoftampa.com/spot/images3/eS_SPOT_BANNER_NAUTICAL_F.jpg" />
<%} %>  


  
    
<asp:SqlDataSource runat="server" ID="sdsPages" SelectCommand="SPOT2012ManufacturerProductsNumberOfPages" ConnectionString="<%$ConnectionStrings:CS %>"
    SelectCommandType="StoredProcedure" EnableCaching="true" CacheDuration="2000">
<SelectParameters><asp:QueryStringParameter Name="ManufacturerID" QueryStringField="ID" /></SelectParameters> 
</asp:SqlDataSource>
<asp:Repeater runat="server" ID="rptPages" DataSourceID="sdsPages">
<HeaderTemplate>
    <div class="ProductPager">
    
        <span>
</HeaderTemplate>
<ItemTemplate>
            <a class="NewArrivalsPagesLink Page<%#Eval("PageNumber") %>" href="m.aspx?ID=<%=Request.QueryString["ID"] %>&P=<%#Eval("PageNumber") %>"><%#Eval("PageNumber") %></a>
</ItemTemplate>
<FooterTemplate>
        </span>
    </div>
</FooterTemplate>
</asp:Repeater>

    <div id="NewArrivals">
        <asp:SqlDataSource runat="server" ID="sdsNew"
        SelectCommand="SPOT2012ManufacturerProductsPaged" SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:CS %>"
        EnableCaching="true" CacheDuration="1000">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="ID" Name="ManufacturerID" />
            <asp:QueryStringParameter QueryStringField="P" Name="Page" DefaultValue="1" />
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
    More Stuff From <%=strName %>: 
        <span>
</HeaderTemplate>
<ItemTemplate>
            <a class="NewArrivalsPagesLink Page<%#Eval("PageNumber") %>" href="m.aspx?ID=<%=Request.QueryString["ID"] %>&P=<%#Eval("PageNumber") %>"><%#Eval("PageNumber") %></a>
</ItemTemplate>
<FooterTemplate>
        </span>
    </div>
</FooterTemplate>
</asp:Repeater>


    <div id="loadmoreajaxloader" class="BlogPost" style="clear:both; text-align:center; display:none;"><img src="ajaxloadingmore.gif" /> Loading More... <img src="ajaxloadingmore.gif" /></div>



</div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">


<asp:Panel runat="server" ID="pnlVans" Visible="false">
<div class="BlogPost ShoeSizeGrid">
<div style="float:left; padding: 2px; text-align:center;">
    <a href="ms.aspx?ID=<%=Request.QueryString["ID"] %>&SBID=1">
    <img src="http://skateparkoftampa.com/spot/images3/vanssubclassic.gif" />
    <br />
    Classics
    </a>
</div>

<div style="float:left; padding: 2px; text-align:center;">
    <a href="ms.aspx?ID=<%=Request.QueryString["ID"] %>&SBID=2">
    <img src="http://skateparkoftampa.com/spot/images3/vanssubcore.gif" />
    <br />
    Pro Skate
    </a>
</div>

<div style="float:left; padding: 2px; text-align:center;">
    <a href="ms.aspx?ID=<%=Request.QueryString["ID"] %>&SBID=3">
    <img src="http://skateparkoftampa.com/spot/images3/vanssubotw.gif" />
    <br />
    OTW
    </a>
</div>

<div style="float:left; padding: 2px; text-align:center;">
    <a href="ms.aspx?ID=<%=Request.QueryString["ID"] %>&SBID=4">
    <img src="http://skateparkoftampa.com/spot/images3/vanssubsurf.gif" />
    <br />
    Surf
    </a>
</div>

<div style="float:left; padding: 2px; text-align:center;">
    <a href="ms.aspx?ID=<%=Request.QueryString["ID"] %>&SBID=5">
    <img src="http://skateparkoftampa.com/spot/images3/vanssubwomen.gif" />
    <br />
    Womens
    </a>
</div>

<div style="float:left; padding: 2px; text-align:center;">
    <a href="ms.aspx?ID=<%=Request.QueryString["ID"] %>&SBID=7">
    <img src="http://skateparkoftampa.com/spot/images3/vanssubcaliforniacollection.gif" />
    <br />
    California<br />Collection
    </a>
</div>

</div>

</asp:Panel>




<asp:Panel runat="server" ID="pnlNike" Visible="false">

<div class="BlogPost ShoeSizeGrid">



<asp:SqlDataSource runat="server" ID="sdsSubBrandList" SelectCommand="SPOT2012SubbrandList" SelectCommandType="StoredProcedure"
 ConnectionString="<%$ConnectionStrings:CS %>">
<SelectParameters><asp:QueryStringParameter Name="ManufacturerID" QueryStringField="ID" /></SelectParameters>
</asp:SqlDataSource>

<asp:Repeater runat="server" ID="rptSubBrandList" DataSourceID="sdsSubBrandList">
<ItemTemplate>
<div style="width:75px; font-size:.7em; float:left; margin: 3px 5px 3px 5px; border: 1px solid black; text-align:center;">
    <div>
    <a title="<%=strName %> <%#Eval("Description") %>" 
        href="ms.aspx?ID=<%=Request.QueryString["ID"] %>&SBID=<%#Eval("SubBrandID") %>">
    <img src="/spot/subbrandicons/<%#Eval("SubBrandID") %>.jpg" />
    </a></div>
    <a title="<%=strName %> <%#Eval("Description") %>" 
        href="ms.aspx?ID=<%=Request.QueryString["ID"] %>&SBID=<%#Eval("SubBrandID") %>"><%#Eval("Description") %></a> 
</div>
</ItemTemplate>
<FooterTemplate><div style="clear:both;"></div></FooterTemplate>
</asp:Repeater>

</div>

</asp:Panel>



<asp:SqlDataSource runat="server" ID="sdsCategories" SelectCommand="SPOT2012ManufacturerCategories"  EnableCaching="true" CacheDuration="10000" 
    SelectCommandType="StoredProcedure" ConnectionString="<%$ConnectionStrings:CS %>">
<SelectParameters>
    <asp:QueryStringParameter Name="ManufacturerID" QueryStringField="ID" />
</SelectParameters>
</asp:SqlDataSource>
<asp:Repeater runat="server" id="rptCategories" DataSourceID="sdsCategories">
<HeaderTemplate>
    <div class="BlogPost">
    <h1><%=strName %></h1>
    <img title="<%=strName %>" alt="<%=strName %>" src="<%=strImageURL %>" style="width:280px;" />
              <div>
                    <span class="counter-fb-like">
                        <iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fskateparkoftampa.com%2Fspot%2Fm.aspx%3FID%3D<%=Request.QueryString["ID"] %>&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21&amp;appId=128422270572394" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:80px; height:21px;" allowTransparency="true"></iframe>
                    </span>
                    <span class="counter-twitter">
                        <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://skateparkoftampa.com/spot/m.aspx?ID=<%=Request.QueryString["ID"] %>" data-count="horizontal" data-via="SPoTTampa">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
                    </span>
            </div>
    </div>
    <div class="BlogPost">
        <h1><%=strName %> Categories</h1>
        <ul>
</HeaderTemplate>
<ItemTemplate>
        <li>
            <a title="<%=strName %> <%#Eval("Description") %>" 
                href="cm.aspx?M=<%=Request.QueryString["ID"] %>&C=<%#Eval("CategoryID") %>"><%#Eval("Description") %></a>
        </li>
</ItemTemplate>
<FooterTemplate>
        </ul>
    </div>
</FooterTemplate>
</asp:Repeater>

<%if (strName.Equals("NEFF")){ %>
    <div class="BlogPost">
        <h1>Get Hooked Up!</h1>
            <img src="http://skateparkoftampa.com/spot/images2011/neff.jpg"/>
    </div>
<%}%>

<div class="BlogPost">
<h1>Related Links</h1>

    <ul>
        <li><a href="/staff">Meet the SPoT Staff</a>
            <div class="NotesAndTips">
            We've been here since 1993. 
            Meet the crew that does everything from coding the website to packing and shipping your order.
            It's a nice list of skate nerds.</div>
        </li>
        <!--
        <li>
            <a href="/feedback">Customer Feedback</a>
            <div class="NotesAndTips">
                Check our feedback to see what other customers have been saying for years. We've been giving great service online for over 10 years. You can find a long list of our real customer testimonials here.
            </div>
        </li>
        -->
        
    </ul>
</div>



<Products:Categories runat="server" />


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


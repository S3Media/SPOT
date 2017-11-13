<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="skresult.aspx.cs" Inherits="skresult" %>
<%@ Register Src="control_NewArrivals.ascx" TagName="NewArrivals" TagPrefix="Products" %>
<%@ OutputCache Duration="500" VaryByParam="ID" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="<%=strTitle %>: skateboarding contest results. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="<%=strTitle %> Results at Skatepark of Tampa.com">
<meta itemprop="description" content="<%=strTitle %> Results at Skatepark of Tampa.com.  Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">

<asp:SqlDataSource runat="server" id="sdsMug" ConnectionString="<%$ConnectionStrings:CS %>" SelectCommand="SPOT2012ContestResultsFirstPlaceImage" SelectCommandType="StoredProcedure" EnableCaching="true" CacheDuration="5000">
<SelectParameters><asp:QueryStringParameter name="EventID" QueryStringField="ID" /></SelectParameters> 
</asp:SqlDataSource>
<asp:Repeater runat="server" DataSourceID="sdsMug">
<ItemTemplate>
<meta itemprop="image" content="<%#Eval("Mugshot") %>">
<meta property="og:image" content="<%#Eval("Mugshot") %>"/>
</ItemTemplate>
</asp:Repeater>

<meta property="og:title" content="<%=strTitle %> Results at Skatepark of Tampa.com"/>
<meta property="og:type" content="article"/>

<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="<%=strTitle %> Results at Skatepark of Tampa.com.  Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">


<h1><%=strTitle %> Results</h1>

<div class="PostMediaStrip" style="border-bottom: solid 2px black;margin: 10px 0px 5px 0px;">
    <div class="PostMediaStripSub">
        <div class="col-xs-3">
            <span class="counter-fb-like">
                <iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fskateparkoftampa.com%2Fspot%2Fskresult.aspx%3FID%3D<%=Request["ID"] %>&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21&amp;appId=128422270572394" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:80px; height:21px;" allowTransparency="true"></iframe>
            </span>
            </div>
            <div class="col-xs-3">
            <span class="counter-twitter">
                <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://skateparkoftampa.com/spot/skresult.aspx?ID=<%=Request["ID"] %>" data-count="horizontal" data-via="SPoTTampa">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
            </span>
                </div>
            <div class="col-xs-3">
                    
            <span class="counter-google-one">
                <g:plusone size="medium" href="http://skateparkoftampa.com/spot/skresult.aspx?ID=<%=Request["ID"] %>"></g:plusone>
            </span>
                </div>
            <div class="col-xs-3">
            <span class="counter-stumble">
                <script src="http://www.stumbleupon.com/hostedbadge.php?s=3&r=http://skateparkoftampa.com/spot/skresult.aspx?ID=<%=Request["ID"] %>"></script>
            </span>
                </div>

    </div>
</div>


<asp:Repeater runat="server" ID="rptList" OnItemDataBound="rptList_ItemDataBound">
        
<ItemTemplate>
<div class="BlogPost skater-results">
    <h1>
        <a href="/skater/<%#Eval("SkaterID") %>/<%#Eval("FirstName").ToString().Replace("\"", "").Replace(" ", "_") %>_<%#Eval("LastName").ToString().Replace("\"", "").Replace(" ", "_") %>"
             title="<%# Eval("FirstName").ToString().Replace("\"", "") %> <%# Eval("LastName").ToString().Replace("\"", "") %> Skateboarding Profile">
            <%# DataBinder.Eval(Container.DataItem, "Place")%>: <%# DataBinder.Eval(Container.DataItem, "FirstName")%> <%# DataBinder.Eval(Container.DataItem, "LastName")%>
        </a>
    </h1>
    <div class="row">
        <div class="col-sm-5">
    <a title="<%# Eval("FirstName").ToString().Replace("\"", "") %> <%# Eval("LastName").ToString().Replace("\"", "") %> Skateboarding Profile" href="/skater/<%#Eval("SkaterID") %>/<%#Eval("FirstName").ToString().Replace("\"", "").Replace(" ", "_") %>_<%#Eval("LastName").ToString().Replace("\"", "").Replace(" ", "_") %>">
    <img class="img-responsive img-center" alt="<%# Eval("FirstName").ToString().Replace("\"", "") %> <%# Eval("LastName").ToString().Replace("\"", "") %>" 
    src="<%# DataBinder.Eval(Container.DataItem, "MugShot")%>"  style="margin-bottom: 10px;"/></a>
    

    <div>
        <iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fskateparkoftampa.com%2Fspot%2Fsk.aspx%3FID%3D<%#Eval("SkaterID") %>&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21&amp;appId=128422270572394" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:80px; height:21px;" allowTransparency="true"></iframe>
    </div>
            </div>
        <div class="col-sm-7">
    Sponsors: <%# DataBinder.Eval(Container.DataItem, "Sponsors")%><br />
    Hometown: <%# DataBinder.Eval(Container.DataItem, "City")%> <%# DataBinder.Eval(Container.DataItem, "State")%><br />
    Notes: <%# DataBinder.Eval(Container.DataItem, "Notes")%><br />
    <asp:Repeater runat="server" ID="rptProducts">
        <ItemTemplate>
            
            <div>
                <a href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>">
                    <img title="<%#Eval("ShortDescr").ToString().Replace("\"", "")%> <%#Eval("Color").ToString().Replace("\"", "")%>" 
                        alt="<%#Eval("ShortDescr").ToString().Replace("\"", "")%> <%#Eval("Color").ToString().Replace("\"", "")%>" 
                        src="<%#Eval("ImageURL") %>"  />
                </a>
            
            <a title="<%#Eval("ShortDescr").ToString().Replace("\"", "")%> <%#Eval("Color").ToString().Replace("\"", "")%>" 
                href="/product/<%#Eval("ProductID") %>/<%#Eval("Name").ToString().Replace("\"", "").Replace(" ", "_") %>_<%#Eval("Color").ToString().Replace("\"", "").Replace(" ", "_").Replace("/", "") %>_<%#Eval("ShortDescr").ToString().Replace("\"", "").Replace(" ", "_") %>/&CID=<%#Eval("ColorID") %>">
                <%#Eval("ShortDescr")%> <%#Eval("CurrentPrice", "{0:c}")%></a>
                <div><%#Eval("SaleNote") %> <%#Eval("FreeShippingNote") %> <%#Eval("InShopOnly")%></div> 
            
            </div>
           
            
        </ItemTemplate>
    </asp:Repeater>
</div>
        </div>
    </div>
</ItemTemplate>
</asp:Repeater>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

<div class="BlogPost">
    <a href="http://itunes.apple.com/us/app/spot-skate-nerd/id544443560?ls=1&mt=8" target="_blank">
        <img class="img-responsive img-center" title="Skatepark of Tampa iPhone App, SPoT Skate Nerd" src="images3/spot_skate_nerd_iphone_app.png" />
    </a>
</div>


<h2>Comments About <%=strTitle %> Results</h2>
<div class="BlogPost">
    <div id="fb-root"></div><script src="http://connect.facebook.net/en_US/all.js#appId=106807979370947&amp;xfbml=1"></script><fb:comments href="http://www.skateparkoftampa.com/spot/skresult.aspx?ID=<%=Request.QueryString["ID"] %>" num_posts="5" width="100%"></fb:comments>							
</div>				


<Products:NewArrivals ID="NewArrivals1" runat="server" />

<h1>Products in Stock Now</h1>
<div class="BlogPost">
    <asp:SqlDataSource runat="server" ID="sdsCategoryMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012CategoryList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="1000" />
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
<h1>More Product Categories</h1>
<div class="BlogPost">
    <asp:SqlDataSource runat="server" ID="sdsFlagsMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012ProductFlagList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="1000" />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsFlagsMenu">
        <HeaderTemplate><ul></HeaderTemplate>
        <ItemTemplate>
            <li>
            <a title="<%# Eval("SearchTextDescription").ToString().Replace("\"", "")%>" 
	            href="f.aspx?ID=<%# Eval("FlagID")%>">
                <%# Eval("Description")%>
            </a>
            </li>
        </ItemTemplate>
        <FooterTemplate></ul></FooterTemplate>
    </asp:Repeater>
</div>

    </div>

</asp:Content>


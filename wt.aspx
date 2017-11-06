<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="wt.aspx.cs" Inherits="wt" %>
<%@ Register Src="control_WhatUpTagSummary.ascx" TagName="Summary" TagPrefix="WhatsNew" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="<%=strTitle %>: Blog Posts at SPoT. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="<%=strTitle %>: Blog Posts at SPoT">
<meta itemprop="description" content="<%=strTitle %>: Blog Posts at SPoT. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="<%=strTitle %>: Blog Posts at SPoT"/>
<meta property="og:type" content="post"/>
<meta property="og:image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="<%=strTitle %>: Blog Posts at SPoT. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>



<script src="jquery.masonry.min.js" type="text/javascript"></script>
<script src="jquery.imagesloaded.min"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">


<asp:SqlDataSource runat="server" ID="sdsWhatsUp" ConnectionString="<%$ConnectionStrings:CS %>" SelectCommandType="StoredProcedure"
 SelectCommand="SPOT2012WhatsNewTagged" EnableCaching="true" CacheDuration="2000">
<SelectParameters>
    <asp:QueryStringParameter Name="WhatsNewTagID" QueryStringField="ID" DefaultValue="1" />
</SelectParameters> 
</asp:SqlDataSource>
<asp:Repeater runat="server" ID="rptWhatsUp" DataSourceID="sdsWhatsUp">
<HeaderTemplate>
<h1>What's Up Posts Tagged: <%=strTitle %></h1>
    <div class="row" id="MasonryWrapper">
</HeaderTemplate>
<ItemTemplate>
    <div class="col-sm-6">
<div class="BlogPost" style="height: 380px; margin-bottom:10px;">
    <h2><a href="w.aspx?ID=<%#Eval("WhatsNewID") %>"><%#Eval("Title") %></a></h2>
        <div>
            <a href="w.aspx?ID=<%#Eval("WhatsNewID") %>"><img src="<%#Eval("Icon") %>" /></a>
        </div>
        <h3 class="PostInfo">Posted by <%#Eval("PostedBy") %>, <%#Eval("DateAdded", "{0:D}") %> <%#Eval("DateAdded", "{0:t}") %></h3>
        
    </div>
    </div>
</ItemTemplate>
<FooterTemplate>
    </div>
</FooterTemplate>
</asp:Repeater>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">
<WhatsNew:Summary runat="server" />


<h1>Products in Stock Now</h1>
<div class="BlogPost CategoryListSmall">
    <asp:SqlDataSource runat="server" ID="sdsCategoryMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012CategoryList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="10000" />
    <asp:Repeater ID="rptCategories" runat="server" DataSourceID="sdsCategoryMenu">
        <ItemTemplate>
            | <a title="Skateboarding <%# Eval("Description")%>"
                href="c.aspx?ID=<%# Eval("CategoryID")%>">
                <%# Eval("Description") %>
            </a>
        </ItemTemplate>
        <FooterTemplate> | </FooterTemplate>
    </asp:Repeater>
</div>
<h1>Additional Products</h1>
<div class="BlogPost CategoryListSmall">
    <asp:SqlDataSource runat="server" ID="sdsFlagsMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOTSHOPProductGetFullFlagList" SelectCommandType="StoredProcedure"
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


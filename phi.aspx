﻿<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="phi.aspx.cs" Inherits="phi" %>
<%@ Register Src="control_NewArrivals.ascx" TagName="NewArrivals" TagPrefix="Products" %>
<%@ Register Src="control_WhatUpTagSummary.ascx" TagName="Summary" TagPrefix="WhatsNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="<%=strTitle %> photo at Skatepark of Tampa. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="<%=strTitle %> photo at SPoT">
<meta itemprop="description" content="<%=strTitle %> photo at Skatepark of Tampa.  All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="image" content="http://skateparkoftampa.com/spot/<%=strImageName %>">

<meta property="og:title" content="<%=strTitle %> photo at SPoT"/>
<meta property="og:type" content="article"/>
<meta property="og:image" content="http://skateparkoftampa.com/spot/<%=strImageName %>"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="<%=strTitle %> photo at Skatepark of Tampa. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">


<asp:Panel runat="server" ID="pnlImage">
<div class="BlogPost">
<h1 style="margin-bottom:0px; padding-bottom:0px;"><%=strTitle %></h1>
    <h3 class="PostInfo" style="margin:0px; padding:0px;">
        Posted on <%=dtDateAdded.ToLongDateString() %>. Photo by <%=strPhotoBy %>.
            <asp:SqlDataSource runat="server" ID="sdsCategories" ConnectionString="<%$ ConnectionStrings:CS %>"
            SelectCommand="SPOTImagesGetCategoryListingOnePhotoImageID" SelectCommandType="StoredProcedure" EnableCaching="true" CacheDuration="10000">
            <SelectParameters>
            <asp:QueryStringParameter Name="ImageID" QueryStringField="I" />
            </SelectParameters>
            </asp:SqlDataSource>
            <asp:Repeater runat="server" ID="rptCategories" DataSourceID="sdsCategories">
                <HeaderTemplate>Tags: </HeaderTemplate>
                <ItemTemplate>
                    [<a href="ph.aspx?CID=<%# Eval("CategoryID") %>&D=<%# Eval("CategoryDescription") %>"><%# Eval("CategoryDescription")%></a>]
                </ItemTemplate>
                <FooterTemplate></FooterTemplate>
            </asp:Repeater>
        <%=strRelatedStoryLink %>
    </h3>
    <div style="margin-bottom: 10px;">
        <%=strCaption %>
    </div>

    <div style="text-align:center;">
        <img class="img-responsive img-center" alt="<%=strTitle.Replace("\"", "") %>" title="<%=strTitle.Replace("\"", "") %>" src="<%=strImageName %>" />
    </div>
    
</div>


<div class="BlogPost">
<h1>Comments</h1>
    <div id="fb-root"></div><script src="http://connect.facebook.net/en_US/all.js#appId=106807979370947&amp;xfbml=1"></script><fb:comments href="http://www.skateparkoftampa.com/spot/phi.aspx?I=<%=Request.QueryString["I"] %>" num_posts="5" width="920"></fb:comments>							
</div>

</asp:Panel>

<form 
action="http://feedburner.google.com/fb/a/mailverify" method="post" target="popupwindow" 
onsubmit="window.open('http://feedburner.google.com/fb/a/mailverify?uri=spotwhatsup', 'popupwindow', 'scrollbars=yes,width=550,height=520');return true">
<h2>Subscribe to the SPoT What's Up Blog</h2>
Enter your email: <input type="text" style="width:200px; font-size:18px; font-weight:bold;" name="email"/> <input type="hidden" value="spotwhatsup" name="uri"/><input type="hidden" name="loc" value="en_US"/><input style="margin-top:2px; font-size:18px; font-weight:bold;" type="submit" value="Subscribe" />

<a href="http://feedburner.google.com/fb/a/mailverify?uri=spotwhatsup&loc=en_US"><img src="http://feeds.feedburner.com/~fc/spotwhatsup?bg=FF3300&amp;fg=FFFFFF&amp;anim=0" height="26" width="88" style="border:0; padding-left:30px;" alt="" /></a></form>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">
        <asp:SqlDataSource runat="server" ID="sdsSkaterProfile" SelectCommand="SPOT2012SkaterProfileForImage" SelectCommandType="StoredProcedure" 
    EnableCaching="true" CacheDuration="10000" ConnectionString="<%$ConnectionStrings:CS %>">
<SelectParameters>
    <asp:QueryStringParameter Name="ImageID" QueryStringField="I" />
</SelectParameters>
</asp:SqlDataSource>
<asp:Repeater ID="Repeater2" runat="server" DataSourceID="sdsSkaterProfile">
<HeaderTemplate></HeaderTemplate>
<ItemTemplate>
    
    <div class="BlogPost">
        <h2><a title="<%#Eval("SkaterName").ToString().Replace("\"", "") %> Skater Profile, Photos, News, Video, Coverage, and More" href="sk.aspx?ID=<%#Eval("SkaterID") %>"><%#Eval("SkaterName") %></a></h2>    
        <a title="<%#Eval("SkaterName").ToString().Replace("\"", "") %> Skater Profile, Photos, News, Video, Coverage, and More" href="sk.aspx?ID=<%#Eval("SkaterID") %>">
            <img class="img-responsive img-center" src="<%#Eval("MugShot") %>" alt="<%#Eval("SkaterName").ToString().Replace("\"", "") %> Photo" 
                title="<%#Eval("SkaterName").ToString().Replace("\"", "") %> Skater Profile, Photos, News, Video, Coverage, and More" />
        </a>
        <h3 style="text-align:center;"><%#Eval("Sponsors") %></h3>
    </div>
</ItemTemplate>
<FooterTemplate></FooterTemplate>
</asp:Repeater>

<Products:NewArrivals ID="NewArrivals1" runat="server" />



<div>
    <WhatsNew:Summary ID="Summary1" runat="server" />
</div>

    <div class="BlogPost">
    <h1>In Stock, Immediate Shipping</h1>
        <asp:SqlDataSource runat="server" ID="sdsFlagsMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
        SelectCommand="SPOT2012ProductFlagList" SelectCommandType="StoredProcedure"
        EnableCaching="true" CacheDuration="10000" />
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsFlagsMenu">
            <ItemTemplate>
                | <a title="<%# Eval("SearchTextDescription").ToString().Replace("\"", "")%>" 
	                href="f.aspx?ID=<%# Eval("FlagID")%>">
                    <%# Eval("Description")%>
                </a>
            </ItemTemplate>
            <FooterTemplate>|</FooterTemplate>
        </asp:Repeater>
    </div>




    <asp:SqlDataSource runat="server" ID="sdsRandom" SelectCommand="SPOT2012AdTextRandom"
	    SelectCommandType="StoredProcedure" ConnectionString="<%$ ConnectionStrings:CS %>" EnableCaching="true" CacheDuration="200" />
    <asp:Repeater runat="server" ID="rptRandom" DataSourceID="sdsRandom">
	    <HeaderTemplate> <div class="BlogPost HotLinks"><h1>Random Hot Links:</h1></HeaderTemplate>
	    <ItemTemplate>
		    | <a href="clickadtext.aspx?AdID=<%#Eval("AdID") %>"><%# DataBinder.Eval(Container.DataItem, "LinkText")%></a>
	    </ItemTemplate>
	    <FooterTemplate></div></FooterTemplate>
    </asp:Repeater>


</asp:Content>


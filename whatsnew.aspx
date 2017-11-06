<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="whatsnew.aspx.cs" Inherits="whatsnew" %>
<%@ Register Src="control_WhatUpTagSummary.ascx" TagName="Summary" TagPrefix="WhatsNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="What's Up Blog at Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="About Skatepark of Tampa">
<meta itemprop="description" content="What's Up Blog at Skatepark of Tampa. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="What's Up Blog at Skatepark of Tampa"/>
<meta property="og:type" content="company"/>
<meta property="og:image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="What's Up Blog at Skatepark of Tampa"/>
<meta property="og:description" content="What's Up Blog at Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>


<script src="jquery.masonry.min.js" type="text/javascript"></script>
<script src="jquery.imagesloaded.min"></script>
<script language="javascript" type="text/javascript">

    $(document).ready(function () {

        var $container = $('#MasonryWrapper');

        $container.imagesLoaded(function () {
            $container.masonry({
                itemSelector: '.BlogPost',
                columnWidth: 300
            });
        });


    });

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">

<asp:SqlDataSource runat="server" ID="sdsWhatsUp" ConnectionString="<%$ConnectionStrings:CS %>" SelectCommandType="StoredProcedure"
 SelectCommand="SPOT2012WhatsNewMonthPostsAll" EnableCaching="true" CacheDuration="4000">
<SelectParameters>
    <asp:QueryStringParameter Name="Year" QueryStringField="Year" />
    <asp:QueryStringParameter Name="Month" QueryStringField="Month" />
</SelectParameters>
</asp:SqlDataSource>
<asp:Repeater runat="server" ID="rptMonth" DataSourceID="sdsWhatsUp">
<HeaderTemplate><h1>What's Up Posts Made <%=Request.QueryString["Month"] %>/<%=Request.QueryString["Year"] %></h1>

    <div id="MasonryWrapper">

</HeaderTemplate>
<ItemTemplate>
<div class="BlogPost" style="width:255px; margin:10px; padding:10px;">
    <div>
        <a href="w.aspx?ID=<%#Eval("WhatsNewID") %>"><img src="<%#Eval("Icon") %>" /></a>
    </div>
    <h2 style="font-size:.9em;"><a href="w.aspx?ID=<%#Eval("WhatsNewID") %>"><%#Eval("Title") %></a></h2>
        <h3 class="PostInfo">Posted by <%#Eval("PostedBy") %><br /><%#Eval("DateAdded", "{0:D}") %></h3>
        
        
    </div>
</ItemTemplate>
<FooterTemplate>
    </div>
</FooterTemplate>
</asp:Repeater>


<h1>SPoT What's Up Blog</h1>
<div class="BlogPost">
    We've been posting daily banter to the What's Up Column here for over a decade now.  Select a year and month to see posts from that time.
</div>

<asp:SqlDataSource runat="server" ID="sdsYears" SelectCommand="SPOT2012WhatNewYearList" SelectCommandType="StoredProcedure"
 ConnectionString="<%$ConnectionStrings:CS %>" EnableCaching="true" CacheDuration="10000" />
<asp:Repeater runat="server" DataSourceID="sdsYears">
<HeaderTemplate><div class="BlogPost ShoeSizeGrid"></HeaderTemplate>
<ItemTemplate>
    <div class="ProductBlock" style="height:120px; width: 190px; border: solid 1px black; padding:3px; margin: 3px;">
    <h1><%#Eval("Year") %></h1>
    <div style="clear:both;">
        <div class="SizeSelectionGridItemSmall">
            <a href="whatsnew.aspx?Month=1&Year=<%#Eval("Year") %>">Jan</a>
        </div>
        <div class="SizeSelectionGridItemSmall">
            <a href="whatsnew.aspx?Month=2&Year=<%#Eval("Year") %>">Feb</a>
        </div>
        <div class="SizeSelectionGridItemSmall">
            <a href="whatsnew.aspx?Month=3&Year=<%#Eval("Year") %>">Mar</a>
        </div>
        <div class="SizeSelectionGridItemSmall">
            <a href="whatsnew.aspx?Month=4&Year=<%#Eval("Year") %>">Apr</a>
        </div>
        <div class="SizeSelectionGridItemSmall">
            <a href="whatsnew.aspx?Month=5&Year=<%#Eval("Year") %>">May</a>
        </div>
        <div class="SizeSelectionGridItemSmall">
            <a href="whatsnew.aspx?Month=6&Year=<%#Eval("Year") %>">Jun</a>
        </div>
        <div class="SizeSelectionGridItemSmall">
            <a href="whatsnew.aspx?Month=7&Year=<%#Eval("Year") %>">Jul</a>
        </div>
        <div class="SizeSelectionGridItemSmall">
            <a href="whatsnew.aspx?Month=8&Year=<%#Eval("Year") %>">Aug</a>
        </div>
        <div class="SizeSelectionGridItemSmall">
            <a href="whatsnew.aspx?Month=9&Year=<%#Eval("Year") %>">Sep</a>
        </div>
        <div class="SizeSelectionGridItemSmall">
            <a href="whatsnew.aspx?Month=10&Year=<%#Eval("Year") %>">Oct</a>
        </div>
        <div class="SizeSelectionGridItemSmall">
            <a href="whatsnew.aspx?Month=11&Year=<%#Eval("Year") %>">Nov</a>
        </div>
        <div class="SizeSelectionGridItemSmall">
            <a href="whatsnew.aspx?Month=12&Year=<%#Eval("Year") %>">Dec</a>
        </div>
    </div>
</div>
</ItemTemplate>
<FooterTemplate></div></FooterTemplate>
</asp:Repeater>





</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

<asp:SqlDataSource runat="server" ID="sdsSummary" ConnectionString="<%$ConnectionStrings:CS %>" SelectCommand="SPOT2012WhatsNewTagSummaryAll"
 SelectCommandType="StoredProcedure" EnableCaching="true" CacheDuration="5000" />
<asp:Repeater runat="server" ID="rptSummary" DataSourceID="sdsSummary">
<HeaderTemplate>
    <div class="BlogPost" style="font-size: .8em;">
    <h1>Post Tags</h1>
    <ul>
</HeaderTemplate>
<ItemTemplate>
    <li>
        <a href="wt.aspx?ID=<%#Eval("WhatsNewTagID") %>"><%#Eval("Description") %></a> (<%#Eval("Total") %>)
    </li>
</ItemTemplate>
<FooterTemplate>
    </ul>
    </div>
</FooterTemplate>
</asp:Repeater>

</asp:Content>


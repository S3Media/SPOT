﻿<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="sd.aspx.cs" Inherits="sd" %>
<%@ Register Src="control_NewArrivals.ascx" TagName="NewArrivals" TagPrefix="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="Skateboarder database at SPoT.  This is the most complete list of pros and ams in skateboarding maintained since 2001.  Includes photos, magazine coverage, videos, news, and more. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="Skatepark of Tampa Skateboarder Database: Articles, News, Contest Coverage, Photos, Videos, and More">
<meta itemprop="description" content="Skateboarder database at SPoT.  This is the most complete list of pros and ams in skateboarding maintained since 2001.  Includes photos, magazine coverage, videos, news, and more. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="Skatepark of Tampa Skateboarder Database: Articles, News, Contest Coverage, Photos, Videos, and More"/>
<meta property="og:type" content="article"/>
<meta property="og:image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="Skatepark of Tampa Skateboarder Database: Articles, News, Contest Coverage, Photos, Videos, and More"/>
<meta property="og:description" content="Skateboarder database at SPoT.  This is the most complete list of pros and ams in skateboarding maintained since 2001.  Includes photos, magazine coverage, videos, news, and more. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>


<script type="text/javascript" language="javascript">
    $(document).ready(function () {

        $("#frmSearch").bind("keypress", function (e) {
            //alert(e.keyCode);
            if (e.keyCode == 13) {
                //$(this).find('input[type=submit]:first').click();
                //alert('you pressed enter, value of text is ' + $('#t').attr('value'));
                ShowSearch();
                e.preventDefault();
            }
        });
        $("#SearchSkaters").click(function (e) {
            e.preventDefault();
            ShowSearch();
        });
        function ShowSearch() {
            var strSearchText = $("#t").attr("value");
            if (strSearchText.length > 2) {
                $.ajax({
                    url: "ajax/ajax_skatersearchresults.aspx?t=" + strSearchText + "&SearchType=Skaters&ID=<%=Request["ID"] %>",
                    error: function () {
                        $("#SkaterSearchResults").html("Poop! There was an error searching the skater database. Sorry about that.");
                    },
                    success: function (data) {
                        //alert(data);
                        $("#SkaterSearchResults").attr('class', '');
                        $("#SkaterSearchResults").html(data);
                    },
                    type: "get"
                });
            }
            else {
                $("#SkaterSearchResults").html("Enter at least three characters before searching. Thanks.");
                $("#SkaterSearchResults").attr('class', 'ErrorMessages');
            }
        }
    });
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">


<div class="BlogPost">
    <div class="row">
    <div class="col-sm-6">
        <h1>Full Skater List</h1>
        This is the most complete list of all am and pro skaters that we know of.    
        Each profile contains <a href="r.aspx">contest results</a>, <a href="ph.aspx">photos</a>, 
        <a href="media.aspx">media coverage</a>, and more.  We have been maintaining this for over 12 years.
        <br /><br />

        Select a letter to see last names start with that letter:
        <div class="row">
        <asp:SqlDataSource runat="server" ID="sdsList" ConnectionString="<%$ ConnectionStrings:CS %>"
         SelectCommand="SPOT2012SkatersLastNameGrouping" SelectCommandType="StoredProcedure" EnableCaching="true" CacheDuration="10000" />

        <asp:Repeater runat="server" ID="rptList" DataSourceID="sdsList">
        <ItemTemplate>
            <div class="col-xs-6 col-sm-2">
                <div class="SizeSelectionGridItemSmall name">
                    <a href="sd.aspx?L=<%#Eval("Letter") %>" title="<%#Eval("Skaters") %> Skaters"><%#Eval("Letter") %></a>
                </div>
            </div>
        </ItemTemplate>
        </asp:Repeater>
            </div>
    </div>
        <div class="clearfix visible-xs"></div>
    <div class="col-sm-6">
        <h1>Most Viewed Skaters This Week</h1>
        <div class="row">
        <asp:SqlDataSource runat="server" EnableCaching="true" CacheDuration="6000" ID="sdsViewed" SelectCommand="SPOT2012SkatersMostClicked" SelectCommandType="StoredProcedure" ConnectionString="<%$ConnectionStrings:CS %>" />
        <asp:Repeater runat="server" ID="rptViewed" DataSourceID="sdsViewed">
        <ItemTemplate>
            <div class="col-xs-3 skaters">
                <a href="http://skateparkoftampa.com/skater/<%#Eval("SkaterID") %>/<%#Eval("FirstName").ToString().Replace("\"", "") %>_<%#Eval("LastName").ToString().Replace("\"", "") %>" 
                title="<%#Eval("FirstName").ToString().Replace("\"", "") %> <%#Eval("LastName").ToString().Replace("\"", "") %> Skateboarder Profile">
                <img src="http://www.skateparkoftampa.com/spot/headshots/<%#Eval("SkaterID") %>thumb.jpg" 
                    title="<%#Eval("FirstName").ToString().Replace("\"", "") %> <%#Eval("LastName").ToString().Replace("\"", "") %> Photo and Skater Profile" /></a>
            </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>
        </div>
    </div>
</div>


    <asp:SqlDataSource runat="server" ID="sdsSkaters" ConnectionString="<%$ ConnectionStrings:CS %>"
     SelectCommand="SPOT2012SkatersLastNameLetter" SelectCommandType="StoredProcedure" EnableCaching="true" CacheDuration="10000">
     <SelectParameters>
        <asp:QueryStringParameter QueryStringField="L" Name="Letter" DefaultValue="A" />
     </SelectParameters>
     </asp:SqlDataSource>

    <asp:Repeater runat="server" ID="Repeater1" DataSourceID="sdsSkaters">
    <HeaderTemplate><h1>Last Names Starting With <%=Request.QueryString["L"] %></h1>
    <div class="BlogPost">
        <div class="row">
    </HeaderTemplate>
    <ItemTemplate>
        <div class="col-xs-6 col-sm-4 skaternames">
        <div class="SizeSelectionGridItemSmall">
            <a href="http://skateparkoftampa.com/skater/<%#Eval("SkaterID") %>/<%#Eval("SkaterName").ToString().Replace("\"", "").Replace(" ", "_") %>" 
            title="<%#Eval("SkaterName") %> Profile, Photos, Video, Contest Results, and More"><%#Eval("SkaterName") %></a>
        </div>
            </div>
    </ItemTemplate>
    <FooterTemplate></div></FooterTemplate>
    </asp:Repeater>
    </div>


    <div class="BlogPost">
        Select a letter to see last names start with that letter:<br />
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:CS %>"
         SelectCommand="SPOT2012SkatersLastNameGrouping" SelectCommandType="StoredProcedure" EnableCaching="true" CacheDuration="10000" />

        <asp:Repeater runat="server" ID="Repeater2" DataSourceID="sdsList">
        <ItemTemplate>
            <div class="col-xs-2 col-sm-2">
                <div class="SizeSelectionGridItemSmall">
                    <a href="sd.aspx?L=<%#Eval("Letter") %>" title="<%#Eval("Skaters") %> Skaters"><%#Eval("Letter") %></a>
                </div>
                </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">
<div class="BlogPost">
<h2>More Skater Links</h2>
<ul>
<li>Check our <a href="/pro_skateboarders_instagram">list of skateboarders on Instagram</a>.</li>
<li>We post <a href="http://skateparkoftampa.com/news">skate videos and news updates on skaters here</a>.</li>
<li>Since 2005, we have been <a href="http://skateparkoftampa.com/media">logging all skate media coverage</a>.</li>
</ul>
</div>

<form method="get" action="sd.aspx" id="frmSearch">
<h2>Search Skaters</h2>

    Enter any portion of a name: <input type="text" style="width:90px;" id="t" name="t" value="<%=Request["t"] %>" /> <input type="submit" id="SearchSkaters" value="Search" />
    <input type="hidden" id="SearchType" name="SearchType"  value="Skaters" />
<div id="SkaterSearchResults">
    <asp:Repeater runat="server" ID="dlSkaters" Visible="false">
    <HeaderTemplate><h2><%=strTitle %>:</h2></HeaderTemplate>
    <ItemTemplate>
        <div class="NotesAndTips" >
            <div>
            <a href="http://skateparkoftampa.com/skater/<%#Eval("SkaterID") %>/<%#Eval("FirstName").ToString().Replace("\"", "") %>_<%#Eval("LastName").ToString().Replace("\"", "") %>">
                <img title="<%#Eval("FirstName").ToString().Replace("\"", "") %> <%#Eval("LastName").ToString().Replace("\"", "") %> Skater Profile" 
                    src="<%#Eval("MugShot") %>" />
            </a>
            </div>
            <a title="<%#Eval("FirstName").ToString().Replace("\"", "") %> <%#Eval("LastName").ToString().Replace("\"", "") %> Skater Profile" 
                href="http://skateparkoftampa.com/skater/<%#Eval("SkaterID") %>/<%#Eval("FirstName").ToString().Replace("\"", "") %>_<%#Eval("LastName").ToString().Replace("\"", "") %>"><%#Eval("FirstName") %> <%#Eval("LastName") %></a>
        </div>
    </ItemTemplate>
    </asp:Repeater>
</div>
    <div style="clear:both;"></div>
</form>

<Products:NewArrivals ID="NewArrivals1" runat="server" />

</asp:Content>


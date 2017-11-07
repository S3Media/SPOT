<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="sk.aspx.cs" Inherits="sk" %>
<%@ Register TagName="Header" TagPrefix="Skater" Src="sk_headercontrol.ascx" %>
<%@ Register TagName="List" TagPrefix="Category" Src="control_categorylist.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
<meta name="description" content="<%=strSkaterName %>: Photos, video, contest history, magazine coverage, and more. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="<%=strSkaterName %>">
<meta itemprop="description" content="<%=strSkaterName %>: Photos, video, contest history, magazine coverage, and more. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="image" content="<%=strImageURL %>">
<meta property="og:title" content="<%=strSkaterName %> Skateboarder Profile"/>
<meta property="og:type" content="profile"/>
<meta property="og:URL" content="http://skateparkoftampa.com/spot/sk.aspx?ID=<%=Request.QueryString["ID"] %>"/>
<meta property="og:image" content="<%=strImageURL %>"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="<%=strSkaterName %>: Photos, video, contest history, magazine coverage, and more. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>
<script src="jquery.masonry.min.js" type="text/javascript"></script>
<meta property="profile:first_name" content="<%=strFirstName %>">
<meta property="profile:last_name" content="<%=strLastName %>">

<script type="text/javascript" language="javascript">
    $(document).ready(function () {
        
        $(".SkInfo").click(function (e) {
            //fill DIV SkContentSelected
            //$("#SkContentSelected").html('fill with appropriate item');
            var strInfo;
            strInfo = $(this).attr('href').substring($(this).attr('href').indexOf("T=") + 2);
            
            //alert($(this).attr('href').indexOf("T="));
            //alert(strInfo);

            $.ajax({
                    url: "ajax/skater_infopanel.aspx?ID=<%=Request.QueryString["ID"] %>&T=" + strInfo,
                    error: function () {
                        $("#SkContentSelected").html("Poop! There was an error getting this information. Sorry about that!");
                    },
                    success: function (data) {
                        //alert(data);
                        $("#SkContentSelected").html(data);
                    },
                    type: "get"
                });
            
            scrollToAnchor('SkaterTopMenu');
            
            e.preventDefault();
        });

        function scrollToAnchor(aid){
            var aTag = $("a[name='"+ aid +"']");
            $('html,body').animate({scrollTop: aTag.offset().top},'slow');
        }

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

    <Skater:Header runat="server" id="headerSkater" />



<div class="BlogPost">
<h1>Other Skater Links</h1>

    <ul style="font-size:.9em;">
        <li><a title="Skateboarder Database" href="http://skateparkoftampa.com/skaters">Full Skater Database</a> - 6000+ skater profiles.</li>
        <li><a title="Pro and Am Skateboarders on Instagram" href="http://skateparkoftampa.com/pro_skateboarders_instagram">Skateboarders on Instagram</a> - browse your favorite pros and ams on Instagram.</li>
        <li><a title="Skateboarding News and Coverage" href="http://skateparkoftampa.com/news">Skate News and Videos</a> - daily skate news and videos from around the web.</li>
        <li><a title="Skateboarding Media Coverage" href="http://skateparkoftampa.com/media">Media Coverage</a> - we log all major magazine coverage by skater and photographer.</li>
        <li><a title="Skateboard Photographers" href="http://skateparkoftampa.com/spot/cp.aspx">Skate Photographers</a> - we log all major magazine coverage by skater and photographer.</li>
        <li><a title="Skateboard Contest Results" href="http://skateparkoftampa.com/results">Contest Results</a> - over a decade's worth of contest history.</li>
    </ul>
        
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">



<div class="BlogPost ShoeSizeGrid hidden-xs hidden-sm" id="MugShot">
        <img class="img-responsive img-center MugShotProfile" src="<%=strImageURL%>"  alt="<%=strSkaterName.Replace("\"", "") %> Photo" 
            title="<%=strSkaterName.Replace("\"", "") %> Photo" />
</div>

<!--

<div class="BlogPost">
    <h1>Download Our App</h1>
    Download Skatepark of Tampa's Skate Nerd app
    <a href="http://itunes.apple.com/us/app/spot-skate-nerd/id544443560?ls=1&mt=8" target="_blank">
        for iphone
    </a>
    and 
    <a href="https://play.google.com/store/apps/details?id=com.meronek.skateNerd&feature=search_result#?t=W251bGwsMSwyLDEsImNvbS5tZXJvbmVrLnNrYXRlTmVyZCJd">for Android</a>.  Full skater profiles, news, contest results, and more, right from your phone.

</div>

-->


<form method="get" action="sk.aspx" id="frmSearch">
<h2>Search Skaters</h2>
    Enter any portion of a name: <input type="text" style="width:90px;" id="t" name="t" value="<%=Request["t"] %>" /> <input type="submit" id="SearchSkaters" value="Search" />
    <input type="hidden" id="SearchType" name="SearchType"  value="Skaters" />
    <input type="hidden" id="ID" name="ID"  value="<%=Request.QueryString["ID"] %>" />

    <div id="SkaterSearchResults">
    <asp:Repeater runat="server" ID="dlSkaters" Visible="false">
    <HeaderTemplate><h2><%=strTitleSearch %>:</h2></HeaderTemplate>
    <ItemTemplate>
        <div class="NotesAndTips" style="float:left; width:65px; text-align:center; margin:0px; padding:0px;">
            <div>
            <a href="/skater/<%#Eval("SkaterID") %>/<%#Eval("FirstName").ToString().Replace("\"", "") %>_<%#Eval("LastName").ToString().Replace("\"", "") %>">
                <img title="<%#Eval("FirstName").ToString().Replace("\"", "") %> <%#Eval("LastName").ToString().Replace("\"", "") %> Skater Profile" 
                    src="<%#Eval("MugShot") %>" />
            </a>
            </div>
            <a title="<%#Eval("FirstName").ToString().Replace("\"", "") %> <%#Eval("LastName").ToString().Replace("\"", "") %> Skater Profile" 
                href="/skater/<%#Eval("SkaterID") %>/<%#Eval("FirstName").ToString().Replace("\"", "") %>_<%#Eval("LastName").ToString().Replace("\"", "") %>"><%#Eval("FirstName") %> <%#Eval("LastName") %></a>
        </div>
    </ItemTemplate>
    <FooterTemplate><div style="clear:both;"></div></FooterTemplate>
    </asp:Repeater>
    </div>

</form>





<div class="BlogPost ShoeSizeGrid">
<h2>What's Your Shoe Size?</h2>
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


<Category:List runat="server" id="categoryList" />


<asp:SqlDataSource runat="server" ID="sdsRandom" SelectCommand="SPOT2012AdTextRandom"
	SelectCommandType="StoredProcedure" ConnectionString="<%$ ConnectionStrings:CS %>" EnableCaching="true" CacheDuration="200" />
<asp:Repeater runat="server" ID="rptRandom" DataSourceID="sdsRandom">
	<HeaderTemplate> <div class="BlogPost HotLinks"><h2>Random Hot Links:</h2></HeaderTemplate>
	<ItemTemplate>
		| <a href="clickadtext.aspx?AdID=<%#Eval("AdID") %>"><%# DataBinder.Eval(Container.DataItem, "LinkText")%></a>
	</ItemTemplate>
	<FooterTemplate></div></FooterTemplate>
</asp:Repeater>



</asp:Content>


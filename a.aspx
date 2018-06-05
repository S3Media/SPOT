<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="a.aspx.cs" Inherits="a" %>
<%@ Register Src="control_categorylist.ascx" TagName="Categories" TagPrefix="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">


<meta name="description" content="<%=strTitle.Replace("\"", "") %> <%=strLongDescriptionMeta.Replace("\"", "") %>">
<meta itemprop="name" content="<%=strTitle.Replace("\"", "") %>">
<meta itemprop="description" content="<%=strTitle.Replace("\"", "") %> <%=strLongDescriptionMeta.Replace("\"", "") %>">
<asp:SqlDataSource runat="server" ID="sdsImage" SelectCommand="SPOT2012ArticleImage" SelectCommandType="StoredProcedure" 
EnableCaching="true" CacheDuration="1000" 
ConnectionString="<%$ ConnectionStrings:CS %>">
<SelectParameters><asp:QueryStringParameter Name="ArticleID" QueryStringField="ID" /></SelectParameters>
</asp:SqlDataSource>
<asp:Repeater runat="server" DataSourceID="sdsImage"><ItemTemplate>
<meta property="og:image" content="<%#Eval("ImageURL") %>"/>
<meta itemprop="image" content="<%#Eval("ImageURL") %>">
</ItemTemplate></asp:Repeater>
<meta property="og:title" content="<%=strTitle.Replace("\"", "") %>"/>
<meta property="og:type" content="article"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="<%=strTitle.Replace("\"", "") %> <%=strLongDescriptionMeta.Replace("\"", "") %>"/>
<script src="jquery.masonry.min.js" type="text/javascript"></script>
<script src="jquery.imagesloaded.min"></script>

<script language="javascript" type="text/javascript">

    $(document).ready(function () {

        $(document).ready(function () {
            var $container = $('#MasonryWrapper');
            $container.imagesLoaded(function () {
                $container.masonry({
                    itemSelector: '.PhotoBox2012',
                    columnWidth: 300
                });
            });

            var $container2 = $('.MasonryWrapper');
            $container2.imagesLoaded(function () {
                $container2.masonry({
                    itemSelector: '.PhotoBox2012',
                    columnWidth: 300
                });
            });
            //alert("test");
        });


        /*
        HAVE TO COME BACK TO THIS - IMAGE EXPANDS, BUT CONTAINER DOES NOT - MASONRY MESSING THIS UP?

        $(".ExpandSequence").click(function (event) {
            //alert($(this).attr('id').indexOf("img", 0));
            //if it's not already enlarged, enlarge it, otherwise, let the click go through

            var intImageID;
            //first, determine if they clicked the link or the image itself
            if ($(this).attr('id').indexOf("img", 0) > -1) {//they clicked the image
                intImageID = $(this).attr('id').substring(3, $(this).attr('id').length);
            }
            else {//they clicked the link
                intImageID = $(this).attr('id').substring(6, $(this).attr('id').length);
            }

            //alert($("#img" + intImageID).attr('src').indexOf('small.gif'));

            if ($("#img" + intImageID).attr('src').indexOf('small.gif') > 0) {
                //only prvent the click through if it's not already enlarged
                event.preventDefault();
                ExpandImage(intImageID);
            }

        });

        function ExpandImage(intImageID) {
            $("#img" + intImageID).fadeOut();

            $("#img" + intImageID).attr('src', $("#img" + intImageID).attr('src').replace('small.gif', '.gif'));

            $("#Expand" + intImageID).attr('innerHTML', 'Loading...');
            $("#img" + intImageID).fadeIn();
            $("#Expand" + intImageID).fadeOut(3000);
            //alert($(this).parent().find(".PhotoBox2012").attr("width", "100%"));
            //$(this).parent().find(".PhotoBox2012").css("width", "100%");
        }
        
        */

        

    });





</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


</script>


<div class="BlogPost post-page">
<h1><%=strTitle %></h1>
<h3>Posted on <%=dtDatePosted.ToLongDateString() %> by <%=strAuthor %></h3>

    
    <div class="BlogText">
        <%=strArticle %>
    <div><!-- needed for jQuery auto resize of videos - total hack, keeps the last div from being 60 wide (if the last photo in the article is a photo with a skater profile) --></div>
    </div>


</div>

<!--


<asp:SqlDataSource runat="server" ID="sdsRelatedArticles" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012ArticlesRelated" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="1000">
    <SelectParameters>
        <asp:QueryStringParameter Name="ArticleID" QueryStringField="ID" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:Repeater runat="server" ID="rptRelatedArticles" DataSourceID="sdsRelatedArticles">
    <HeaderTemplate>
        
        <h2>Related Articles</h2>
        <div class="BlogPost MasonryWrapper">
    </HeaderTemplate>
    <ItemTemplate>
        <div class="PhotoBox2012 test">
		<h2><a href="/article/<%# Eval("ArticleID")%>/<%# Eval("Description").ToString().Replace("\"","").Replace(" ", "_").Replace(":", "_") %>"><%# Eval("Description")%></a></h2>
			<h3>by <%# Eval("Category")%> on <%# Eval("DateAdded", "{0:D}")%></h3>
			
            <h3>
				<a href="/article/<%# Eval("ArticleID")%>/<%# Eval("Description").ToString().Replace("\"","").Replace(" ", "_").Replace(":", "_") %>">
                    <img style="float:left; margin-right: 10px;" src="<%# Eval("Icon")%>" />
                </a>
                <%# Eval("LongDescription")%>
			</h3>
		</div>
    </ItemTemplate>
    <FooterTemplate>
        </div>
        <h3 style="text-align:center;">[View more in the <a href="al.aspx">Article Archives</a>]</h3>
        
    </FooterTemplate>
</asp:Repeater>


-->

    <div class="clearfix"></div>



<div class="BlogPost">
<h2>Comments</h2>
<div class="fb-comments" data-href="https://skateparkoftampa.com/spot/a.aspx" data-width="600" data-numposts="5"></div>						
</div>


<form 
action="https://feedburner.google.com/fb/a/mailverify" method="post" target="popupwindow" 
onsubmit="window.open('https://feedburner.google.com/fb/a/mailverify?uri=spotwhatsup', 'popupwindow', 'scrollbars=yes,width=550,height=520');return true">
<h2>Subscribe to the SPoT What's Up Blog</h2>
Enter your email: <input type="text" style="font-size:18px; font-weight:bold;" name="email"/> <input type="hidden" value="spotwhatsup" name="uri"/><input type="hidden" name="loc" value="en_US"/><input style="margin-top:2px; font-size:18px; font-weight:bold;" type="submit" value="Subscribe" />

<a href="https://feedburner.google.com/fb/a/mailverify?uri=spotwhatsup&loc=en_US"><img src="https://feeds.feedburner.com/~fc/spotwhatsup?bg=FF3300&amp;fg=FFFFFF&amp;anim=0" height="26" width="88" style="border:0; padding-left:30px;" alt="" /></a>
</form>




</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">




<div class="BlogPost ShoeSizeGrid">
    <h2>What's Your Shoe Size?</h2>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 5 Skate Shoes in Stock Now" href="/5">5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 5.5 Skate Shoes in Stock Now" href="/5.5">5.5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 6 Skate Shoes in Stock Now" href="/6">6</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 6.5 Skate Shoes in Stock Now" href="/6.5">6.5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 7 Skate Shoes in Stock Now" href="/7">7</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 7.5 Skate Shoes in Stock Now" href="/7.5">7.5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 8 Skate Shoes in Stock Now" href="/8">8</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 8.5 Skate Shoes in Stock Now" href="/8.5">8.5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 9 Skate Shoes in Stock Now" href="/9">9</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 9.5 Skate Shoes in Stock Now" href="/9.5">9.5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 10 Skate Shoes in Stock Now" href="/10">10</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 10.5 Skate Shoes in Stock Now" href="/10.5">10.5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 11 Skate Shoes in Stock Now" href="/11">11</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 11.5 Skate Shoes in Stock Now" href="/11.5">11.5</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 12 Skate Shoes in Stock Now" href="/12">12</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 13 Skate Shoes in Stock Now" href="/13">13</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 14 Skate Shoes in Stock Now" href="/14">14</a></div></div>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 15 Skate Shoes in Stock Now" href="/15">15</a></div></div>
</div>











<div class="BlogPost">
<h2>Article Archive by Category</h2>
    <ul>
    <asp:SqlDataSource runat="server" ID="sdsCategories" ConnectionString="<%$ ConnectionStrings:CS %>" 
        EnableCaching="true" CacheDuration="9000"
        SelectCommand="SPOT2012ArticlesTagListing" SelectCommandType="StoredProcedure" />
    <asp:Repeater runat="server" ID="rptCategories" DataSourceID="sdsCategories">
    <HeaderTemplate></HeaderTemplate>
    <ItemTemplate>
        <li>
            <a href="ac.aspx?ID=<%#Eval("ArticleTagID") %>"><%#Eval("Description") %></a> (<%#Eval("Total") %>)
        </li>
    </ItemTemplate>
    <FooterTemplate></FooterTemplate>
    </asp:Repeater>
        </ul>
</div>

<Products:Categories runat="server" />


<div class="BlogPost">
<h2>In Stock, Immediate Shipping</h2>
    <asp:SqlDataSource runat="server" ID="sdsFlagsMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012ProductFlagList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="10000" />
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="sdsFlagsMenu">
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
	<HeaderTemplate> <div class="BlogPost HotLinks"><h2>Random Hot Links:</h2></HeaderTemplate>
	<ItemTemplate>
		| <a href="clickadtext.aspx?AdID=<%#Eval("AdID") %>"><%# DataBinder.Eval(Container.DataItem, "LinkText")%></a>
	</ItemTemplate>
	<FooterTemplate></div></FooterTemplate>
</asp:Repeater>
    

</asp:Content>


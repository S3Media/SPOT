<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="w.aspx.cs" Inherits="w" %>
<%@ Register Src="control_WhatUpTagSummary.ascx" TagName="Summary" TagPrefix="WhatsNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="<%=strTitle %>: Blog Post at SPoT. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="<%=strTitle %>: Blog Post at SPoT">
<meta itemprop="description" content="<%=strTitle %>: Blog Post at SPoT. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="image" content="<%=strIcon %>">

<meta property="og:title" content="<%=strTitle %> Blog Post at SPoT"/>
<meta property="og:type" content="article"/>
<meta property="og:url" content="http://skateparkoftampa.com/spot/w.aspx?ID=<%=Request.QueryString["ID"] %>"/>
<meta property="og:image" content="<%=strIcon %>"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="<%=strTitle %>: Blog Post at SPoT. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>


<script language="javascript" type="text/javascript">

    $(document).ready(function () {

        var $container = $('#MasonryWrapper');

        $container.imagesLoaded(function () {
            $container.masonry({
                itemSelector: '.PhotoBox2012',
                columnWidth: 190
            });
        });
        //alert('test');

        //on the front page, this number starts at 2, but here it starts at one
        var intNextPageNumberPosts = 1;

        $(".MorePosts").click(function (event) {
            if (intNextPageNumberPosts < 6) {
                //we are only going back five pages of blog posts by ajax
                event.preventDefault();
                //alert("get page " + intNextPageNumberPosts + " from db and load via ajax");
                //alert(intNextPageNumberPosts);
                $.ajax({
                    url: "ajax/blogposts.aspx?P=" + intNextPageNumberPosts,
                    error: function () {
                        //$("#" + DivID).html("Error");
                        $("#MorePostsNextDiv" + intNextPageNumberPosts).html("Ah poop! There was an error getting more posts. Lurk on, son.");

                    },
                    success: function (data) {
                        //alert(data);
                        $("#MorePostsNextDiv" + intNextPageNumberPosts).html(data);
                        intNextPageNumberPosts = intNextPageNumberPosts + 1;
                    },
                    type: "get"
                });
            }
        });


    });

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">



<asp:SqlDataSource runat="server" ID="sdsItem" CacheDuration="1000" EnableCaching="true"
    SelectCommand="SPOT2012WhatsNewPost" SelectCommandType="StoredProcedure" ConnectionString="<%$ ConnectionStrings:CS %>">
<SelectParameters>
    <asp:QueryStringParameter Name="WhatsNewID" QueryStringField="ID" />
</SelectParameters>
</asp:SqlDataSource>

<asp:Repeater runat="server" ID="rptWhatsUp" DataSourceID="sdsItem">
<HeaderTemplate>
</HeaderTemplate>
<ItemTemplate>
<div class="BlogPost">        
<div class="PostMediaStripSub" style="float:right;">
        <span class="counter-fb-like">
            <iframe src="//www.facebook.com/plugins/like.php?href=<%# Server.UrlEncode(Eval("ShareLink").ToString()) %>&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21&amp;appId=128422270572394" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:100px; height:21px;" allowTransparency="true"></iframe>
        </span>
        <span class="counter-twitter">
            <a href="https://twitter.com/share" class="twitter-share-button" data-url="<%#Eval("ShareLink") %>" data-count="horizontal" data-via="SPoTTampa">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
        </span>
</div>
<h1><a href="w.aspx?ID=<%#Eval("WhatsNewID") %>"><%#Eval("Title") %></a></h1>
    <h3 class="PostInfo">Posted by <%#Eval("PostedBy") %>, <%#Eval("DateAdded", "{0:D}") %> <%#Eval("DateAdded", "{0:t}") %></h3>
    <div class="BlogText">
        <%#Eval("Description") %>
            <div><!-- needed for jQuery auto resize of videos - total hack, keeps the last div from being 60 wide (if the last photo in the article is a photo with a skater profile) --></div>
    </div>
</div>
<div class="BlogPost">
    Next Post: <%#Eval("NextPost")%><br />
    Previous Post: <%#Eval("PreviousPost")%>
</div>
</ItemTemplate>
<FooterTemplate>
</FooterTemplate>
</asp:Repeater>

<asp:SqlDataSource runat="server" ID="sdsTags" ConnectionString="<%$ConnectionStrings:CS %>" SelectCommand="SPOT2012WhatsNewPostTags"
 SelectCommandType="StoredProcedure">
<SelectParameters><asp:QueryStringParameter Name="WhatsNewID" QueryStringField="ID" /></SelectParameters>
</asp:SqlDataSource>
<asp:Repeater runat="server" DataSourceID="sdsTags">
<HeaderTemplate><div class="BlogPost">Post Tags: </HeaderTemplate>
<ItemTemplate> [<a href="wt.aspx?ID=<%#Eval("WhatsNewTagID") %>"><%#Eval("Description") %></a>] </ItemTemplate>
<FooterTemplate></div></FooterTemplate>
</asp:Repeater>


    <div class="BlogPost">
        <h1>Related Posts</h1>


        <asp:SqlDataSource runat="server" ID="sdsList" ConnectionString="<%$ ConnectionStrings:CS %>" 
         EnableCaching="true" CacheDuration="400"
         SelectCommand="SPOTWhatsUpRelatedPosts" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="WhatsNewID" QueryStringField="ID" />
            </SelectParameters>
         </asp:SqlDataSource>
        <asp:Repeater runat="server" ID="rptList" DataSourceID="sdsList">
            <HeaderTemplate></HeaderTemplate>
            <ItemTemplate>
            <div class="PhotoBox2012" style="width:170px; padding:5px; height:280px;">
                <a href="/spot/w.aspx?ID=<%# Eval("WhatsNewID")%>">
                <img src="http://www.skateparkoftampa.com/spot/whatsupicons/<%#Eval("WhatsNewID") %>.jpg" />
                </a>
                <h2><a href="w.aspx?ID=<%# Eval("WhatsNewID")%>"><%# Eval("Title")%></a></h2>
                <h3>
                    Posted by <%# Eval("PostedBy")%> on <%# Eval("DateAdded", "{0:d}")%>
                </h3>
            </div>
        </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </asp:Repeater>


    </div>

<div class="BlogPost">
<h1>Comments</h1>
<div id="fb-root"></div><script src="http://connect.facebook.net/en_US/all.js#appId=106807979370947&amp;xfbml=1"></script><fb:comments href="http://www.skateparkoftampa.com/spot/a.aspx?ID=<%=Request.QueryString["ID"] %>" num_posts="5" width="590"></fb:comments>							
</div>



<form 
action="http://feedburner.google.com/fb/a/mailverify" method="post" target="popupwindow" 
onsubmit="window.open('http://feedburner.google.com/fb/a/mailverify?uri=spotwhatsup', 'popupwindow', 'scrollbars=yes,width=550,height=520');return true">
<h2>Subscribe to the SPoT What's Up Blog</h2>
Enter your email: <input type="text" style="width:200px; font-size:18px; font-weight:bold;" name="email"/> <input type="hidden" value="spotwhatsup" name="uri"/><input type="hidden" name="loc" value="en_US"/><input style="margin-top:2px; font-size:18px; font-weight:bold;" type="submit" value="Subscribe" />

<a href="http://feedburner.google.com/fb/a/mailverify?uri=spotwhatsup&loc=en_US"><img src="http://feeds.feedburner.com/~fc/spotwhatsup?bg=FF3300&amp;fg=FFFFFF&amp;anim=0" height="26" width="88" style="border:0; padding-left:30px;" alt="" /></a>
</form>



<div class="BlogPost">
<h1>SPoT What's Up Blog</h1>
    We've been posting daily banter to the What's Up Column here for over a decade now.  Select a year and month to see posts from that time.
</div>
<asp:SqlDataSource runat="server" ID="sdsYears" SelectCommand="SPOT2012WhatNewYearList" SelectCommandType="StoredProcedure"
 ConnectionString="<%$ConnectionStrings:CS %>" EnableCaching="true" CacheDuration="10000" />
<asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsYears">
<HeaderTemplate><div class="BlogPost"></HeaderTemplate>
<ItemTemplate>
    <div class="ProductBlock" style="height:120px; width: 190px; border: solid 1px black; padding:2px; margin: 1px;">
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


<div id="MorePostsNextDiv1">
</div>
    
<div class="BlogPost">
    <h2><a href="whatsnew.aspx" class="MorePosts">More Blog Posts</a></h2>
    <a href="whatsnew.aspx" class="MorePosts">VIEW MORE POSTS</a> or you can view the <a href="whatsnew.aspx">entire What's Up Blog archives</a>.
</div>



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
    SelectCommand="SPOT2012FlagList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="10000" />
    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="sdsFlagsMenu">
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


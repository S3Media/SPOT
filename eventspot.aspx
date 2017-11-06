<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="eventspot.aspx.cs" Inherits="eventspot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="<%=strTitle %>: Click for full details. SPoT Productions is a division of Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="<%=strTitle %>, SPoT Productions at Skatepark of Tampa">
<meta itemprop="description" content="<%=strTitle %>: Click for full details. SPoT Productions is a division of Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="image" content="http://skateparkoftampa.com/spot/spotevents/<%=Request.QueryString["I"] %>.jpg">

<meta property="og:title" content="<%=strTitle %>, SPoT Productions at Skatepark of Tampa"/>
<meta property="og:type" content="article"/>
<meta property="og:image" content="http://skateparkoftampa.com/spot/spotevents/<%=Request.QueryString["I"] %>.jpg"/>
<meta property="og:site_name" content="SPoT, Skatepark of Tampa"/>
<meta property="og:description" content="<%=strTitle %>: Click for full details. SPoT Productions is a division of Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">


<asp:SqlDataSource runat="server" ID="sdsEvent" SelectCommand="SPOT2012SPoTEventDetails" SelectCommandType="StoredProcedure" ConnectionString="<%$ConnectionStrings:CS %>">
<SelectParameters>
    <asp:QueryStringParameter Name="EventID" QueryStringField="I" />
</SelectParameters>
</asp:SqlDataSource>

<asp:Repeater runat="server" ID="rptEvent" DataSourceID="sdsEvent">
<ItemTemplate>
    

    <div class="BlogPost">
    <h1><%=strTitle%></h1>
        <div class="BlogText">
            <%#Eval("FullDescription") %>
            <div><!-- needed for jQuery auto resize of videos - total hack, keeps the last div from being 60 wide (if the last photo in the article is a photo with a skater profile) --></div>
        </div>
    </div>

<div class="BlogPost">


    <div class="PostMediaStripSub">
                
                <span class="counter-fb-like">
                    <iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fskateparkoftampa.com%2Fspot%2Feventspot.aspx%3FI%3D<%=Request.QueryString["I"] %>&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21&amp;appId=128422270572394" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:80px; height:21px;" allowTransparency="true"></iframe>
                </span>
                <span class="counter-twitter">
                    <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://skateparkoftampa.com/spot/eventspot.aspx?I=<%=Request.QueryString["I"] %>" data-count="horizontal" data-via="SPoTTampa">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
                </span>
                    
                <span class="counter-google-one">
                    <g:plusone size="medium" href="http://skateparkoftampa.com/spot/eventspot.aspx?I=<%=Request.QueryString["I"] %>"></g:plusone>
                </span>
                <span class="counter-stumble">
                    <script src="http://www.stumbleupon.com/hostedbadge.php?s=3&r=http://skateparkoftampa.com/spot/eventspot.aspx?I=<%=Request.QueryString["I"] %>"></script>
                </span>

        </div>
    </div>

</ItemTemplate>
</asp:Repeater>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">



<div class="BlogPost">
<h1>Comments</h1>
<div id="fb-root"></div><script src="http://connect.facebook.net/en_US/all.js#appId=106807979370947&amp;xfbml=1"></script><fb:comments href="http://www.skateparkoftampa.com/spot/eventspot.aspx?I=<%=Request.QueryString["I"] %>" num_posts="5" width="280"></fb:comments>							
</div>

<div class="BlogPost">
<img src="http://skateparkoftampa.com/spot/spotevents/<%=Request.QueryString["I"] %>.jpg" style="width:280px; height:280px;" />
</div>

<form 
action="http://feedburner.google.com/fb/a/mailverify" method="post" target="popupwindow" 
onsubmit="window.open('http://feedburner.google.com/fb/a/mailverify?uri=spotwhatsup', 'popupwindow', 'scrollbars=yes,width=550,height=520');return true">
<h2>Subscribe for Updates</h2>
Enter your email: <input type="text" style="width:200px; font-size:18px; font-weight:bold;" name="email"/> <input type="hidden" value="spotwhatsup" name="uri"/><input type="hidden" name="loc" value="en_US"/><input style="margin-top:2px; font-size:18px; font-weight:bold;" type="submit" value="Subscribe" />

<a href="http://feedburner.google.com/fb/a/mailverify?uri=spotwhatsup&loc=en_US"><img src="http://feeds.feedburner.com/~fc/spotwhatsup?bg=FF3300&amp;fg=FFFFFF&amp;anim=0" height="26" width="88" style="border:0; padding-left:30px;" alt="" /></a></form>

    

</asp:Content>


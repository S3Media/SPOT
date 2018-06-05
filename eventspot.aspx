<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="eventspot.aspx.cs" Inherits="eventspot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="<%=strTitle %>: Click for full details. SPoT Productions is a division of Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="<%=strTitle %>, SPoT Productions at Skatepark of Tampa">
<meta itemprop="description" content="<%=strTitle %>: Click for full details. SPoT Productions is a division of Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="image" content="https://skateparkoftampa.com/spot/spotevents/<%=Request.QueryString["I"] %>.jpg">

<meta property="og:title" content="<%=strTitle %>, SPoT Productions at Skatepark of Tampa"/>
<meta property="og:type" content="article"/>
<meta property="og:image" content="https://skateparkoftampa.com/spot/spotevents/<%=Request.QueryString["I"] %>.jpg"/>
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
    

    <div class="BlogPost li-fix">
    <h1><%=strTitle%></h1>
        <div class="BlogText">
            <%#Eval("FullDescription") %>
            <div><!-- needed for jQuery auto resize of videos - total hack, keeps the last div from being 60 wide (if the last photo in the article is a photo with a skater profile) --></div>
        </div>
    </div>


</ItemTemplate>
</asp:Repeater>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">



<div class="BlogPost">
<h1>Comments</h1>
<div id="fb-root"></div><script src="https://connect.facebook.net/en_US/all.js#appId=106807979370947&amp;xfbml=1"></script><fb:comments href="https://skateparkoftampa.com/spot/eventspot.aspx?I=<%=Request.QueryString["I"] %>" num_posts="5" width="100%"></fb:comments>							
</div>

<div class="BlogPost">
<img class="img-responsive img-center" src="https://skateparkoftampa.com/spot/spotevents/<%=Request.QueryString["I"] %>.jpg" />
</div>

<form 
action="https://feedburner.google.com/fb/a/mailverify" method="post" target="popupwindow" 
onsubmit="window.open('https://feedburner.google.com/fb/a/mailverify?uri=spotwhatsup', 'popupwindow', 'scrollbars=yes,width=550,height=520');return true">
<h2>Subscribe for Updates</h2>
Enter your email: <input type="text" font-size:18px; font-weight:bold;" name="email"/> <input type="hidden" value="spotwhatsup" name="uri"/><input type="hidden" name="loc" value="en_US"/><input style="margin-top:2px; font-size:18px; font-weight:bold;" type="submit" value="Subscribe" />

<a href="https://feedburner.google.com/fb/a/mailverify?uri=spotwhatsup&loc=en_US"><img src="https://feeds.feedburner.com/~fc/spotwhatsup?bg=FF3300&amp;fg=FFFFFF&amp;anim=0" height="26" width="88" style="border:0; padding-left:30px;" alt="" /></a></form>

    

</asp:Content>


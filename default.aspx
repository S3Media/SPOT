<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_default" %>
<%@ Register Src="control_NewArrivals.ascx" TagName="NewArrivals" TagPrefix="Products" %>
<%@ Register Src="control_categorylist.ascx" TagName="Categories" TagPrefix="Products" %>

<asp:Content ID="Content3" ContentPlaceHolderID="cphHead" Runat="Server">
<meta name="description" content="Skatepark of Tampa. A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="SPoT Skate Shop at Skatepark of Tampa">
<meta itemprop="description" content="SPoT Skate Shop at Skatepark of Tampa: A crusty little skateboard hut in Tampa established in 1993. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="http://www.skateparkoftampa2.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:type" content="company"/>
<meta property="og:image" content="http://www.skateparkoftampa2.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>

<!--WEBSITE TAKEOVER STYLESHEET FOR AM/PRO-->
<link rel="stylesheet" href="http://www.skateparkoftampa2.com/tampapro/css/style-home.css">

<script language="javascript" type="text/javascript">

    $(document).ready(function () {
        $(".Page<%=Request.QueryString["P"]%>").css("color", "green");

        var intNextPageNumberPosts = 2;
        $(".MorePosts").click(function (event) {
            if (intNextPageNumberPosts < 13) {
                //we are only going back 12 pages of blog posts by ajax (5 posts per page)
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


<asp:Content ContentPlaceHolderID="cphHega" runat="server">



</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" Runat="Server">

<asp:SqlDataSource runat="server" ID="sdsWhatsUp" ConnectionString="<%$ConnectionStrings:CS %>" SelectCommandType="StoredProcedure"
 SelectCommand="SPOT2012WhatsUpFrontPagePages" EnableCaching="true" CacheDuration="1000">
<SelectParameters>
    <asp:QueryStringParameter Name="Page" QueryStringField="P" DefaultValue="1" />
</SelectParameters> 
</asp:SqlDataSource>
<asp:Repeater runat="server" ID="rptWhatsUp" DataSourceID="sdsWhatsUp">
<HeaderTemplate>

</HeaderTemplate>


<ItemTemplate>

<div class="BlogPost">
    <h1><a href="/post/<%#Eval("WhatsNewID") %>/<%#Eval("Title").ToString().Replace("\"", "").Replace(" ", "_") %>"><%#Eval("Title") %></a></h1>
        
        <h3 class="PostInfo">Posted by <%#Eval("PostedBy") %>, <%#Eval("DateAdded", "{0:D}") %> <%#Eval("DateAdded", "{0:t}") %></h3>
        <div class="BlogText">
            <%#Eval("Description") %>
            <div><!-- hack div --></div>
        </div>

            <div class="PostMediaStrip">
            <div class="PostMediaStripSub">
                <div class="row">
                <div class="col-xs-3">
                    <span class="counter-fb-like">
                        <iframe src="//www.facebook.com/plugins/like.php?href=<%# Server.UrlEncode(Eval("ShareLink").ToString()) 

%>&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=2

1&amp;appId=128422270572394" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:80px; height:21px;" 

allowTransparency="true"></iframe>
                    </span>
                    </div>
                <div class="col-xs-3">
                    <span class="counter-twitter">
                        <a href="https://twitter.com/share" class="twitter-share-button" data-url="<%#Eval("ShareLink") %>" data-

count="horizontal" data-via="SPoTTampa">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
                    </span>
                    </div>
                <div class="col-xs-3">
                    <span class="counter-google-one">
                        <g:plusone size="medium" href="<%#Eval("ShareLink") %>"></g:plusone>
                    </span>
                    </div>
                <div class="col-xs-3">
                    <span class="counter-stumble">
                        <script src="http://www.stumbleupon.com/hostedbadge.php?s=3&r=<%#Eval("ShareLink") %>"></script>
                    </span>
                    </div>
                
                    </div>
            </div>
        </div>


    </div>

</ItemTemplate>
<FooterTemplate>
    
</FooterTemplate>

</asp:Repeater>



<!--<div class="BlogPost">
    <h2 style="text-transform:none;"><a href="http://instagram.com/spottampa">FOLLOW US ON INSTAGRAM @SPoTTAMPA</a></h2>

    <div id="InstagramBlock"></div>
    <script>

        // small = + data.data[i].images.thumbnail.url +
        // resolution: low_resolution, thumbnail, standard_resolution

        $(function () {
            $.ajax({
                type: "GET",
                dataType: "jsonp",
                cache: false,
                url: "https://api.instagram.com/v1/users/18991288/media/recent/?access_token=1486148.f59def8.ff573730f2224378854d5fccea7a8774&count=4",
                success: function (data) {
                    for (var i = 0; i < 30; i++) {
                        $("#InstagramBlock").append("<div class='instagram-placeholder'><a target='_blank' href='" + data.data[i].link + "'><img class='instagram-image' src='" + data.data[i].images.low_resolution.url + "' /></a><div class='instagram-caption'>" + data.data[i].caption.text + "</div></div>");
                    }

                }
            });
        });

        

    </script>



    <div style="clear:both;"></div>
</div>-->


<div id="MorePostsNextDiv2">
        
</div>

    <div id="loadmoreajaxloader" class="BlogPost" style="clear:both; text-align:center; display:none;"><img src="ajaxloadingmore.gif" /> Loading More... <img src="ajaxloadingmore.gif" /></div>

    
<div class="BlogPost" id="PagePostNoScript">
    <div class="Ollie"><h2><a href="whatsnew.aspx" class="MorePosts">Load More Blog Posts</a></h2></div>
    <!--
    <div class="ProductPager" style="clear:both;">
            <a class="Page1" href="default.aspx?P=1">1</a>
            <a class="Page2" href="default.aspx?P=2">2</a>
            <a class="Page3" href="default.aspx?P=3">3</a>
            <a class="Page4" href="default.aspx?P=4">4</a>
            <a class="Page5" href="default.aspx?P=5">5</a>
            <a class="Page6" href="default.aspx?P=6">6</a>
            <a class="Page7" href="default.aspx?P=7">7</a>
            <a class="Page8" href="default.aspx?P=8">8</a>
            <a class="Page9" href="default.aspx?P=9">9</a>
            <a class="Page10" href="default.aspx?P=10">10</a>
            <a class="Page11" href="default.aspx?P=11">11</a>
            <a class="Page12" href="default.aspx?P=12">12</a>
        </div>
    -->
</div>



</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="cphSidebar" Runat="Server">





<div class="BlogPost">

<h2>SPoT Roast BMX Contest</h2>

<div style="font-weight:bold;">


<ul>

<li><a href="http://skateparkoftampa.com/results/1506/SPoT_Roast_BMX_Contest_2017_-_9-12_Division_(Am)">12 & Under Results</a></li>
<li><a href="http://skateparkoftampa.com/results/1507/SPoT_Roast_BMX_Contest_2017_-_13-15_Division_(Am)">13-15 Results</a></li>
<li><a href="http://skateparkoftampa.com/results/1508/SPoT_Roast_BMX_Contest_2017_-_16-29_Division_(Am)">16-29 Results</a></li>
<li><a href="http://skateparkoftampa.com/results/1509/SPoT_Roast_BMX_Contest_2017_-_30_and_Up_Division">30 & Up Results</a></li>
<li><a href="http://skateparkoftampa.com/results/1523/SPoT_Roast_High_Air_2017">SPoT Roast High Air Results</a></li>
<li><a href="http://skateparkoftampa.com/results/1516/SPoT_Roast_BMX_Contest_2017_-_Pro_Division">Pro Qualifier Results</a></li>
<li><a href="http://skateparkoftampa.com/results/1524/SPoT_Roast_BMX_Contest_2017_-_Pro_Finals">Pro Finals Results</a></li>
<li><a href="http://skateparkoftampa.com/spot/a.aspx?ID=3343">Contest Info</a></li>

</ul>

</div>



</div>






<!--

<div class="BlogPost">

<h2>Harvest Jam</h2>

<div style="font-weight:bold;">


<ul>

<li><a href="http://skateparkoftampa.com/spot/a.aspx?ID=3365">Contest Info</a></li>
<li><a href="http://skateparkoftampa.com/results/1483/Harvest_Jam_8_&_Under_Division">8 & Under Results</a></li>
<li><a href="http://skateparkoftampa.com/results/1482/Harvest_Jam_9-12_Division">9 to 12 Results</a></li>
<li><a href="http://skateparkoftampa.com/results/1484/Harvest_Jam_13-15_Division">13 to 15 Results 	 </a></li>
<li><a href="http://skateparkoftampa.com/results/1485/Harvest_Jam_16_&_Up_Division">16 & 29 Results</a></li>
<li><a href="http://skateparkoftampa.com/results/1518/Harvest_Jam_30_&_Up">30 & Up Results</a></li>
<li><a href="http://skateparkoftampa.com/results/1487/Harvest_Jam_Sponsored_Division">Sponsored Qualifiers Results</a></li>
<li><a href="http://skateparkoftampa.com/results/1517/Harvest_Jam_Sponsored_Finals">Sponsored Finals Results</a></li>
<li><a href="http://skateparkoftampa.com/results/1519/Harvest_Jam_Just_for_Showing_Up">Just for Showing Up</a></li>

</ul>

</div>



</div>


-->


<div class="BlogPost">

<h2>Upcoming Contests 2017</h2>

<div style="font-weight:bold;">


<ul>


<li><a href="http://skateparkoftampa.com/spot/eventspot.aspx?I=157">Tampa Am - November 9-12</a></li>



</ul>

</div>



</div>






<Products:NewArrivals runat="server" />

<Products:Categories runat="server" />





<div class="BlogPost">
<div class="Ollie"><a href="http://skateparkoftampa.com/spot/dpt.aspx?I=290" >

<img src="http://www.skateparkoftampa.com/spot/images3/DPT-OJWheels.jpg" /></a>
<br />
<h2>Win This Digital Product Toss!</h2>
<a href="http://skateparkoftampa.com/spot/dpt.aspx?I=290">OJ Wheels + Tampa Am Weekend Passes</a>
</div> 
</div>




<div class="BlogPost">
<div class="Ollie">
<h2 style="text-transform:none;">STALK US ON SOCIAL MEDIA @SPoTTAMPA</h2>
</br>
<a target="_blank" href="http://facebook.com/spottampa">
<img src="http://skateparkoftampa.com/spot/images3/FACEBOOK-ICON.png" />
</a>
<a target="_blank" href="http://twitter.com/spottampa">
<img src="http://skateparkoftampa.com/spot/images3/TWIT-ICON.png" />
</a>
<a target="_blank" href="http://instagram.com/spottampa">
<img src="http://skateparkoftampa.com/spot/images3/INSTA-ICON.png" />
</a>
<a target="_blank" href="http://youtube.com/spottampa">
<img src="http://skateparkoftampa.com/spot/images3/YOUTUBE-ICON.png" />
</a>

<img src="http://skateparkoftampa.com/spot/images3/SNAP-ICON.png" />

<div style="clear:both;"></div>
</br>

<a href="http://skateparkoftampa.com/subscribe">Want more?
</br>
Subscribe to our Mailing Lists</a>
</div>
</div>
    </div>
   

</asp:Content>


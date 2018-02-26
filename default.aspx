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

				<!-- SLIDER EXAMPLE -->
		<section class="home-slider">
			<article class="content">
			

<div id="rev_slider_1078_1_wrapper" class="rev_slider_wrapper fullwidthbanner-container" data-alias="classic4export" data-source="gallery" style="margin:0px auto;background-color:transparent;padding:0px;margin-top:0px;margin-bottom:0px;">
<!-- START REVOLUTION SLIDER 5.4.1 auto mode -->
	<div id="rev_slider_1078_1" class="rev_slider fullwidthabanner" style="display:none;" data-version="5.4.1">
<ul>	<!-- SLIDE  -->
	<li data-index="rs-3045" data-transition="boxslide" data-link="/tickets" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut" data-masterspeed="2000"  data-thumb="../../assets/images/datcolor-100x50.jpg"  data-rotate="0"  data-fstransition="fade" data-fsmasterspeed="1500" data-fsslotamount="7" data-saveperformance="off"  data-title="Tampa Pro" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
		<!-- MAIN IMAGE -->
		<img src="http://skateparkoftampa2.com/spot/imagescorey/pro18-slider-image.png"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
	</li>
    <!-- SLIDE  -->
	<li data-index="rs-3046" data-transition="slotslide-vertical" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut" data-masterspeed="2000"  data-thumb="../../assets/images/datcolor-100x50.jpg"  data-rotate="0"  data-fstransition="fade" data-fsmasterspeed="1500" data-fsslotamount="7" data-saveperformance="off"  data-title="MOB" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
		<!-- MAIN IMAGE -->
		<img src="http://skateparkoftampa2.com/spot/imagescorey/mob-grip-slider.jpg"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
	</li>
    <!-- SLIDE  -->
	<li data-index="rs-3047" data-transition="boxfade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut" data-masterspeed="2000"  data-thumb="../../assets/images/datcolor-100x50.jpg"  data-rotate="0"  data-fstransition="fade" data-fsmasterspeed="1500" data-fsslotamount="7" data-saveperformance="off"  data-title="Wheels" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
		<!-- MAIN IMAGE -->
		<img src="http://skateparkoftampa2.com/spot/imagescorey/oj-wheels-slider.jpg"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
	</li>
    <!-- SLIDE  -->
	<li data-index="rs-3048" data-transition="slotslide-horizontal" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut" data-masterspeed="2000"  data-thumb="../../assets/images/datcolor-100x50.jpg"  data-rotate="0"  data-fstransition="fade" data-fsmasterspeed="1500" data-fsslotamount="7" data-saveperformance="off"  data-title="Santa Cruz" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
		<!-- MAIN IMAGE -->
		<img src="http://skateparkoftampa2.com/spot/imagescorey/santa-cruz-skateboards-slider.jpg"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
	</li>
</ul>
<div class="tp-bannertimer" style="height: 7px; background-color: rgba(255, 255, 255, 0.25);"></div>	</div>
</div><!-- END REVOLUTION SLIDER -->
		<script type="text/javascript">
            var tpj = jQuery;

            var revapi1078;
            tpj(document).ready(function () {
                if (tpj("#rev_slider_1078_1").revolution == undefined) {
                    revslider_showDoubleJqueryError("#rev_slider_1078_1");
                } else {
                    revapi1078 = tpj("#rev_slider_1078_1").show().revolution({
                        sliderType: "standard",
                        jsFileLocation: "revolution/js/",
                        sliderLayout: "auto",
                        dottedOverlay: "none",
                        delay: 9000,
                        navigation: {
                            keyboardNavigation: "off",
                            keyboard_direction: "horizontal",
                            mouseScrollNavigation: "off",
                            mouseScrollReverse: "default",
                            onHoverStop: "off",
                            touch: {
                                touchenabled: "on",
                                swipe_threshold: 75,
                                swipe_min_touches: 1,
                                swipe_direction: "horizontal",
                                drag_block_vertical: false
                            }
                            ,
                            arrows: {
                                style: "gyges",
                                enable: true,
                                hide_onmobile: true,
                                hide_under: 600,
                                hide_onleave: true,
                                hide_delay: 200,
                                hide_delay_mobile: 1200,
                                tmp: '<div class="tp-title-wrap">  	<div class=""></div> </div>',
                                left: {
                                    h_align: "left",
                                    v_align: "center",
                                    h_offset: 30,
                                    v_offset: 0
                                },
                                right: {
                                    h_align: "right",
                                    v_align: "center",
                                    h_offset: 30,
                                    v_offset: 0
                                }
                            }
                            ,
                            bullets: {
                                enable: true,
                                hide_onmobile: true,
                                hide_under: 600,
                                style: "persephone",
                                hide_onleave: true,
                                hide_delay: 200,
                                hide_delay_mobile: 1200,
                                direction: "horizontal",
                                h_align: "center",
                                v_align: "bottom",
                                h_offset: 0,
                                v_offset: 30,
                                space: 5,
                                
                            }
                        },
                        viewPort: {
                            enable: true,
                            outof: "pause",
                            visible_area: "80%",
                            presize: false
                        },
                        responsiveLevels: [1240, 1024, 778, 480],
                        visibilityLevels: [1240, 1024, 778, 480],
                        gridwidth: [1170, 1024, 778, 250],
                        gridheight: [377, 377, 377, 160],
                        lazyType: "none",
                        parallax: {
                            type: "mouse",
                            origo: "slidercenter",
                            speed: 2000,
                            levels: [2, 3, 4, 5, 6, 7, 12, 16, 10, 50, 46, 47, 48, 49, 50, 55],
                            type: "mouse",
                        },
                        shadow: 0,
                        spinner: "off",
                        stopLoop: "off",
                        stopAfterLoops: -1,
                        stopAtSlide: -1,
                        shuffle: "off",
                        autoHeight: "off",
                        hideThumbsOnMobile: "off",
                        hideSliderAtLimit: 0,
                        hideCaptionAtLimit: 0,
                        hideAllCaptionAtLilmit: 0,
                        debugMode: false,
                        fallbacks: {
                            simplifyAll: "off",
                            nextSlideOnWindowFocus: "off",
                            disableFocusListener: false,
                        }
                    });
                }
            });	/*ready*/
		</script>
		

				</article>
		</section>
        <div class="row text-center">
        <div class="col-sm-12">
            <h1 id="home-cat-title">POPULAR CATEGORIES</h1>
        </div>
            </div>
    <div id="home-cat-grey-bg">
    <div class="row text-center home-cats">
        <div class="col-sm-3 home-cat">
            <a href="/shoes">
                <img src="http://skateparkoftampa2.com/spot/imagescorey/shoes.jpg" class="img-responsive img-center"/>
                <span>SHOES</span>
            </a>
        </div>
        <div class="col-sm-3 home-cat">
            <a href="/boards">
                <img src="http://skateparkoftampa2.com/spot/imagescorey/decks.jpg" class="img-responsive img-center"/>
                <span>DECKS</span>
            </a>
        </div> 
        <div class="col-sm-3 home-cat">
            <a href="/trucks">
                <img src="http://skateparkoftampa2.com/spot/imagescorey/trucks.jpg" class="img-responsive img-center"/>
                <span>TRUCKS</span>
            </a>
        </div> 
        <div class="col-sm-3 home-cat">
            <a href="/wheels">
                <img src="http://skateparkoftampa2.com/spot/imagescorey/wheels.jpg" class="img-responsive img-center"/>
                <span>WHEELS</span>
            </a>
        </div> 
    </div>
    <div class="row text-center home-cats">
    <div class="col-sm-3 home-cat">
        <a href="/tshirts">
            <img src="http://skateparkoftampa2.com/spot/imagescorey/clothing.jpg" class="img-responsive img-center"/>
            <span>CLOTHING</span>
        </a>
    </div>
    <div class="col-sm-3 home-cat">
        <a href="/pads_and_helmets">
            <img src="http://skateparkoftampa2.com/spot/imagescorey/safety.jpg" class="img-responsive img-center"/>
            <span>SAFETY</span>
        </a>
    </div> 
    <div class="col-sm-3 home-cat">
        <a href="/accessories">
            <img src="http://skateparkoftampa2.com/spot/imagescorey/accessories.jpg" class="img-responsive img-center"/>
            <span>ACCESSORIES</span>
        </a>
    </div> 
    <div class="col-sm-3 home-cat">
        <a href="/skateboards">
            <img src="http://skateparkoftampa2.com/spot/imagescorey/completes.jpg" class="img-responsive img-center"/>
            <span>COMPLETES</span>
        </a>
    </div> 
</div>
     <!-- <div class="row text-center" style="height: 100px; margin-top: 37px;">
        <h2><a href="http://skateparkoftampa2.com/shoes_and_skateboards" class="home viewmore">View More Categories</a></h2>
            </div> -->
        </div>
    <div class="text-center social-home">
        <a href="https://www.instagram.com/spottampa/"><i class="fa fa-instagram"></i></a>
        <a href="https://www.facebook.com/spottampa"><i class="fa fa-facebook-f"></i></a>
        <a href="https://twitter.com/spottampa"><i class="fa fa-twitter"></i></a>
        <a href="https://www.youtube.com/spottampa"><i class="fa fa-youtube"></i></a>
        <a href=""><i class="fa fa-snapchat-ghost"></i></a>
    </div>
    <div class="row">
        <div class="col-sm-12 shipping-banner text-center">
            <h5 class="shipping-banner-title">FREE SHIPPING ON ORDERS OVER $60</h5>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" Runat="Server">

    <Products:NewArrivals runat="server" />

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

<h2>Upcoming Contests 2018</h2>

<div style="font-weight:bold;">

<ul>

<li><a href="http://skateparkoftampa.com/spot/eventspot.aspx?I=157">Tampa Am - November 9-12</a></li>

</ul>

</div>



</div>



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




<!-- <Products:Categories runat="server" /> -->





<div class="BlogPost">
<div class="Ollie"><a href="http://skateparkoftampa.com/spot/dpt.aspx?I=290" >

<img src="http://www.skateparkoftampa.com/spot/images3/DPT-OJWheels.jpg" /></a>
<br />
<h2>Win This Digital Product Toss!</h2>
<a href="http://skateparkoftampa.com/spot/dpt.aspx?I=290">OJ Wheels + Tampa Am Weekend Passes</a>
</div> 
</div>




<!-- 
    removed per chris request 2-22-2018
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
</div> -->

   

</asp:Content>


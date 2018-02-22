<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="p.aspx.cs" Inherits="p" %>
<%@ Register Src="control_categorylist.ascx" TagName="Categories" TagPrefix="Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="<%=strTitle %>: <%=strLongDescriptionMeta %> All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="<%=strTitle %> in stock at SPoT Skate Shop">
<meta itemprop="description" content="<%=strLongDescriptionMeta %> All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="http://skateparkoftampa.com/spot/<%=strImageURL %>">

<meta property="og:title" content="<%=strTitle %> in stock at SPoT Skate Shop"/>
<meta property="og:type" content="product"/>
<meta property="og:image" content="http://skateparkoftampa.com/spot/<%=strImageURL %>"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="<%=strTitle %>: <%=strLongDescriptionMeta %> All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>

    <%if (strProductId.Equals("73451"))
    { %>
     <meta name="robots" content="noindex">
    <%} %>

<script language="javascript" type="text/javascript">
    $(document).ready(function () {

        //$("#" + getParameterByName("CID"))

        $("#ColorID" + getParameterByName("CID")).appendTo("#TopDiv");


        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
            var regexS = "[\\?&]" + name + "=([^&#]*)";
            var regex = new RegExp(regexS);
            var results = regex.exec(window.location.href);
            if (results == null)
                return "";
            else
                return decodeURIComponent(results[1].replace(/\+/g, " "));
        }


        $(".CartAddLinks").click(function () {
            try {
                //alert("this attr innerHTML is: " + $(this).attr("innerHTML"));
                var strSizeDescription;
                //alert("Size Descr should be: " + $(this).attr("text").replace("Add to Cart: ", ""));
                strSizeDescription = $(this).text().replace("ADD TO CART:", "");
                //alert($(this).text());

                //alert($(this).attr("id").substring($(this).attr("id").indexOf("ID") + 2, $(this).attr("id").length));
                var divToShow = $(this).attr("id").substring($(this).attr("id").indexOf("ID") + 2, $(this).attr("id").length);
                //first, hide all divs with class CartAddedAlert in case one's already showing from another click
                $(".CartAddedAlert").hide();
                var intInventoryID;
                var intItems;
                var fltCartValue;
                intInventoryID = $(this).attr("id").substring(0, $(this).attr("id").indexOf("ID"));
                //alert(intInventoryID);
                //alert("size is " + strSizeDescription);
                $.ajax({
                    url: "ajax/cart_ajax.aspx?InventoryID=" + intInventoryID,
                    error: function () {
                        $("#" + divToShow).html("Aw snappp, error adding that item to your cart.  Crap! Email us and we can help: info@skateparkoftampa.com");
                        $("#" + divToShow).fadeIn();
                    },
                    success: function (data) {
                        //data is pipe delimited   status|items|total
                        var strReply = data.split("|");
                        //alert(strReply[0]);
                        //in some browsers, somehow strSizeDescription is null, causing an error, so leave it out if so
                        if (strSizeDescription == null) {
                            $("#" + divToShow).html(strReply[0] + "<br />Items in your cart: " + strReply[1] + ". Total: " + strReply[2] + "<br /><a href=\"cart.aspx\">View Your Cart</a> or <a href=\"checkout.aspx\">Checkout Now</a>");
                            
                        }
                        else {
                            if (strSizeDescription == "ADD TO CART") {
                                $("#" + divToShow).html(strReply[0] + "<br />Items in your cart: " + strReply[1] + ". Total: " + strReply[2] + "<br /><a href=\"cart.aspx\">View Your Cart</a> or <a href=\"checkout.aspx\">Checkout Now</a>");
                                
                            }
                            else {
                                
                                $("#" + divToShow).html("Size " + strSizeDescription + ": " + strReply[0] + "<br />Items in your cart: " + strReply[1] + ". Total: " + strReply[2] + "<br /><a href=\"cart.aspx\">View Your Cart</a> or <a href=\"checkout.aspx\">Checkout Now</a>");
                            }
                        }

                        $("#" + divToShow).fadeIn();
                        //also, update the cart summary in the upper right
                        $("#CartSummary").html(strReply[1] + " Items");
                    },
                    type: "get"
                });
                return false;

            }
            catch (e) {
                //do nothing - let the click go through
            }

        });




        //if some colorways on this page have alternate images, replace the default with the actual images
        //fallback/no javascript is this:
        /*
        <div class="AlternateImagesAvailable" id="Alternate196" name="Alternate196">
                <a href="pc.aspx?ID=53072&CID=196">View additional images for this colorway!</a>
            </div>
        */
        //so, we're replacing the html for all divs of class AlternateImagesAvailable with an ajax call to get the data
        var strProductID = "<%=Request.QueryString["ID"] %>";
        $(".AlternateImagesAvailable").each(function () {
            var strColorID;
            var strDiv;
            //alert(this.id);
            //get color id
            strColorID = this.id.substring(9, this.id.length);
            //alert(strColorID);
            //alert($("#" + this.id).html());
            //$("#" + this.id).html("ajax_productcolorwayaltimages.aspx?ID=" + strProductID + "&CID=" + strColorID);
            strDiv = this.id;
            $.ajax({
		        url: "ajax/ajax_productcolorwayaltimages.aspx?ID=" + strProductID + "&CID=" + strColorID,
		        error: function () {
		            $("#" + strDiv).html("Sorry, error getting extra colorways.");
		        },
		        success: function (data) {
		            //alert(data);
		            $("#" + strDiv).html(data);
		        },
		        type: "get"
		    });
        });

        
        $('a[id*="AltImage"]').live('click', function(e) {
            e.preventDefault();
            //alert(this.id);
            var strColorwayPhotoID;
            strColorwayPhotoID = this.id.substring(8, this.id.indexOf("_"));
            var strColorID = this.id.substring(this.id.indexOf("_") + 8, this.id.length);
            //alert(strColorwayPhotoID);
            //alert(strColorID);
            $("#Main" + strColorID).attr("src", "http://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>ProductColorwayImages/" + strColorwayPhotoID + ".jpg");
                
        });

        $('img[id*="Main"]').live('click', function(e) {
            e.preventDefault();
            //alert(this.id);
            var strProductID = "<%=Request.QueryString["ID"] %>";
            var strColorID = this.id.substring(4, this.id.length);
            //alert(strColorwayPhotoID);
            //alert(strColorID);
            $("#" + this.id).attr("src", "http://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>productimages/colors/" + strColorID + "_" + strProductID + ".jpg");
                
        });

        
    });
</script>



</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">



<div class="BlogPost">
    <div class="row">
    <div class="col-md-8"><h1 class="product-title"><%=strTitle %></h1></div>

<div class="col-md-4" style="padding-top:28px; text-align: center;">
                
        <span class="counter-fb-like">
            <iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fskateparkoftampa.com%2Fspot%2Fp.aspx%3FID%3D<%=Request.QueryString["ID"] %>&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21&amp;appId=128422270572394" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:100px; height:21px;" allowTransparency="true"></iframe>
        </span>
        <span class="counter-twitter">
            <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://skateparkoftampa.com/spot/p.aspx?ID=<%=Request.QueryString["ID"] %>" data-count="horizontal" data-via="SPoTTampa">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
        </span>
</div>
        </div>
<%=strLongDescription %>



        <div style="color:red; font-weight:bold;">
            <asp:Label runat="server" ID="lblOutOfStockMessage" />
        </div>
        
        <asp:Repeater runat="server" ID="rptMain" OnItemDataBound="rptMain_ItemDataBound">
        <HeaderTemplate><div id="TopDiv" style="margin:0px; padding:0px;"></div></HeaderTemplate>
        <ItemTemplate>
            
            <div class="SizeSelectionGridMain" id="ColorID<%#Eval("ColorID") %>">
                <div class="BlogPost ShoeSizeGrid" style="border-bottom: solid 0px white;">
                    <div class="row">
                    <div class="col-md-8">
                        <img class="img-responsive img-center" id="Main<%#Eval("ColorID") %>" 
                        src="http://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>productimages/colors/<%#Eval("ColorID") %>_<%=Request.QueryString["ID"] %>.jpg" />
                    </div>
                    <div class="col-md-4">
                        <div style="font-weight:bold; text-align:center; font-size: 1.2em;"><%#Eval("CurrentPrice", "{0:c}") %></div> <%#Eval("SaleNote") %>
                            <div style="font-weight:bold; text-align:center;">
                            Color: <%#Eval("Color") %></div>
                            <div style="text-align:center;">
                            Sizes in Stock:</div>

                        <div>
                            <asp:Repeater runat="server" ID="rptSub">
                                <ItemTemplate>
                                    <div class="<%=strCssClass %>">
                                    <a class="CartAddLinks" id="<%#Eval("InventoryID") %>ID<%#Eval("ColorID") %>_<%=Request.QueryString["ID"] %>" href="shop_cart_add.aspx?InventoryID=<%#Eval("InventoryID") %>">
                                        <%=strAddToCart %> <%#Eval("Size")%>
                                    </a>
                                
                                    <!--
                                        Used to do this server side, now using client side to determine if there's only one size option
                                        If there is only one size option, throw in "Add to Cart"
                                        <%#Eval("Size").ToString().Replace("N/A", "ADD TO CART").Replace("One size fits all", "ADD TO CART")%>
                                    -->
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="FreeShipping">
                                <%#Eval("FreeShipping") %>
                            </div>
                        </div>
                        <div class="CartAddedAlert" id="<%#Eval("ColorID") %>_<%=Request.QueryString["ID"] %>">Click your size to add to your cart.</div>
                    </div>
                </div>

                    <%#Eval("AlternateImages") %>
                    
                </div>
            </div>
        </ItemTemplate>
        </asp:Repeater>
        <asp:Repeater runat="server" ID="rptOutOfStock">
            <ItemTemplate>
                <div class="BlogPost">
                <a name="ColorID<%#Eval("ColorID") %>"></a>
                <div class="SizeSelectionGridMain">
                    <div style="margin:0px; padding:0px;">
                    OUT OF STOCK Color: <%#Eval("Color") %>
                    </div>
                    <div style="margin:0px; padding:0px;">
                        <img id="Main<%#Eval("ColorID") %>" style="margin:0px; padding:0px;" 
                        src="<%#Eval("Photo") %>" />
                    </div>
                    <%#Eval("AlternateImages") %>
                </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>





</div>


<asp:Panel runat="server" ID="pnlBoard" Visible="false">
<div class="BlogPost">
<h1>Related Links</h1>
Need some <a href="/hardware">Hardware</a>, <a href="/trucks">Trucks</a>, <a href="/wheels">Wheels</a>, <a href="/grip">Grip</a>, and <a href="/bearings">Bearings</a> with that deck?

<ul>
<li><a title="<%=strManufacturer %> Products" href="/company/<%=strManufacturerID %>/<%=strManufacturer.Replace("\"", "").Replace(" ", "_") %>">More <%=strManufacturer %> Products</a></li>
<li><a title="<%=strCategory %> Products" href="c.aspx?ID=<%=strCategoryID %>&Description=<%=strCategory %>">Other <%=strCategory %></a></li>
<li><a href="cz.aspx?ID=<%=strCategoryID %>">View <%=strCategory %> by Size</a></li>
<li><a href="cart.aspx">View Cart</a></li>
<li><a href="checkout.aspx">Checkout</a></li>
</ul>

</div>
</asp:Panel>

<asp:Panel runat="server" ID="pnlWheels" Visible="false">
<div class="BlogPost">
<h1>Related Links</h1>
Need some <a href="/bearings">Bearings</a> with those wheels?  Don't forget  <a href="/hardware">Hardware</a>, <a href="/trucks">Trucks</a>, <a href="/decks">Decks</a>, and <a href="/grip">Grip</a>, too.

<ul>
<li><a title="<%=strManufacturer %> Products" href="/company/<%=strManufacturerID %>/<%=strManufacturer.Replace("\"", "").Replace(" ", "_") %>">More <%=strManufacturer %> Products</a></li>
<li><a title="<%=strCategory %> Products" href="c.aspx?ID=<%=strCategoryID %>&Description=<%=strCategory %>">Other <%=strCategory %></a></li>
<li><a href="cz.aspx?ID=<%=strCategoryID %>">View <%=strCategory %> by Size</a></li>
<li><a href="cart.aspx">View Cart</a></li>
<li><a href="checkout.aspx">Checkout</a></li>
</ul>

</div>
</asp:Panel>

<asp:Panel runat="server" ID="pnlTrucks" Visible="false">
<div class="BlogPost">
<h1>Related Links</h1>
Need some <a href="/wheels">wheels</a> with those trucks?  Don't forget  <a href="/hardware">Hardware</a>, <a href="/bearings">Bearings</a>, <a href="/decks">Decks</a>, and <a href="/grip">Grip</a>, too.

<ul>
<li><a title="<%=strManufacturer %> Products" href="/company/<%=strManufacturerID %>/<%=strManufacturer.Replace("\"", "").Replace(" ", "_") %>">More <%=strManufacturer %> Products</a></li>
<li><a title="<%=strCategory %> Products" href="c.aspx?ID=<%=strCategoryID %>&Description=<%=strCategory %>">Other <%=strCategory %></a></li>
<li><a href="cz.aspx?ID=<%=strCategoryID %>">View <%=strCategory %> by Size</a></li>
<li><a href="cart.aspx">View Cart</a></li>
<li><a href="checkout.aspx">Checkout</a></li>
</ul>

</div>
</asp:Panel>

<asp:Panel runat="server" ID="pnlBearings" Visible="false">
<div class="BlogPost">
<h1>Related Links</h1>
New bearings without <a href="/wheels">new wheels</a>??? Don't run it like that!

<ul>
<li><a title="<%=strManufacturer %> Products" href="/company/<%=strManufacturerID %>/<%=strManufacturer.Replace("\"", "").Replace(" ", "_") %>">More <%=strManufacturer %> Products</a></li>
<li><a title="<%=strCategory %> Products" href="c.aspx?ID=<%=strCategoryID %>&Description=<%=strCategory %>">Other <%=strCategory %></a></li>
<li><a href="cz.aspx?ID=<%=strCategoryID %>">View <%=strCategory %> by Size</a></li>
<li><a href="cart.aspx">View Cart</a></li>
<li><a href="checkout.aspx">Checkout</a></li>
</ul>

</div>
</asp:Panel>



<asp:SqlDataSource runat="server" ID="sdsAddional" SelectCommand="SPOT2012ProductExtraImages" 
SelectCommandType="StoredProcedure" ConnectionString="<%$ ConnectionStrings:CS %>"
    EnableCaching="true" CacheDuration="10000">
    <SelectParameters>
        <asp:QueryStringParameter Name="ProductID" QueryStringField="ID" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:Repeater runat="server" DataSourceID="sdsAddional" ID="rptAdditional">
<HeaderTemplate><h2>Additional Photos of <%=strTitle %></h2></HeaderTemplate>
<ItemTemplate>
<div class="BlogPost" style="text-align:center;">
    <h2><%# Eval("Description")%></h2>
    <img src="http://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>productimages/<%# Eval("AlternateImageID")%>.jpg" />
</div>
</ItemTemplate>
</asp:Repeater>



<!--<asp:Panel runat="server" ID="pnlCompletesVideo" Visible="false">
<div class="BlogPost">
    <h1>New To Skateboarding?  Let Us Explain</h1>
    We have a recurring feature on our site called A Case of the Mondays where we break down new arrivals in our Shop.
    This week, AlBow aka MP3J broke down the differences in types of skateboards.  Some are for tricks, some are for cruising.
    Get a quick lesson here:
    <div class="Ollie">
        <iframe src="http://player.vimeo.com/video/57398785?title=0&amp;byline=0&amp;portrait=0&amp;color=cc0000" width="800" height="450" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
    </div>
</div>
</asp:Panel>-->





<asp:SqlDataSource runat="server" ID="sdsRelated" SelectCommand="SPOT2012ProductRelated" 
SelectCommandType="StoredProcedure" ConnectionString="<%$ ConnectionStrings:CS %>"
    EnableCaching="true" CacheDuration="10000">
    <SelectParameters>
        <asp:QueryStringParameter Name="ProductID" QueryStringField="ID" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:Repeater runat="server" ID="rptRelated" DataSourceID="sdsRelated">
<HeaderTemplate>
    
    <div class="BlogPost">
    <h1>Related Products</h1>
</HeaderTemplate>
<ItemTemplate>
    <div class="col-xs-6 col-md-3 NewArrivalSmallBlock">
    <a 
        href="/product/<%#Eval("RelatedProductID") %>/<%#Eval("ShortDescr").ToString().Replace("\"", "").Replace(" ", "_").Replace(":", "") %>">
        <img class="img-responsive img-center" src="http://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>productimages/colors/<%# Eval("ColorID")%>_<%# Eval("RelatedProductID")%>thumb.jpg" />
    </a><br />
    <a 
        href="/product/<%#Eval("RelatedProductID") %>/<%#Eval("ShortDescr").ToString().Replace("\"", "").Replace(" ", "_").Replace(":", "") %>">
        <%# Eval("ShortDescr")%>
    </a>
    
    </div>
</ItemTemplate>
<FooterTemplate>
    </div>
</FooterTemplate>
</asp:Repeater>


<div class="BlogPost">

<form 
action="http://feedburner.google.com/fb/a/mailverify" method="post" target="popupwindow" 
onsubmit="window.open('http://feedburner.google.com/fb/a/mailverify?uri=SPoTNewShoes&loc=en_US', 'popupwindow', 'scrollbars=yes,width=550,height=520');return true">
<h1>Get An Email Every Time We Add New Shoes</h1>
Enter your email: <input type="text" style="width:200px; font-size:18px; font-weight:bold;" name="email"/> <input type="hidden" value="spotnewshoes" name="uri"/><input type="hidden" name="loc" value="en_US"/><input style="margin-top:2px; font-size:18px; font-weight:bold;" type="submit" value="Subscribe" />

<a href="https://feedburner.google.com/fb/a/mailverify?uri=SPoTNewShoes&amp;loc=en_US"><img src="http://feeds.feedburner.com/~fc/SPoTNewShoes?bg=FF3300&amp;fg=FFFFFF&amp;anim=0" height="26" width="88" style="border:0;" alt="" /></a>
<div>
    Most of you are here to check out new shoes.  Who isn't a fan of new kicks?  We will send you a summary of all new shoes

        we've received for the day so you can come up before they're sold out.
</div>
</form>





<form 
action="http://feedburner.google.com/fb/a/mailverify" method="post" target="popupwindow" 
onsubmit="window.open('https://feedburner.google.com/fb/a/mailverify?uri=SPoTNewProducts&amp;loc=en_US', 'popupwindow', 'scrollbars=yes,width=550,height=520');return true">
<h1>Get An Email Every Time We Add New Products</h1>
Enter your email: <input type="text" style="width:200px; font-size:18px; font-weight:bold;" name="email"/> <input type="hidden" value="spotnewproducts" name="uri"/><input type="hidden" name="loc" value="en_US"/><input style="margin-top:2px; font-size:18px; font-weight:bold;" type="submit" value="Subscribe" />

<a href="https://feedburner.google.com/fb/a/mailverify?uri=SPoTNewProducts&amp;loc=en_US"><img src="http://feeds.feedburner.com/~fc/spotnewproducts?bg=FF3300&amp;fg=FFFFFF&amp;anim=0" height="26" width="88" style="border:0;" alt="" /></a>
<div>
    We are constantly getting new products in. Stay on top of them by subscribing here.
</div>
</form>

</div>



</asp:Content>







<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">


<asp:Panel runat="server" ID="pnlShoeSizes" Visible="false">
<div class="BlogPost ShoeSizeGrid">
    <h2>View Other Shoes in Your Size</h2>
    <div class="SizeSelectionGridItemSmall"><a title="Size 5 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=6">5</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 5.5 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=7">5.5</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 6 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=8">6</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 6.5 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=9">6.5</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 7 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=10">7</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 7.5 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=11">7.5</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 8 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=12">8</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 8.5 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=13">8.5</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 9 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=14">9</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 9.5 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=15">9.5</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 10 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=16">10</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 10.5 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=17">10.5</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 11 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=18">11</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 11.5 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=19">11.5</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 12 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=20">12</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 13 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=22">13</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 14 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=24">14</a></div>
    <div class="SizeSelectionGridItemSmall"><a title="Size 15 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=26">15</a></div>
</div>
</asp:Panel>



<div class="BlogPost">
<h1>Related Links</h1>
<ul>
<li><a title="<%=strManufacturer %> Products" href="/company/<%=strManufacturerID %>/<%=strManufacturer.Replace("\"", "").Replace(" ", "_") %>">More <%=strManufacturer %> Products</a></li>
<li><a title="<%=strCategory %> Products" href="c.aspx?ID=<%=strCategoryID %>&Description=<%=strCategory %>">Other <%=strCategory %></a></li>
<li><a href="cz.aspx?ID=<%=strCategoryID %>">View <%=strCategory %> by Size</a></li>

    <asp:SqlDataSource runat="server" ID="sdsFlags" SelectCommand="SPOT2012ProductGetFlags" SelectCommandType="StoredProcedure" ConnectionString="<%$ConnectionStrings:CS %>">
<SelectParameters>
    <asp:QueryStringParameter QueryStringField="ID" Name="ProductID" />
</SelectParameters>
</asp:SqlDataSource>
<asp:Repeater runat="server" ID="rptFlags" DataSourceID="sdsFlags">
<ItemTemplate>
    <li>
    <a title="<%#Eval("Description") %>" href="f.aspx?ID=<%#Eval("FlagID") %>&D=<%#Eval("Description") %>"><%#Eval("Description")%></a>
        <div class="NotesAndTips" style="margin-left:10px;"><%#Eval("SearchTextDescription")%></div>
    </li>
</ItemTemplate>
</asp:Repeater>

<li><a href="/cart">View Cart</a></li>
<li><a href="checkout.aspx">Checkout</a></li>
</ul>


<asp:SqlDataSource runat="server" ID="sdsSkater" SelectCommand="SPOT2012ProductSkaterProfile" SelectCommandType="StoredProcedure"
ConnectionString="<%$ ConnectionStrings:CS %>">
<SelectParameters><asp:QueryStringParameter Name="ProductID" QueryStringField="ID" /></SelectParameters>
</asp:SqlDataSource>
<asp:Repeater runat="server" ID="rptSkater" DataSourceID="sdsSkater">
<ItemTemplate>
<h2>About <%#Eval("FirstName") %> <%#Eval("LastName") %></h2>
<div class="NotesAndTips" style="text-align:center;">
<b><%#Eval("FirstName") %> <%#Eval("LastName") %></b> from <%#Eval("City") %> <%#Eval("State") %> rides for 
<%#Eval("Sponsors") %>. <a href="/skater/<%#Eval("SkaterID") %>/<%#Eval("FirstName").ToString().Replace("\"", "") %>_<%#Eval("LastName").ToString().Replace("\"", "") %>"><%#Eval("FirstName") %> <%#Eval("LastName") %> Skater Profile</a>.
</div>
<div style="text-align:center;">
    <a title="<%#Eval("FirstName").ToString().Replace("\"", "") %> <%#Eval("LastName").ToString().Replace("\"", "") %>" href="/skater/<%#Eval("SkaterID") %>/<%#Eval("FirstName").ToString().Replace("\"", "") %>_<%#Eval("LastName").ToString().Replace("\"", "") %>">
    <img class="img-responsive img-center" title="<%#Eval("FirstName").ToString().Replace("\"", "") %> <%#Eval("LastName").ToString().Replace("\"", "") %>" src="http://www.skateparkoftampa.com/spot/headshots/<%# Eval("SkaterID") %>.jpg" width="250" height="250" /></a>
</div>
</ItemTemplate>
</asp:Repeater>

<a href="/company/<%=strManufacturerID %>/<%=strManufacturer.Replace("\"", "").Replace(" ", "_") %>">
    <img class="img-responsive img-center" title="<%=strTitle %>" alt="<%=strTitle %>" src="http://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>productimages/<%=strManufacturerID %>mfgr.jpg"  />
</a>
</div>




<Products:Categories runat="server" />



<div class="BlogPost CategoryListSmall">
<h1>Additional Products</h1>
    <asp:SqlDataSource runat="server" ID="sdsFlagsMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOTSHOPProductGetFullFlagList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="10000" />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsFlagsMenu">
        <ItemTemplate>
            | <a title="<%# Eval("SearchTextDescription").ToString().Replace("\"", "")%>" 
	            href="f.aspx?ID=<%# Eval("FlagID")%>">
                <%# Eval("Description")%>
            </a>
        </ItemTemplate>
        <FooterTemplate>  </FooterTemplate>
    </asp:Repeater>
</div>







</asp:Content>


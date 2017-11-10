<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="dpt.aspx.cs" Inherits="dpt" %>
<%@ Register Src="control_categorylist.ascx" TagName="Categories" TagPrefix="Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="Digital Product Toss at Skatepark of Tampa: We have regular skateboarding giveaways and free stuff here all the time for our Digital Product Tosses. They're very simple to get in on.  Throw digital elbows and catch some gear!">
<meta itemprop="name" content="Digital Product Toss at SPoT Skate Shop at Skatepark of Tampa">
<meta itemprop="description" content="Digital Product Toss at SPoT Skate Shop: We have regular skateboarding giveaways and free stuff here all the time for our Digital Product Tosses. They're very simple to get in on.  Throw digital elbows and catch some gear!">
<meta itemprop="image" content="<%=strImage %>">

<meta property="og:title" content="Digital Product Toss at SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:type" content="blog"/>
<meta property="og:image" content="<%=strImage %>"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="We have regular skateboarding giveaways and free stuff here all the time for our Digital Product Tosses. They're very simple to get in on.  Throw digital elbows and catch some gear!"/>

<script type="text/javascript" language="javascript">

    $(document).ready(function () {
        //first, hide the no javascript message if they support javascript
        $("#NoJavaScriptDIV").css("display", "none");
        $("#EntryForm").css("display", "block");
        $("#SubmitDPT").click(function () {
            /*
            //need to validate email and make sure textbox is 140 or less
			
            alert("email.aspx?" + "txtName=" + $("#txtName").attr("value").replace("'", "") +
            "&txtRequest=" + $("#txtRequest").attr("value").replace("'", ""));
            */
            if (ValidEmail($("#txtEmail").attr("value")) && $("#txtEmail").attr("value") != "") {
                $("#InvalidDIV").fadeOut();
                $.ajax({
                    url: "dpt_ajax.aspx?DPTID=" + $("#txtDPTID").attr("value") + "&" + "txtEmail=" + $("#txtEmail").attr("value").replace("'", "") +
						"&txtComment=" + $("#txtComment").attr("value").replace("'", ""),
                    error: function () {
                        $("#ErrorDiv").fadeIn();

                    },
                    success: function (data) {
                        $("#EntryForm").fadeOut();
                        $("#Confirmation").fadeIn();
                        $("#Confirmation").html("<h1>Thanks!</h1>" + data);
                    },
                    type: "get"
                });
            }
            else {
                $("#InvalidDIV").fadeIn();
            }

        });

        function ValidEmail(strEmail) {
            var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            if (!emailReg.test(strEmail)) {
                return false;
            } else {
                return true;
            }
        }

        $('#txtComment').each(function () {
            var inp = $(this);
            var maxlen = inp.attr('maxlength');
            if (maxlen > 0) {
                inp.bind('keyup', function (e) {
                    len = new Number(inp.val().length);
                    counter = maxlen - len;
                    counterObj = '#' + inp.attr('id') + '-counter';
                    $(counterObj).text(counter);
                });
            }
        });

    });

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">

<asp:Panel runat="server" ID="pnlList">
<div class="BlogPost">
<img src="http://www.skateparkoftampa.com/spot/images5/vdproducttosskostondeck.gif" style="float:right; width:150px; margin:10px;" />
<h1>What's a DPT?</h1>
A Digital Product Toss is where <a href="http://www.skateparkoftampa.com/spot/phi.aspx?I=26352">we do this</a>, except online.  Your favorite companies send us stuff and we put it up for Digital Product Toss here.
Check back on the regular or <a href="http://feedburner.google.com/fb/a/mailverify?uri=spotwhatsup&loc=en_US">join our mailing list</a> and you'll be in on every Toss.  Throw digital elbows!
</div>

<asp:SqlDataSource runat="server" ID="sdsCurrent" SelectCommand="SPOTDPTCurrent" SelectCommandType="StoredProcedure" 
ConnectionString="<%$ConnectionStrings:CS %>" EnableCaching="true" CacheDuration="600" />
<asp:Repeater runat="server" ID="rptCurrent" DataSourceID="sdsCurrent">
<HeaderTemplate>
<div class="BlogPost">
<h1>Current Digital Product Tosses</h1>
Below are currently open Digital Product Tosses.  Click "Dive In" to get in on it before they end. DPT's are only available to people in the continental US.
</HeaderTemplate>
<ItemTemplate>
	<h2 style="margin:0px;"><a href="dpt.aspx?I=<%#Eval("DPTID") %>"><%#Eval("Title") %></a></h2>
	<div style="margin:0px 0px 15px 15px;">
	<b>Ends on <%#Eval("EndDate", "{0:D}") %></b><br />
	<%#Eval("MetaDescription") %> [<a href="dpt.aspx?I=<%#Eval("DPTID") %>">Dive In!</a>]
	</div>
</ItemTemplate>
<FooterTemplate><%=strNone %></div></FooterTemplate>
</asp:Repeater>




<asp:SqlDataSource runat="server" ID="sdsPast" SelectCommand="SPOTDPTPast" SelectCommandType="StoredProcedure" 
ConnectionString="<%$ConnectionStrings:CS %>" EnableCaching="true" CacheDuration="5000" />
<asp:Repeater runat="server" ID="rptPast" DataSourceID="sdsPast">
<HeaderTemplate><div class="BlogPost"><h1>Past Digital Product Tosses</h1>
Below are past Digital Product Tosses.  Check back often or <a href="http://www.skateparkoftampa.com/spot/rssinfo.aspx">join our mailing list</a> to stay in touch.


</HeaderTemplate>
<ItemTemplate>
	 <%# (Container.ItemIndex + 2) % 2 == 0 ? "<div class='row'>" : string.Empty %>
    <div class="col-sm-6">
	<div class="BlogPost" style="border-bottom: solid 0px black;">
    <h2 style="margin:0px;"><a href="dpt.aspx?I=<%#Eval("DPTID") %>"><%#Eval("Title") %></a></h2>
	<b>Ended on <%#Eval("EndDate", "{0:D}") %></b><br />
	<%#Eval("MetaDescription") %>
    </div>
        </div>
    <%# (Container.ItemIndex + 2) % 2 == 1 ? "</div>" : string.Empty %>
</ItemTemplate>
<FooterTemplate></div></div></FooterTemplate>
</asp:Repeater>


</asp:Panel>


<asp:Panel runat="server" ID="pnlDetail">
<asp:SqlDataSource runat="server" ID="sdsInfo" SelectCommand="SPOTDPTInfo" SelectCommandType="StoredProcedure" ConnectionString="<%$ConnectionStrings:CS %>">
<SelectParameters><asp:QueryStringParameter Name="DPTID" QueryStringField="I" /></SelectParameters>
</asp:SqlDataSource>
<asp:Repeater runat="server" ID="rptInfo" DataSourceID="sdsInfo">
<ItemTemplate>
<div class="BlogPost">
<h1>SPoT Digital Product Toss: <%#Eval("Title") %></h1>
	
		<div style="margin:10px; padding:10px;">
		<%#Eval("Description") %><br />
		This DPT starts on <%#Eval("StartDate", "{0:D}") %> and <b>ends on <%#Eval("EndDate", "{0:D}") %></b> when the winner will be picked and emailed. 
		So far there are <%#Eval("TotalEntries")%> entries. 
		</div>

</div>
</ItemTemplate>
</asp:Repeater>


<asp:Label runat="server" ID="lblMessageNo" />

<asp:Panel runat="server" ID="pnlForm">
			        <div class="BlogPost" id="NoJavaScriptDIV" style="color:Red; font-weight:bold; text-align:center;">Sorry, you need to have Javascript enabled to participate in Digital Product Tosses.</div>
			
			        <div id="EntryForm" style="margin:0px; padding:0px; display:none;">
				        
				        <form>
					    <h1>Enter to Win</h1>
                            <b>Your Email:</b> <input type="text" id="txtEmail" name="txtEmail" style="width:200px;" />
					        <div style="font-size:10px; margin:0px; padding:0px;">It's only used for this DPT, nothing else.</div>
					        <b>Your Comment:</b> <input type="text" id="txtComment" name="txtComment" style="width:350px;" maxlength="140" /><br />
					        <div style="font-size:10px; margin:0px; padding:0px;">140 character limit. Make me laugh, please. Characters remaining: <span id="txtComment-counter">140</span></div>
					        <input type="hidden" value="<%=Request["I"] %>" id="txtDPTID" name="txtDPTID" />
					        <div id="ErrorDiv" style="color:red; font-weight:bold; display:none; margin:2px; padding:2px;">Boo, there was some kind of error.  Sorry about that.  Try again later?  Or email us at info@skateparkoftampa.com</div>
					        <div id="InvalidDIV" style="color:Red; font-weight:bold; display:none; margin:2px; padding:2px;">Sorry, that email address doesn't work.  Please correct it.</div>
					        <input type="button" id="SubmitDPT" name="SubmitDPT" style="font-size:1.2em; font-weight:bold;" value="Submit DPT Entry" />
				        </form>
			        </div>
			        <div class="BlogPost" id="Confirmation" style="display:none;">
				        Got it, thanks! <b>One last step</b>: click the link in the confirmation email we just sent you and you're in. It might be in your junk mail, too. It's from info@skateparkoftampa.com.  If you have an account with us under this email, there's also a 20% off coupon code.<br /><br />
				        Thanks!<br />
			        </div>

                    <div class="BlogPost">
                    <div class="PostMediaStripSub">
                
                            <span class="counter-fb-like">
                                <iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fskateparkoftampa.com%2Fspot%2Fdpt.aspx%3FI%3D<%=Request.QueryString["I"] %>&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21&amp;appId=128422270572394" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:80px; height:21px;" allowTransparency="true"></iframe>
                            </span>
                            <span class="counter-twitter">
                                <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://skateparkoftampa.com/spot/dpt.aspx?I=<%=Request.QueryString["I"] %>" data-count="horizontal" data-via="SPoTTampa">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
                            </span>
                    
                            <span class="counter-google-one">
                                <g:plusone size="medium" href="http://skateparkoftampa.com/spot/dpt.aspx?ID=<%=Request.QueryString["I"] %>"></g:plusone>
                            </span>
                            <span class="counter-stumble">
                                <script src="http://www.stumbleupon.com/hostedbadge.php?s=3&r=http://skateparkoftampa.com/spot/dpt.aspx?I=<%=Request.QueryString["I"] %>"></script>
                            </span>

                    </div>
                    </div>

		        <div class="BlogPost">
			        <h1>How It Works: Simple Instructions</h1>

			        <ol style="margin-left:30px;">
			        <li>Leave your email address so we can contact you. It is not used for anything except this DPT.</li>
			        <li>Leave a comment.</li>
			        <li>Click the confirmation link in the email we send you.</li>
			        <li>That's it! After that, you're in the random drawing to be picked to win the goods.</li>
			        </ol>
		        </div>
</asp:Panel>


<div class="BlogPost">
    Digital Product Tosses are only available for addresses in the continental United States.
</div>

	<asp:Panel runat="server" ID="pnlCompany">
		<div class="BlogPost">
            <h1>Recently Added
                <%=strName%> Products In Stock, Immediate Shipping
            </h1>
        
            <b>Thanks to <%=strName%></b> for hooking up this DPT.  Check out some of their stuff in stock right now with immediate shipping.
            <br /><br />
            <div style="clear:both;"></div>

            <asp:Repeater ID="dlProducts" runat="server">
            <ItemTemplate>
                    <div class="ProductBlock">
                
                        <a 
                        title="<%#Eval("Name").ToString().Replace("\"", "") %> <%#Eval("Color").ToString().Replace("\"", "") %> <%#Eval("ShortDescr").ToString().Replace("\"", "") %>"
                        href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>"><img 
                            title="<%#Eval("Name").ToString().Replace("\"", "") %> <%#Eval("Color").ToString().Replace("\"", "") %> <%#Eval("ShortDescr").ToString().Replace("\"", "") %>" width="190" height="190" 
                            src="http://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>productimages/colors/<%#Eval("ColorID") %>_<%#Eval("ProductID") %>.jpg" /></a>
                
                        <div class="ProductBlockText">
                            <a 
                                title="<%#Eval("Name").ToString().Replace("\"", "") %> <%#Eval("Color").ToString().Replace("\"", "") %> <%#Eval("ShortDescr").ToString().Replace("\"", "") %>"
                                href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>">
                            <%#Eval("Name")%> 
                            <%#Eval("ShortDescr")%> <%#Eval("Color")%></a> <%#Eval("CurrentPrice", "{0:c}")%>
                        </div>
                        <div class="ProductBlockTextAlert">
                            <%#Eval("SaleNote") %> <%#Eval("FreeShippingNote") %>
                            <%#Eval("InShopOnly")%>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>
            
        </div>
	</asp:Panel>


</asp:Panel>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

<div class="BlogPost">
<a href="/dpt">
<img class="img-responsive img-center" src="http://skateparkoftampa.com/spot/images/dptfrontpageicon.jpg" />
</a>
</div>

<div class="BlogPost">
    <h2>Looking for Shoes? Click Your Size</h2>
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
        </div></div>

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
        <FooterTemplate> | </FooterTemplate>
    </asp:Repeater>
</div>


</asp:Content>


<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sk_headercontrol.ascx.cs" Inherits="sk_headercontrol" %>
<%@ OutputCache Duration="500" VaryByParam="ID;T" %>

<div class="BlogPost">
    <div class="row">
    <asp:SqlDataSource runat="server" ID="sdsSkaterInfo" EnableCaching="true" ConnectionString="<%$ConnectionStrings:CS %>" 
        CacheDuration="4000" SelectCommand="SPOT2012SkaterInfo" SelectCommandType="StoredProcedure">
    <SelectParameters><asp:QueryStringParameter Name="SkaterID"  QueryStringField="ID" /></SelectParameters>
    </asp:SqlDataSource>
    <asp:Repeater runat="server" DataSourceID="sdsSkaterInfo" ID="rptSkaterInfo">
    <ItemTemplate>
       <div class="col-sm-8"> <h1><%=strSkaterName %> Skater Profile</h1></div>
        <div class="col-sm-4" style="text-align: center;">
           
    </div>
        <div class="BlogPost ShoeSizeGrid hidden-md hidden-lg" id="MugShot">
        <img class="img-responsive img-center MugShotProfile" src="<%=strImageURL%>"  alt="<%=strSkaterName.Replace("\"", "") %> Photo" 
            title="<%=strSkaterName.Replace("\"", "") %> Photo" />
</div>
        <div class="col-sm-12">
        <p>
            Sponsors: <%#Eval("Sponsors") %><br />
            Hometown: <%#Eval("Hometown") %>, Stance: <%#Eval("Stance") %>, Age: <%#Eval("Age") %>, Status: <%#Eval("Status") %>
            <%#Eval("Notes") %>
        </p>
        <div style="font-size:.7em;">Last Update: 
            <%#Eval("LastUpdate", "{0:D}") %> 
                <a href="results_postcorrection.aspx?SkaterID=<%=Request["ID"] %>">Submit 
                an Update</a></div>
            </div>
    </ItemTemplate>
    </asp:Repeater>
</div>
    </div>

<a name="SkaterTopMenu"></a>
<div class="BlogPost">
    <h1>More on <%=strSkaterName %>: </h1>

    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Photos" class="SkInfo">
        <img src="app/icon_photos.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Photos" class="SkInfo">
        PHOTOS
    </a>
    </div></div>
    
    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Coverage" class="SkInfo">
        <img src="app/icon_coverage.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Coverage" class="SkInfo">
        COVERAGE
    </a>
    </div></div>

    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=News" class="SkInfo">
        <img src="app/icon_news.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=News" class="SkInfo">
        NEWS
    </a>
    </div></div>

    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Results" class="SkInfo">
        <img src="app/icon_results.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Results" class="SkInfo">
        RESULTS
    </a>
    </div></div>

    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Products" class="SkInfo">
        <img src="app/icon_products.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Products" class="SkInfo">
        PRODUCTS
    </a>
    </div></div>

    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Tweets" class="SkInfo">
        <img src="app/icon_tweets.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Tweets" class="SkInfo">
        TWEETS
    </a>
    </div></div>

    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Instagram" class="SkInfo">
        <img src="app/icon_insta.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Instagram" class="SkInfo">
        INSTA
    </a>
    </div></div>
    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Mugs" class="SkInfo">
        <img src="app/icon_mugs.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Mugs" class="SkInfo">
        MUGS
    </a>
    </div></div>

<!--

    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Mugs" class="SkInfo">
        <img src="app/icon_mugs.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Mugs" class="SkInfo">
        MUGS
    </a>
    </div>

-->

</div>

<div id="SkContentSelected">
    <div style="text-align:center;">
        <asp:Label runat="server" ID="lblMessage" />    
    </div>


    <asp:Panel runat="server" ID="pnlMugs" Visible="false">
    
        <asp:Repeater runat="server" ID="rptMugHistory">
	        <HeaderTemplate>
                    <h1><%=strSkaterName %> Mugshot History</h1>
                    
            </HeaderTemplate>
	        <ItemTemplate>
		            <div class="BlogPost" style="float:left; width:290px; padding:5px;  margin:5px; 
                        height:300px; margin-bottom:20px; text-align:center;">
                        <div class="NotesAndTips">
			                <img style="width:280px; height:280px;" 
                                src="https://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>headshots/<%#Eval("MugShotID") %>mug.jpg" />
                                <br />
			                    Date: <%#Eval("DateAndTimeTaken")%>
		                </div>
                    </div>
	        </ItemTemplate>
	        <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>

    </asp:Panel>


    <asp:Panel runat="server" ID="pnlInsta" Visible="false">
        <asp:Repeater runat="server" ID="rptInsta">
            <HeaderTemplate>
                <h1><%=strSkaterName %> on Instagram (@<%=strInsta %>)</h1>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="BlogPost" style="float:left; width:290px; padding:5px;  margin:5px; 
                    height:380px; margin-bottom:20px; text-align:center;">
                    <div>
                    <h2><a href="<%#XPath("link")%>"><%#DateTime.Parse(XPath("pubDate").ToString()).ToShortDateString()%></a></h2>
                    <div style="font-size:.7em; height:50px;"><a style="color:Black;" target="_blank" href="<%#XPath("link")%>"><%#XPath("title").ToString().Replace("fuck", "fork")%></a></div>
                    <div style="overflow:hidden;"><%#XPath("description").ToString().Replace("shit", "shot").Replace("fuck", "fork").Replace("<img src=", "<img style=\"margin-top:4px; margin-bottom:20px; height:280px; width:280px;\" src=")%></div>
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
        
            </FooterTemplate>
        </asp:Repeater>
    </asp:Panel>


    <asp:Panel runat="server" ID="pnlResults" Visible="false">
    
        <asp:Repeater ID="rptResultsHistory" runat="server">
        <HeaderTemplate>
            <h1><%=strSkaterName %> Contest Results History</h1>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="BlogPost">
                    <div class="ContestPlacesProfile" style="font-size:1.9em;"><%# Eval("Place") %>:</div>
                    <div>
                        <a href="/results/<%# Eval("ContestID") %>/<%# Eval("Description").ToString().Replace("\"", "").Replace(" ", "_") %>"><%# Eval("Description") %></a>,
		                <%# Eval("ContestDate", "{0:D}") %>, 
		                placed <%# Eval("Place") %> out of <%# Eval("TotalSkaters") %> skaters.
                    </div>
            </div>

        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
        </asp:Repeater>


    </asp:Panel>


    <asp:Panel runat="server" ID="pnlPhotos" Visible="false">
        <asp:Repeater runat="server" ID="rptPhotos">
        <HeaderTemplate>
            <h1><%=strSkaterName %> Photos</h1>
            <div class="BlogPost">
        </HeaderTemplate>
        <ItemTemplate>
            <div class="SkaterPhotosPage">
            <div>
                <a href="phi.aspx?I=<%# Eval("ImageID")%>">
                <img style="height:80px; width:80px;" title="<%#Eval("Title").ToString().Replace("\"", "") %>" 
                    src="https://www.skateparkoftampa.com/spot/<%# Eval("ImageName").ToString().Replace(".gif", "small.gif").Replace(".jpg", "small.jpg") %>" />
                </a>
            </div>
            <div style="font-size:.7em;">
                <%#Eval("DateAdded", "{0:y}") %>
            </div>
            </div>
        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>
    </asp:Panel>




    <asp:Repeater ID="rptSkaterProducts" runat="server" Visible="false">
        <HeaderTemplate>
            <h2><%=strSkaterName %> Products</h2>
            <div class="BlogPost">
            <div class="NotesAndTips" style="margin:0px; padding:0px;">Support Pro Skaters by buying their gear. Here's all the <%=strSkaterName %> stuff we sell.</div>
        </HeaderTemplate>
        <ItemTemplate>
                <div class="col-xs-6 col-sm-4 ProductBlock">
                    <a href="/product/<%#Eval("ProductID") %>/<%#Eval("Name").ToString().Replace("\"", "").Replace(" ", "_") %>_<%#Eval("Color").ToString().Replace("\"", "").Replace(" ", "_").Replace("/", "") %>_<%#Eval("ShortDescr").ToString().Replace("\"", "").Replace(" ", "_") %>/&CID=<%#Eval("ColorID") %>"><img 
                        title="<%#Eval("Name") %> <%#Eval("Color") %> <%#Eval("ShortDescr") %>" width="190" height="190" 
                        src="https://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>productimages/colors/<%#Eval("ColorID") %>_<%#Eval("ProductID") %>.jpg" /></a>
                    <div class="ProductBlockText"><%#Eval("Name")%> 
                        <%#Eval("ShortDescr")%> <%#Eval("Color")%> <%#Eval("CurrentPrice", "{0:c}")%>
                    </div>
                    <div class="ProductBlockTextAlert">
                        <%#Eval("SaleNote") %> <%#Eval("FreeShippingNote") %>
                        <%#Eval("InShopOnly")%>
                    </div>
                </div>
        </ItemTemplate>
        <FooterTemplate>
                <%=strProductsMoreLink %>
            </div>
        </FooterTemplate>
    </asp:Repeater>

    <asp:SqlDataSource runat="server" ID="sdsRandom" SelectCommand="SPOT2012SkatersProductsRandom" SelectCommandType="StoredProcedure"
     ConnectionString="<%$ConnectionStrings:CS %>" EnableCaching="true" CacheDuration="1000" />
    <asp:Repeater ID="rptSkaterProductsRandom" DataSourceID="sdsRandom" runat="server" Visible="false">
        <HeaderTemplate>
            <h2>In Stock Now With Immediate Shipping</h2>
            <div class="BlogPost">
            <div class="NotesAndTips" style="margin:0px; padding:0px;">Couldn't find any <%=strSkaterName %> products, but check out some random products from our Shop. Yeah, <%=strSkaterName %> probably shops here...</div>
        </HeaderTemplate>
        <ItemTemplate>
                <div class="col-xs-6 col-sm-4 ProductBlock">
                    <a href="/product/<%#Eval("ProductID") %>/<%#Eval("Name").ToString().Replace("\"", "").Replace(" ", "_") %>_<%#Eval("Color").ToString().Replace("\"", "").Replace(" ", "_").Replace("/", "") %>_<%#Eval("ShortDescr").ToString().Replace("\"", "").Replace(" ", "_") %>/&CID=<%#Eval("ColorID") %>"><img class="img-responsive img-center"
                        title="<%#Eval("Name") %> <%#Eval("Color") %> <%#Eval("ShortDescr") %>" width="190" height="190" 
                        src="https://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>productimages/colors/<%#Eval("ColorID") %>_<%#Eval("ProductID") %>.jpg" /></a>
                    <div class="ProductBlockText"><%#Eval("Name")%> 
                        <%#Eval("ShortDescr")%> <%#Eval("Color")%> <%#Eval("CurrentPrice", "{0:c}")%>
                    </div>
                    <div class="ProductBlockTextAlert">
                        <%#Eval("SaleNote") %> <%#Eval("FreeShippingNote") %>
                        <%#Eval("InShopOnly")%>
                    </div>
                </div>
        </ItemTemplate>
        <FooterTemplate>
                <%=strProductsMoreLink %>
            </div>
        </FooterTemplate>
    </asp:Repeater>


    <asp:Repeater runat="server" ID="rptSkaterNews" Visible="false">
    <HeaderTemplate>
            
            <h2>Recent News on <%=strSkaterName %></h2>
    </HeaderTemplate>
    <ItemTemplate>
    <div class="BlogPost">
	    <h3>
		    <%# Eval("DateAndTime", "{0:D}") %> posted by
            <%# Eval("EnteredBy") %>
        </h3>
        <div class="NotesAndTips">
            <%# Eval("Notes") %>
        </div>
    </div>
    </ItemTemplate>
    <FooterTemplate>
            <div class="BlogPost">
                <a href="skn.aspx?ID=252">View all <%=strSkaterName %> news.</a>
            </div>
    </FooterTemplate>
    </asp:Repeater>

    <asp:Panel runat="server" ID="pnlTwitter" Visible="false">
            
        <h1>Tweets from <%=strSkaterName %> (@<%=strTwitter %> on Twitter)</h1>
        <div class="BlogPost">
            <div id="twitter_update_list"></div>
            <script type="text/javascript" src="https://twitter.com/javascripts/blogger.js"></script>
            <script type="text/javascript" src="https://twitter.com/statuses/user_timeline/<%=strTwitter %>.json?callback=twitterCallback2&count=30"></script>
        </div>
    </asp:Panel>
    
    <asp:Panel runat="server" ID="pnlCoverage" Visible="false">
        <asp:Repeater runat="server" id="rptCoverage">
	        <HeaderTemplate>
                <h2><%=strSkaterName %> Mag Coverage</h2>
            </HeaderTemplate>
            <ItemTemplate>
		        <div class="BlogPost">
			        <a href="cmed.aspx?ID=<%# Eval("IssueID")%>" title="Click to see all <%# Eval("MediaIssue")%> coverage."><%# Eval("MediaIssue")%></a><br />
			        <%# Eval("MediaCoverageType")%>: <b><%# Eval("MediaCoverageDescription")%></b>
			        Photo by <a href="cp.aspx?ID=<%# Eval("PhotographerID")%>" title="Click to see a photos taken by <%# Eval("Photographer")%>"><%# Eval("Photographer")%></a>
			        <%# Eval("ManufacturerLink")%>
                </div>
	        </ItemTemplate>
            <FooterTemplate>
                
            </FooterTemplate>
        </asp:Repeater>
    </asp:Panel>

</div>

<div class="BlogPost">
<h2><%=strSkaterName %> Comments</h2>
    <div id="fb-root"></div><script src="https://connect.facebook.net/en_US/all.js#appId=106807979370947&amp;xfbml=1"></script><fb:comments href="https://www.skateparkoftampa.com/spot/sk.aspx?ID=<%=Request.QueryString["ID"] %>" num_posts="5" width="100%"></fb:comments>							
</div>				



<div class="BlogPost">
<h1>More on <%=strSkaterName %>: </h1>

    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Photos" class="SkInfo">
        <img src="app/icon_photos.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Photos" class="SkInfo">
        PHOTOS
    </a>
    </div></div>
    
    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Coverage" class="SkInfo">
        <img src="app/icon_coverage.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Coverage" class="SkInfo">
        COVERAGE
    </a>
    </div></div>

    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=News" class="SkInfo">
        <img src="app/icon_news.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=News" class="SkInfo">
        NEWS
    </a>
    </div></div>

    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Results" class="SkInfo">
        <img src="app/icon_results.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Results" class="SkInfo">
        RESULTS
    </a>
    </div></div>

    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Products" class="SkInfo">
        <img src="app/icon_products.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Products" class="SkInfo">
        PRODUCTS
    </a>
    </div></div>

    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Tweets" class="SkInfo">
        <img src="app/icon_tweets.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Tweets" class="SkInfo">
        TWEETS
    </a>
    </div></div>

    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Instagram" class="SkInfo">
        <img src="app/icon_insta.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Instagram" class="SkInfo">
        INSTA
    </a>
    </div></div>


    <div class="col-xs-6 col-sm-3"><div class="SkaterIconMenuItem">
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Mugs" class="SkInfo">
        <img src="app/icon_mugs.png" />
    </a>
    <a href="/skater/<%=Request.QueryString["ID"] %>/<%=strSkaterName.Replace("\"", "").Replace(" ", "_") %>/?T=Mugs" class="SkInfo">
        MUGS
    </a>
    </div></div>
</div>
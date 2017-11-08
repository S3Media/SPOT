<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="al.aspx.cs" Inherits="al" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="Skateboarding news, articles, photos, videos, and more. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="Skateboard Articles, Photos, and Videos at Skatepark of Tampa">
<meta itemprop="description" content="All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="Skateboard Articles, Photos, and Videos at Skatepark of Tampa"/>
<meta property="og:image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="Skateboarding news, articles, photos, videos, and more. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>

<script src="jquery.masonry.min.js" type="text/javascript"></script>
<script src="jquery.imagesloaded.min"></script>
<script type="text/javascript">


    $(document).ready(function () {
            //alert('test');

            var $container = $('#MasonryWrapper');

            $container.imagesLoaded(function () {
                $container.masonry({
                    itemSelector: '.PhotoBox2012',
                    columnWidth: 190
                });
            });
            //alert('test');
        });


</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">


    <h1><%=strTitle %></h1>
    <asp:SqlDataSource runat="server" ID="sdsList" ConnectionString="<%$ ConnectionStrings:CS %>" 
     EnableCaching="true" CacheDuration="10000"
     SelectCommand="SPOT2012ArticleYearDetail" SelectCommandType="StoredProcedure">
     <SelectParameters>
     <asp:QueryStringParameter Name="Year" QueryStringField="Y" DefaultValue="0" />
     </SelectParameters>
     </asp:SqlDataSource>
    <asp:Repeater runat="server" ID="rptList" DataSourceID="sdsList">
        <HeaderTemplate><div class="BlogPost"><div id="MasonryWrapper"></HeaderTemplate>
        <ItemTemplate>
        <div class="PhotoBox2012" style="width:160px; padding:5px;">
            <a href="/article/<%# Eval("ArticleID")%>/<%# Eval("Description").ToString().Replace("\"","").Replace(" ", "_").Replace(":", "_") %>">
            <img src="<%#Eval("Icon") %>" />
            </a>
            <h2><a href="/article/<%# Eval("ArticleID")%>/<%# Eval("Description").ToString().Replace("\"","").Replace(" ", "_").Replace(":", "_")%>"><%# Eval("Description")%></a></h2>
            <h3>
                by <%# Eval("Category")%><br /><%# Eval("DateAdded", "{0:D}")%><br />
                <%# Eval("LongDescription")%>
            </h3>
        </div>
    </ItemTemplate>
        <FooterTemplate></div></div></FooterTemplate>
    </asp:Repeater>



</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">


    <h1>Search Articles</h1>
        <form method="get" action="al.aspx">
            Keywords: <input type="text" id="t" name="t" value="<%=Request["t"] %>" /> <input type="submit" value="Search Articles" />
            <input type="hidden" id="SearchType" name="SearchType"  value="Articles" />
            
            <asp:Repeater runat="server" ID="dlArtiles" Visible="false">
            <HeaderTemplate><h2><%=strSearchTitle%>:</h2></HeaderTemplate>
            <ItemTemplate>
                <div class="NotesAndTips">
                    <div>
                    <a href="/article/<%# Eval("ArticleID")%>/<%# Eval("Description").ToString().Replace("\"","").Replace(" ", "_").Replace(":", "_") %>">
                        <img title="<%#Eval("Description").ToString().Replace("\"", "") %>" 
                            style="width:100px; height:100px; float:left; margin-right:10px;" src="<%#Eval("Icon") %>" />
                    </a>
                    
                    <a title="<%#Eval("Description").ToString().Replace("\"", "") %>" 
                        href="/article/<%# Eval("ArticleID")%>/<%# Eval("Description").ToString().Replace("\"","").Replace(" ", "_").Replace(":", "_") %>"><%#Eval("Description") %></a>
                        <div style="padding-left:20px;">
                            <%#Eval("LongDescription") %>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            </asp:Repeater>
        </form>
    <h1>Article Archive by Year</h1>
    <div class="BlogPost">
        <asp:SqlDataSource runat="server" ID="sdsYears" ConnectionString="<%$ ConnectionStrings:CS %>" 
         EnableCaching="true" CacheDuration="9000"
         SelectCommand="SPOT2012ArticlesYearList" SelectCommandType="StoredProcedure" />
        <asp:Repeater runat="server" ID="rptYears" DataSourceID="sdsYears">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <div class="SizeSelectionGridItemSmall">
            <a href="al.aspx?Y=<%# Eval("Year") %>"><%# Eval("Year") %></a>
            </div>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
        </asp:Repeater>
    </div>


    <h1>Article Archive by Category</h1>

    <div class="BlogPost">
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
    </div>

</asp:Content>


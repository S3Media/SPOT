<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="r.aspx.cs" Inherits="r" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="Skateboarding Industry Contest Results. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="Skateboarding Industry Contest Results and History">
<meta itemprop="description" content="Skateboarding Industry Contest Results and History. SPoT Skate Shop at Skatepark of Tampa: A crusty little skateboard hut in Tampa established in 1993. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="Skateboarding Industry Contest Results and History"/>
<meta property="og:type" content="results"/>
<meta property="og:image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="Skateboarding Industry Contest Results and History.  Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
<h1><%=strTitle %></h1>
<asp:SqlDataSource runat="server" ID="sdsList" ConnectionString="<%$ ConnectionStrings:CS %>"
 SelectCommand="SPOT2012ResultsYear" SelectCommandType="StoredProcedure"
 EnableCaching="true" CacheDuration="2000">
 <SelectParameters><asp:QueryStringParameter Name="Year" QueryStringField="Year" DefaultValue="0" /></SelectParameters>
 </asp:SqlDataSource>
<asp:Repeater runat="server" ID="rptList" DataSourceID="sdsList">
<ItemTemplate>
        
    <div class="BlogPost">
        <a title="<%# Eval("ContestName").ToString().Replace("\"", "") %> Results" 
        href="/results/<%# Eval("ContestID") %>/<%# Eval("ContestName").ToString().Replace("\"", "").Replace(" ", "_") %>">
            <img class="WhatsUpFloat" src="<%#Eval("Icon") %>" />
        </a>
        <a style="font-weight:bold; color:Black;" 
            title="<%# Eval("ContestName").ToString().Replace("\"", "") %>" 
            href="/results/<%# Eval("ContestID") %>/<%# Eval("ContestName").ToString().Replace("\"", "").Replace(" ", "_") %>">
        <%# Eval("ContestName") %></a>
        <div class="NotesAndTips">
        <%# Eval("ContestDate", "{0:D}") %>
        </div>
        <div>
        <%# Eval("TotalSkaters") %> Skaters.
            
            Top Three: <a href="/skater/<%#Eval("FirstID") %>/<%#Eval("First").ToString().Replace("\"", "").Replace(" ", "_") %>"><%# Eval("First") %></a>,
            <a href="/skater/<%#Eval("SecondID") %>/<%#Eval("Second").ToString().Replace("\"", "").Replace(" ", "_") %>"><%# Eval("Second") %></a>,
            <a href="/skater/<%#Eval("ThirdID") %>/<%#Eval("Third").ToString().Replace("\"", "").Replace(" ", "_") %>"><%# Eval("Third") %></a>
        </div>
    </div>
</ItemTemplate>
</asp:Repeater>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

<!--

<div class="BlogPost">
    <a href="http://itunes.apple.com/us/app/spot-skate-nerd/id544443560?ls=1&mt=8" target="_blank">
        <img title="Skatepark of Tampa iPhone App, SPoT Skate Nerd" src="images3/spot_skate_nerd_iphone_app.png" />
    </a>
</div>

-->

<h1>Archives</h1>
<div class="BlogPost">
<div style="clear:both;">
Select a year to see results: 
</div>
<asp:SqlDataSource runat="server" ID="sdsYears" EnableCaching="true" CacheDuration="20000" SelectCommand="SPOT2012ResultsYearSummary" SelectCommandType="StoredProcedure" ConnectionString="<%$ConnectionStrings:CS %>" />
<asp:Repeater runat="server" ID="rptYears" DataSourceID="sdsYears">
<ItemTemplate>
<div class="SizeSelectionGridItemSmall" style="width:40px;">
    <a href="r.aspx?Year=<%#Eval("Year") %>"><%#Eval("Year") %></a>
</div>
</ItemTemplate>
</asp:Repeater>
</div>





<div class="BlogPost">
    <h2>What's Your Shoe Size?</h2>
    <div class="SizeSelectionGridItemSmall"><a title="Size 5 Skate Shoes in Stock Now" href="/5">5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 5.5 Skate Shoes in Stock Now" href="/5.5">5.5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 6 Skate Shoes in Stock Now" href="/6">6</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 6.5 Skate Shoes in Stock Now" href="/6.5">6.5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 7 Skate Shoes in Stock Now" href="/7">7</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 7.5 Skate Shoes in Stock Now" href="/7.5">7.5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 8 Skate Shoes in Stock Now" href="/8">8</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 8.5 Skate Shoes in Stock Now" href="/8.5">8.5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 9 Skate Shoes in Stock Now" href="/9">9</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 9.5 Skate Shoes in Stock Now" href="/9.5">9.5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 10 Skate Shoes in Stock Now" href="/10">10</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 10.5 Skate Shoes in Stock Now" href="/10.5">10.5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 11 Skate Shoes in Stock Now" href="/11">11</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 11.5 Skate Shoes in Stock Now" href="/11.5">11.5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 12 Skate Shoes in Stock Now" href="/12">12</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 13 Skate Shoes in Stock Now" href="/13">13</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 14 Skate Shoes in Stock Now" href="/14">14</a></div>    <div class="SizeSelectionGridItemSmall"><a title="Size 15 Skate Shoes in Stock Now" href="/15">15</a></div></div>




<h1>Products in Stock Now</h1>
<div class="BlogPost">
    <asp:SqlDataSource runat="server" ID="sdsCategoryMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012CategoryList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="10000" />
    <asp:Repeater ID="rptCategories" runat="server" DataSourceID="sdsCategoryMenu">
        <HeaderTemplate><ul></HeaderTemplate>
        <ItemTemplate>
            <li>
            <a title="Skateboarding <%# Eval("Description")%>"
                href="c.aspx?ID=<%# Eval("CategoryID")%>">
                <%# Eval("Description") %>
            </a>
            </li>
        </ItemTemplate>
        <FooterTemplate></ul></FooterTemplate>
    </asp:Repeater>
</div>
<h1>More Product Categories</h1>
<div class="BlogPost">
    <asp:SqlDataSource runat="server" ID="sdsFlagsMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012ProductFlagList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="10000" />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsFlagsMenu">
        <HeaderTemplate><ul></HeaderTemplate>
        <ItemTemplate>
            <li>
            <a title="<%# Eval("SearchTextDescription").ToString().Replace("\"", "")%>" 
	            href="f.aspx?ID=<%# Eval("FlagID")%>">
                <%# Eval("Description")%>
            </a>
            </li>
        </ItemTemplate>
        <FooterTemplate></ul></FooterTemplate>
    </asp:Repeater>
</div>





<asp:SqlDataSource runat="server" ID="sdsRandom" SelectCommand="SPOT2012AdTextRandom"
	SelectCommandType="StoredProcedure" ConnectionString="<%$ ConnectionStrings:CS %>" EnableCaching="true" CacheDuration="200" />
<asp:Repeater runat="server" ID="rptRandom" DataSourceID="sdsRandom">
	<HeaderTemplate><h2>Random Hot Links:</h2> <div class="BlogPost HotLinks"></HeaderTemplate>
	<ItemTemplate>
		| <a href="clickadtext.aspx?AdID=<%#Eval("AdID") %>"><%# DataBinder.Eval(Container.DataItem, "LinkText")%></a>
	</ItemTemplate>
	<FooterTemplate></div></FooterTemplate>
</asp:Repeater>


</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="feedb.aspx.cs" Inherits="feedb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="Skatepark of Tampa feedback and reviews. A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="SPoT Skate Shop at Skatepark of Tampa">
<meta itemprop="description" content="SPoT Skate Shop at Skatepark of Tampa feedback and reviews: A crusty little skateboard hut in Tampa established in 1993. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="SPoT Skate Shop at Skatepark of Tampa feedback and reviews"/>
<meta property="og:type" content="company"/>
<meta property="og:image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa feedback and reviews"/>
<meta property="og:description" content="Skatepark of Tampa feedback and reviews: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">

<h1><%=strTitle %></h1>
Everyone who orders from us gets a follow up after their order is delivered asking to rate our 
service and to make sure everything is 100% okay.
Below are a few of the replies and entertaining comments we've received.  Thanks for the support!  
We try to keep this page as updated as possible so watch for your comments.  Click on a month to your right
to see all feedback left in that month.

<asp:Repeater runat="server" id="rptList">
		<HeaderTemplate>
			
		</HeaderTemplate>
		<ItemTemplate>
			<div class="BlogPost">
				<%# DataBinder.Eval(Container.DataItem, "DateAdded", "{0:D}")%>: 
				<%# DataBinder.Eval(Container.DataItem, "FirstName")%> from <%# DataBinder.Eval(Container.DataItem, "City")%>, <%# DataBinder.Eval(Container.DataItem, "State")%> says...
				<div style="margin-left:10px;">
				<%# DataBinder.Eval(Container.DataItem, "CustomerComments")%></div>
				<div style="margin-left:50px; font-size: .8em;">
                <%# DataBinder.Eval(Container.DataItem, "SPoTNotes")%></div>
			</div>
		</ItemTemplate>
		<FooterTemplate>
		</FooterTemplate>
	</asp:Repeater>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

<div class="BlogPost">

    <asp:SqlDataSource runat="server" ID="sdsMonthList" SelectCommand="SPOTSHOPGetFeedbackMonthList" SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:CS %>" EnableCaching="true" CacheDuration="10000" />
    <asp:Repeater runat="server" id="rptMonthList" DataSourceID="sdsMonthList">
	    <HeaderTemplate><h1>View Customer Comments</h1><ul></HeaderTemplate>
        <ItemTemplate>
            <div class="col-xs-6">
		    <a href="feedb.aspx?Month=<%# DataBinder.Eval(Container.DataItem, "Month")%>&Year=<%# DataBinder.Eval(Container.DataItem, "Year")%>">
		    <%# DataBinder.Eval(Container.DataItem, "Month")%>/<%# DataBinder.Eval(Container.DataItem, "Year")%></a>
		    <!--(<%# DataBinder.Eval(Container.DataItem, "TotalItems")%> Items)--></div>
	    </ItemTemplate>
        <FooterTemplate></ul></FooterTemplate>
    </asp:Repeater>

</div>


<div class="BlogPost">
<h1>Other Products</h1>
    <asp:SqlDataSource runat="server" ID="sdsCategoryMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012CategoryList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="3000" />
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



<div class="BlogPost CategoryListSmall">
<h1>Additional Products</h1>
    <asp:SqlDataSource runat="server" ID="sdsFlagsMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012FlagList" SelectCommandType="StoredProcedure"
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


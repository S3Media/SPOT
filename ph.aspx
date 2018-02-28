<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="ph.aspx.cs" Inherits="ph" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="Photos at Skatepark of Tampa. A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="Photos at SPoT Skate Shop at Skatepark of Tampa">
<meta itemprop="description" content="Photos at SPoT Skate Shop at Skatepark of Tampa: A crusty little skateboard hut in Tampa established in 1993. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="PHotos at SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:type" content="company"/>
<meta property="og:image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="Photos at Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>

<script language="javascript" type="text/javascript">

    $(document).ready(function () {

        $(".ExpandSequence").click(function (event) {
            //alert($(this).attr('id').indexOf("img", 0));
            //if it's not already enlarged, enlarge it, otherwise, let the click go through

            var intImageID;
            //first, determine if they clicked the link or the image itself
            if ($(this).attr('id').indexOf("img", 0) > -1) {//they clicked the image
                intImageID = $(this).attr('id').substring(3, $(this).attr('id').length);
            }
            else {//they clicked the link
                intImageID = $(this).attr('id').substring(6, $(this).attr('id').length);
            }

            //alert($("#img" + intImageID).attr('src').indexOf('small.gif'));

            if ($("#img" + intImageID).attr('src').indexOf('small.gif') > 0) {
                //only prvent the click through if it's not already enlarged
                event.preventDefault();
                ExpandImage(intImageID);
            }

        });

        function ExpandImage(intImageID) {
            $("#img" + intImageID).fadeOut();

            $("#img" + intImageID).attr('src', $("#img" + intImageID).attr('src').replace('small.gif', '.gif'));

            $("#Expand" + intImageID).attr('innerHTML', 'Loading...');
            $("#img" + intImageID).fadeIn();
            $("#Expand" + intImageID).fadeOut(3000);
        }



    });

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">

<h1><%=strTitle %></h1>

<asp:SqlDataSource runat="server" ID="sdsDescription" EnableCaching="true" CacheDuration="4000" ConnectionString="<%$ ConnectionStrings:CS %>"
	SelectCommand="SPOT2012PhotosTagDescription" SelectCommandType="StoredProcedure">
	<SelectParameters>
		<asp:QueryStringParameter Name="CategoryID" QueryStringField="CID" DefaultValue="0" />
	</SelectParameters>
</asp:SqlDataSource>
<asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsDescription">
<ItemTemplate><div style="margin:20px;"><%#Eval("LongDescription")%></div></ItemTemplate>
</asp:Repeater>


<asp:Repeater runat="server" ID="dlPhotos">
<HeaderTemplate><h1 style="color:Red;"><%=strResult %></h1></HeaderTemplate>
<ItemTemplate>
    <ItemTemplate>
        
        <div class="BlogPost">
		<h2><a title="<%# Eval("Title").ToString().Replace("\"", "")%>" 
			href="phi.aspx?I=<%# Eval("ImageID")%>"><%#Eval("Title") %></a></h2>
        <h3>Posted on <%# Eval("DateAdded", "{0:D}")%></h3>
        	<a title="<%# Eval("Title").ToString().Replace("\"", "")%>" 
			href="phi.aspx?I=<%# Eval("ImageID")%>">
			<img style="float:left; margin:10px;" src="<%# Eval("Thumbnail")%>" />
			</a>
			<%# Eval("Caption")%>
            <div><%# Eval("SkaterID")%></div>
            
		</div>
</ItemTemplate>
</ItemTemplate>
</asp:Repeater>
<div style="clear:both; margin-bottom:20px;"></div>



<asp:SqlDataSource runat="server" ID="sdsPhotos" EnableCaching="true" CacheDuration="4500" ConnectionString="<%$ ConnectionStrings:CS %>"
	SelectCommand="SPOT2012PhotosTaggedRecent" SelectCommandType="StoredProcedure">
	<SelectParameters>
		<asp:QueryStringParameter Name="CategoryID" QueryStringField="CID" DefaultValue="0" />
	</SelectParameters>
</asp:SqlDataSource>
		
<asp:Repeater runat="server" id="rptPhotos" DataSourceID="sdsPhotos">
<HeaderTemplate>
</HeaderTemplate>
<ItemTemplate>
        
        <div class="PhotoBox2011" style="background-color:White;">
		<div style="text-align:left; margin-left:10px;">
            <h2><a title="<%# Eval("Title").ToString().Replace("\"", "")%>" 
			    href="phi.aspx?I=<%# Eval("ImageID")%>"><%#Eval("Title") %></a></h2>
            <h3>By <%# Eval("PhotoBy")%>, Posted on <%# Eval("DateAdded", "{0:D}")%></h3>
            <%# Eval("Caption")%>
            <div><%# Eval("SkaterID")%></div>
            <%# Eval("RelatedStory")%>
        </div>
            <div style="text-align:center;">
            
            <a href="phi.aspx?I=<%#Eval("ImageID") %>">
                <img <%#Eval("ImageTagsForGif") %> style="margin:5px;" src="http://www.skateparkoftampa.com/spot/<%# Eval("ImageName") %>"
	            title="<%#Eval("Title").ToString().Replace("\"", "") %>" />
            </a>
            <%#Eval("EnlargeLink")%>
            
            </div>
            
		</div>
</ItemTemplate>
<FooterTemplate>
</FooterTemplate>
</asp:Repeater>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

<h1>Search Photos</h1>
<form method="get" action="ph.aspx">
<input type="text" id="t" name="t" value="<%=Request.QueryString["t"] %>" style="width:80%;" />
<input type="submit" value="Search" />

</form>

<h1>Photo Tags</h1>
<div class="BlogPost">

<asp:SqlDataSource runat="server" ID="sdsCategories" 
    SelectCommand="SPOT2012PhotosTagList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="10000" ConnectionString="<%$ ConnectionStrings:CS %>" />
        
<asp:Repeater runat="server" id="rptCategories" DataSourceID="sdsCategories">
<HeaderTemplate><ul></HeaderTemplate>
<ItemTemplate>
    <li>
	<a title="<%# Eval("CategoryDescription").ToString().Replace("\"", "")%> Photos"
	href="ph.aspx?CID=<%# Eval("CategoryID")%>">
		<%# Eval("CategoryDescription")%>
	</a> (<%# Eval("TotalPhotos")%>)
    <div class="NotesAndTips"><%#Eval("LongDescription") %></div>
    </li>
</ItemTemplate>
<FooterTemplate></ul></FooterTemplate>
</asp:Repeater>

</div>

</asp:Content>


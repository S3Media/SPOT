<%@ Page Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="ep.aspx.cs" Inherits="ep" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhead" Runat="Server">
<meta name="description" content="Skatepark of Tampa Features: Articles, News, Contest Coverage, Skater Database and More. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="Skatepark of Tampa Features: Articles, News, Contest Coverage, Skater Database and More">
<meta itemprop="description" content="Skatepark of Tampa Features: Articles, News, Contest Coverage, Skater Database and More. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="Skatepark of Tampa Features: Articles, News, Contest Coverage, Skater Database and More"/>
<meta property="og:type" content="company"/>
<meta property="og:image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="Skatepark of Tampa Features: Articles, News, Contest Coverage, Skater Database and More"/>
<meta property="og:description" content="Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>

<script language="javascript" type="text/javascript">

    $(document).ready(function () {
        //alert("shit");
        $("#sidebar").css("display", "none");
        $("#mobilesidebar").css("display", "none");
        $("#main").css("width", "100%");
        $("#mobilemain").css("width", "100%");
        
    });
</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">





<h1>Past Skatepark of Tampa Events</h1>

<asp:SqlDataSource runat="server" ID="sdsEvents" ConnectionString="<%$ ConnectionStrings:MaxASP %>"
SelectCommand="SPOTGetEventsAllNewPast" SelectCommandType="StoredProcedure" />
<asp:Repeater runat="server" ID="rptEvents" DataSourceID="sdsEvents">
    
<ItemTemplate>
        <div class="BlogPost event-pg">
            <h2>
                <%# DataBinder.Eval(Container.DataItem, "Title")%>
                :
                <%# DataBinder.Eval(Container.DataItem, "EventDate")%>
            </h2>
            <div>
                <%# DataBinder.Eval(Container.DataItem, "Description")%>
            </div>
        </div>
    </ItemTemplate>
    <FooterTemplate>
    [<a href="ep.aspx">View Past Skatepark of Tampa Events</a>]
    </FooterTemplate>
</asp:Repeater>



</asp:Content>


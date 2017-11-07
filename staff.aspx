<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="staff.aspx.cs" Inherits="staff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="Skatepark of Tampa staff recommended products.  All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="SPoT Skate Shop Staff Recommendations in stock at SPoT Skate Shop">
<meta itemprop="description" content="All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="SPoT Staff Recommendations in stock at SPoT Skate Shop"/>
<meta property="og:image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="SPoT Skate Shop staff recommended products. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>

<script language="javascript" type="text/javascript">

    $(document).ready(function () {
        //alert("shit");
        $("#sidebar").css("display", "none");
        $("#main").css("width", "940px");
    });
</script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">

<h1>Meet the SPoT Staff</h1>

A place is nothing without its staff.  Below is the crew that makes it happen around here and some of the products they like from our Shop.

<asp:Repeater runat="server" ID="rptMaster" OnItemDataBound="rptMaster_Bound">
<HeaderTemplate></HeaderTemplate>
<ItemTemplate>
        <div class="BlogPost">
        <table>
        <tr>
            <td valign="top">
                <div style="width:160px;">
                <h2><%#Eval("Employee") %></h2>
                <a href="http://www.skateparkoftampa.com/spot/sk.aspx?ID=<%#Eval("SkaterID") %>">
                <img src="http://www.skateparkoftampa.com/spot/headshots/<%#Eval("SkaterID") %>.jpg" style="width:150px;" />
	            </a>
                </div>
            </td>
            <td valign="top">
                <%#Eval("Notes") %>
                Recommendations from <%#Eval("Employee") %>:
		        <asp:Repeater runat="server" ID="rptSub">
			        <HeaderTemplate><table cellspacing="5" cellpadding="0"><tr></HeaderTemplate>
			        <ItemTemplate>
				        <td valign="top" align="center" width="70" style="font-size: .7em;">
                            <div>
                                <a href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>">
                                    <img src="http://www.skateparkoftampa.com/spot/productimages/colors/<%#Eval("ColorID") %>_<%#Eval("ProductID") %>thumb.jpg" />
                                </a>
                            </div>
                            <a href="p.aspx?ID=<%#Eval("ProductID") %>"><%#Eval("Name") %> <%#Eval("ShortDescr") %></a>
                        </td>
			        </ItemTemplate>
			        <FooterTemplate></tr></table></FooterTemplate>
		        </asp:Repeater>
	    
            </td>
        </tr>
        </table>
        </div>
</ItemTemplate>

<FooterTemplate></FooterTemplate>
</asp:Repeater>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

this should not be here


</asp:Content>


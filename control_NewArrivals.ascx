﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="control_NewArrivals.ascx.cs" Inherits="control_NewArrivals" %>
<script type="text/javascript">

    $(document).ready(function () {
        //if they have javascript, show the NewArrivalsPages menu
        $(".NewArrivalsPagesLink").click(function (e) {
            e.preventDefault();
            //fill the NewArrivals div with the page they clicked
            //alert($(this).attr("href"));
            $(".NewArrivalsPagesLink").css('color', '#d52626');
            //set link clicked to green
            $(this).css('color', 'green');

            $.ajax({
                url: "ajax/products_new_arrivals.aspx?P=" + $(this).html(),
                error: function () {
                    //$("#" + DivID).html("Error");
                },
                success: function (data) {
                    //alert(data);
                    $("#NewArrivals").html(data);
                },
                type: "get"
            });

        });

    });

</script>
<!--
<asp:SqlDataSource runat="server" ID="sdsUpcoming" SelectCommand="SPOT2012UpcomingEventsIconSummary"
 SelectCommandType="StoredProcedure" EnableCaching="true" CacheDuration="5000" ConnectionString="<%$ConnectionStrings:CS %>"></asp:SqlDataSource>
<asp:Repeater runat="server" ID="rptUpcoming" DataSourceID="sdsUpcoming">
<HeaderTemplate><div class="BlogPost ShoeSizeGrid"><h2><a href="/events">Upcoming Events</a></h2></HeaderTemplate>
<ItemTemplate>
<div style="float:left; font-size:.6em; padding-top:10px; width:135px;  text-align:center;">
<a href="/events">
<img src="http://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>articleicons/EventID<%#Eval("EventID") %>.jpg" style="width:100px;" />
</a>
    <div style="padding:10px; text-align:center;">
    <%#Eval("Title") %> : <%#Eval("EventDate") %>
    </div>
</div>
</ItemTemplate>
<FooterTemplate></div></FooterTemplate>
</asp:Repeater>
-->

<div class="BlogPost">

<h2><a href="cat.aspx">New Arrivals</a></h2>

    
    <div id="NewArrivals">
        <asp:SqlDataSource runat="server" ID="sdsNew"
            SelectCommand="SPOT2012NewArrivalsFrontPage" SelectCommandType="StoredProcedure"
            ConnectionString="<%$ ConnectionStrings:CS %>"
            EnableCaching="true" CacheDuration="600" />
        <asp:Repeater ID="rptNew" DataSourceID="sdsNew" 
        runat="server">
        <ItemTemplate>
                <div class="NewArrivalSmallBlock">
                <a href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>"><img 
                    title="<%#Eval("Name") %> <%#Eval("Color") %> <%#Eval("ShortDescr") %>" width="60" height="60" 
                    src="http://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>productimages/colors/<%#Eval("ColorID") %>_<%#Eval("ProductID") %>thumb.jpg" /></a>
                <div class="NewArrivalSmallBlockText"><%#Eval("Name").ToString().ToUpper()%> </div>
                <div class="NewArrivalSmallBlockTextAlert">
                    <%#Eval("SaleNote") %> <%#Eval("FreeShippingNote") %>
                </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <div class="ProductPager">
    More New Stuff: 
    <a class="NewArrivalsPagesLink" href="new.aspx?P=1"> 1</a> 
    <a class="NewArrivalsPagesLink" href="new.aspx?P=2"> 2</a> 
    <a class="NewArrivalsPagesLink" href="new.aspx?P=3"> 3</a> 
    <a class="NewArrivalsPagesLink" href="new.aspx?P=4"> 4</a> 
    <a class="NewArrivalsPagesLink" href="new.aspx?P=5"> 5</a>
    </div>

</div>


<div class="BlogPost ShoeSizeGrid">
    <h2>What's Your Shoe Size?</h2>
    <div class="SizeSelectionGridItemSmall"><a title="Size 5 Skate Shoes in Stock Now" href="/5">5</a></div>
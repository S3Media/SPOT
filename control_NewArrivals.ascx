<%@ Control Language="C#" AutoEventWireup="true" CodeFile="control_NewArrivals.ascx.cs" Inherits="control_NewArrivals" %>
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
        <div class="row">
        <asp:SqlDataSource runat="server" ID="sdsNew"
            SelectCommand="SPOT2012NewArrivalsFrontPage" SelectCommandType="StoredProcedure"
            ConnectionString="<%$ ConnectionStrings:CS %>"
            EnableCaching="true" CacheDuration="600" />
        <asp:Repeater ID="rptNew" DataSourceID="sdsNew" 
        runat="server">
        <ItemTemplate>
                <div class="col-xs-6 col-sm-4 NewArrivalSmallBlock">
                <a href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>"><img class="img-responsive img-center"
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
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 5 Skate Shoes in Stock Now" href="/5">5</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 5.5 Skate Shoes in Stock Now" href="/5.5">5.5</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 6 Skate Shoes in Stock Now" href="/6">6</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 6.5 Skate Shoes in Stock Now" href="/6.5">6.5</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 7 Skate Shoes in Stock Now" href="/7">7</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 7.5 Skate Shoes in Stock Now" href="/7.5">7.5</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 8 Skate Shoes in Stock Now" href="/8">8</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 8.5 Skate Shoes in Stock Now" href="/8.5">8.5</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 9 Skate Shoes in Stock Now" href="/9">9</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 9.5 Skate Shoes in Stock Now" href="/9.5">9.5</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 10 Skate Shoes in Stock Now" href="/10">10</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 10.5 Skate Shoes in Stock Now" href="/10.5">10.5</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 11 Skate Shoes in Stock Now" href="/11">11</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 11.5 Skate Shoes in Stock Now" href="/11.5">11.5</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 12 Skate Shoes in Stock Now" href="/12">12</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 13 Skate Shoes in Stock Now" href="/13">13</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 14 Skate Shoes in Stock Now" href="/14">14</a></div></div>    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 15 Skate Shoes in Stock Now" href="/15">15</a></div></div></div>
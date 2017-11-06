<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="events_pastspotlight.aspx.cs" Inherits="events_pastspotlight" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<script type="text/javascript" language="javascript">
    $(document).ready(function () {

        $("#sidebar").css('width', '450px');
        $("#main").css('width', '450px');
    });
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">

<h1>Past Events</h1>
Below are recently passed SPoT Productions events.  Get the <a href="http://skateparkoftampa.com/events">current list here</a>.
<div class="NotesAndTips">
SPoT Productions and Damn Am consists of the staff from SPoT Skate Shop and Skatepark of Tampa. We run skateboarding events not just at SPoT, 
but all around the world.
</div>

<asp:SqlDataSource ID="sdsPast" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>"
SelectCommandType="storedProcedure" SelectCommand="SPOT2012SPoTEventsPast" />
<asp:Repeater runat="server" ID="rptPast" DataSourceID="sdsPast">
<ItemTemplate>
        <div class="BlogPost">
            <h2>
            <a href="eventspot.aspx?I=<%# DataBinder.Eval(Container.DataItem, "EventID")%>"><%# DataBinder.Eval(Container.DataItem, "Title")%></a>
            </h2>
            <div>
                <span style="font-weight:bold;"><%# DataBinder.Eval(Container.DataItem, "Location")%></span>:
                <%# DataBinder.Eval(Container.DataItem, "DateText")%>
            </div>
            
            
            <%# DataBinder.Eval(Container.DataItem, "Summary")%>

            <a href="eventspot.aspx?I=<%# DataBinder.Eval(Container.DataItem, "EventID")%>">Full Details...</a> 

            <%# DataBinder.Eval(Container.DataItem, "CoverageLink")%>
            <%# DataBinder.Eval(Container.DataItem, "PriorYearCoverageLink")%>
            <%# DataBinder.Eval(Container.DataItem, "ImageIcon")%>
        </div>
</ItemTemplate>
<FooterTemplate>
[<a href="events_pastspotlight.aspx">View All Past SPoT Productions and Damn Am Events</a>]
</FooterTemplate>
</asp:Repeater>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

<h1 style="text-transform:none;">UPCOMING SPoT PRODUCTIONS AND DAMN AM EVENTS</h1>
<asp:SqlDataSource ID="sdsUpcoming" runat="server" ConnectionString="<%$ ConnectionStrings:CS %>"
SelectCommandType="storedProcedure" SelectCommand="SPOT2012SPoTEventsUpcoming" />
<asp:Repeater runat="server" ID="rptUpcoming" DataSourceID="sdsUpcoming">
<ItemTemplate>
        <div class="BlogPost">
            <h2>
            <a href="eventspot.aspx?I=<%# DataBinder.Eval(Container.DataItem, "EventID")%>"><%# DataBinder.Eval(Container.DataItem, "Title")%></a>
            </h2>
            <div>
                <span style="font-weight:bold;"><%# DataBinder.Eval(Container.DataItem, "Location")%></span>:
                <%# DataBinder.Eval(Container.DataItem, "DateText")%>
            </div>
            
            
            <%# DataBinder.Eval(Container.DataItem, "Summary")%>

            <a href="eventspot.aspx?I=<%# DataBinder.Eval(Container.DataItem, "EventID")%>">Full Details...</a> 

            <%# DataBinder.Eval(Container.DataItem, "CoverageLink")%>
            <%# DataBinder.Eval(Container.DataItem, "PriorYearCoverageLink")%>
            <%# DataBinder.Eval(Container.DataItem, "ImageIcon")%>
        </div>
</ItemTemplate>
<FooterTemplate>
[<a href="events_pastspotlight.aspx">View All Past SPoT Productions and Damn Am Events</a>]
</FooterTemplate>
</asp:Repeater>

</asp:Content>


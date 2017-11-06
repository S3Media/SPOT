<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="events.aspx.cs" Inherits="events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="Skatepark of Tampa local, national, and worldwide skateboarding events. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="Skatepark of Tampa Skateboarding Events">
<meta itemprop="description" content="Skatepark of Tampa local, national, and worldwide skateboarding events. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="Skatepark of Tampa Skateboarding Events"/>
<meta property="og:type" content="event"/>
<meta property="og:image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="Skatepark of Tampa Skateboarding Events"/>
<meta property="og:description" content="Skatepark of Tampa local, national, and worldwide skateboarding events. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>

<script type="text/javascript" language="javascript">
    $(document).ready(function () {

        $("#sidebar").css('width', '450px');
        $("#main").css('width', '450px');
    });
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">




<h1>Skatepark of Tampa Events / Local</h1>





<div class="BlogPost">

<h2>SPoT Regular Hours - August 10 - November 20</h2>
<a style="font-weight:bold;" href="http://spottampa.com/about">Details &#8594</a>
</div>


<!--


<div class="BlogPost">

<h2>SPoT Summer Hours - May 29 - August 9</h2>

<ul>
<li>
            Monday - Thursday: 8am - 10pm
            <ul>
                <li>Wednesday: BMX welcome all day</li>
            </ul>
        </li>
        <li>
            Friday: 8am - 11pm
        </li>
        <li>Saturday: 10am - 11pm</li>
        <li>Sunday: Two Sessions
            <ul>
                <li>First Session: 9am - 12pm / 12 + under only</li>
                <li>Second Session: 12pm - 10pm</li>
                <li>BMX welcome from 7pm to 10pm / $6</li>
                <li>Skateboard lessons available - 9am</li>
            </ul>
        </li>
</ul>

<h3>*Hours are subject to change due to holidays and special events</h3>

</div>

-->

<asp:Repeater runat="server" ID="rptEventsCurrentYear">
    <ItemTemplate>




        <div class="BlogPost">
            <h2>
                <%# DataBinder.Eval(Container.DataItem, "Title")%>
                :
                <%# DataBinder.Eval(Container.DataItem, "EventDate")%>
            </h2>
            <div style="margin-left: 10px;">
                <%# DataBinder.Eval(Container.DataItem, "Description")%>
            </div>
        </div>
    </ItemTemplate>
    
</asp:Repeater>

<asp:Repeater runat="server" ID="rptEventsNextYear">
    <HeaderTemplate>
        <%=strNextYearTitle %>
    </HeaderTemplate>
    <ItemTemplate>
        <div class="BlogPost">
            <h2>
                <%# DataBinder.Eval(Container.DataItem, "Title")%>
                :
                <%# DataBinder.Eval(Container.DataItem, "EventDate")%>
            </h2>
            <div style="margin-left: 10px;">
                <%# DataBinder.Eval(Container.DataItem, "Description")%>
            </div>
        </div>
    </ItemTemplate>
    <FooterTemplate>
    [<a href="ep.aspx">View Past Skatepark of Tampa Events</a>]
    </FooterTemplate>
</asp:Repeater>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

<h1 style="text-transform:none;">DAMN AM / SPoT EVENTS</h1>
<div class="NotesAndTips">
Skatepark of Tampa / Damn Am events are run by the staff from SPoT Skate Shop and Skatepark of Tampa. We run skateboarding events not just at SPoT, 
but all around the world, delivering the Tampa Am and Pro vibe at each stop.
</div>

<div class="BlogPost">

<h2>About Damn Am</h2>
The Damn Am is a global amateur skateboarding contest series. Established in 2001 by Skatepark of Tampa (SPoT), the series built on the success of Tampa Am by taking that experience on the road. Over 5000 skaters have participated in Damn Am events, including most of today’s top professionals. The Damn Am series serves as the only qualifier to both Tampa Am and the SLS Pro Open. In its 16-year history it has become the number one amateur skateboarding contest series in the world. Want to know more about the series and what it takes to enter? <a href="http://skateparkoftampa.com/spot/a.aspx?ID=3262">Click here</a> 


</div>

<asp:Repeater runat="server" ID="rptUpcoming">
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
            <!-- Brian doesn't like images in there 
            <%# DataBinder.Eval(Container.DataItem, "ImageIcon")%>
            -->
        </div>
</ItemTemplate>
</asp:Repeater>


<asp:Repeater runat="server" ID="rptUpcomingNextYear">
    <HeaderTemplate>
        <%=strNextYearTitle %>
    </HeaderTemplate>
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
            <!-- Brian doesn't like images in there 
            <%# DataBinder.Eval(Container.DataItem, "ImageIcon")%>
            -->
        </div>
</ItemTemplate>
<FooterTemplate>
[<a href="events_pastspotlight.aspx">View All Past Skatepark of Tampa / Damn Am Events</a>]
</FooterTemplate>
</asp:Repeater>

</asp:Content>


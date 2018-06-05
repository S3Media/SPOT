<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="skresult.aspx.cs" Inherits="skresult" %>
<%@ Register Src="control_NewArrivals.ascx" TagName="NewArrivals" TagPrefix="Products" %>
<%@ OutputCache Duration="500" VaryByParam="ID" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="<%=strTitle %>: skateboarding contest results. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="<%=strTitle %> Results at Skatepark of Tampa.com">
<meta itemprop="description" content="<%=strTitle %> Results at Skatepark of Tampa.com.  Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">

<asp:SqlDataSource runat="server" id="sdsMug" ConnectionString="<%$ConnectionStrings:CS %>" SelectCommand="SPOT2012ContestResultsFirstPlaceImage" SelectCommandType="StoredProcedure" EnableCaching="true" CacheDuration="5000">
<SelectParameters><asp:QueryStringParameter name="EventID" QueryStringField="ID" /></SelectParameters> 
</asp:SqlDataSource>
<asp:Repeater runat="server" DataSourceID="sdsMug">
<ItemTemplate>
<meta itemprop="image" content="<%#Eval("Mugshot") %>">
<meta property="og:image" content="<%#Eval("Mugshot") %>"/>
</ItemTemplate>
</asp:Repeater>

<meta property="og:title" content="<%=strTitle %> Results at Skatepark of Tampa.com"/>
<meta property="og:type" content="article"/>

<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="<%=strTitle %> Results at Skatepark of Tampa.com.  Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">


<h1><%=strTitle %> Results</h1>



<asp:Repeater runat="server" ID="rptList" OnItemDataBound="rptList_ItemDataBound">
        
<ItemTemplate>
<div class="BlogPost skater-results">
    <h1>
        <a href="/skater/<%#Eval("SkaterID") %>/<%#Eval("FirstName").ToString().Replace("\"", "").Replace(" ", "_") %>_<%#Eval("LastName").ToString().Replace("\"", "").Replace(" ", "_") %>"
             title="<%# Eval("FirstName").ToString().Replace("\"", "") %> <%# Eval("LastName").ToString().Replace("\"", "") %> Skateboarding Profile">
            <%# DataBinder.Eval(Container.DataItem, "Place")%>: <%# DataBinder.Eval(Container.DataItem, "FirstName")%> <%# DataBinder.Eval(Container.DataItem, "LastName")%>
        </a>
    </h1>
    <div class="row">
        <div class="col-sm-5">
    <a title="<%# Eval("FirstName").ToString().Replace("\"", "") %> <%# Eval("LastName").ToString().Replace("\"", "") %> Skateboarding Profile" href="/skater/<%#Eval("SkaterID") %>/<%#Eval("FirstName").ToString().Replace("\"", "").Replace(" ", "_") %>_<%#Eval("LastName").ToString().Replace("\"", "").Replace(" ", "_") %>">
    <img class="img-responsive img-center" alt="<%# Eval("FirstName").ToString().Replace("\"", "") %> <%# Eval("LastName").ToString().Replace("\"", "") %>" 
    src="<%# DataBinder.Eval(Container.DataItem, "MugShot")%>"  style="margin-bottom: 10px;"/></a>
    


            </div>
        <div class="col-sm-7">
    Sponsors: <%# DataBinder.Eval(Container.DataItem, "Sponsors")%><br />
    Hometown: <%# DataBinder.Eval(Container.DataItem, "City")%> <%# DataBinder.Eval(Container.DataItem, "State")%><br />
    Notes: <%# DataBinder.Eval(Container.DataItem, "Notes")%><br />
    <asp:Repeater runat="server" ID="rptProducts">
        <ItemTemplate>
            
            <div>
                <a href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>">
                    <img title="<%#Eval("ShortDescr").ToString().Replace("\"", "")%> <%#Eval("Color").ToString().Replace("\"", "")%>" 
                        alt="<%#Eval("ShortDescr").ToString().Replace("\"", "")%> <%#Eval("Color").ToString().Replace("\"", "")%>" 
                        src="<%#Eval("ImageURL") %>"  />
                </a>
            
            <a title="<%#Eval("ShortDescr").ToString().Replace("\"", "")%> <%#Eval("Color").ToString().Replace("\"", "")%>" 
                href="/product/<%#Eval("ProductID") %>/<%#Eval("Name").ToString().Replace("\"", "").Replace(" ", "_") %>_<%#Eval("Color").ToString().Replace("\"", "").Replace(" ", "_").Replace("/", "") %>_<%#Eval("ShortDescr").ToString().Replace("\"", "").Replace(" ", "_") %>/&CID=<%#Eval("ColorID") %>">
                <%#Eval("ShortDescr")%> <%#Eval("CurrentPrice", "{0:c}")%></a>
                <div><%#Eval("SaleNote") %> <%#Eval("FreeShippingNote") %> <%#Eval("InShopOnly")%></div> 
            
            </div>
           
            
        </ItemTemplate>
    </asp:Repeater>
</div>
        </div>
    </div>
</ItemTemplate>
</asp:Repeater>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

<br />
<h2>Comments About <%=strTitle %> Results</h2>
<div class="BlogPost">
    <div id="fb-root"></div><script src="https://connect.facebook.net/en_US/all.js#appId=106807979370947&amp;xfbml=1"></script><fb:comments href="https://skateparkoftampa.com/spot/skresult.aspx?ID=<%=Request.QueryString["ID"] %>" num_posts="5" width="100%"></fb:comments>							
</div>				


<Products:NewArrivals ID="NewArrivals1" runat="server" />

<h1>Products in Stock Now</h1>
<div class="BlogPost">
    <asp:SqlDataSource runat="server" ID="sdsCategoryMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012CategoryList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="1000" />
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
    EnableCaching="true" CacheDuration="1000" />
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



</asp:Content>


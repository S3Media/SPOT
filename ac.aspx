<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="ac.aspx.cs" Inherits="ac" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">

    <h1><%=strTitle %></h1>
    <asp:SqlDataSource runat="server" ID="sdsList" ConnectionString="<%$ ConnectionStrings:CS %>" 
     EnableCaching="true" CacheDuration="6000"
     SelectCommand="SPOT2012ArticlesTagListingDetail" SelectCommandType="StoredProcedure">
     <SelectParameters>
        <asp:QueryStringParameter QueryStringField="ID" Name="ArticleTagID" />
     </SelectParameters>
     </asp:SqlDataSource>
    <asp:Repeater runat="server" ID="rptList" DataSourceID="sdsList">
    <ItemTemplate>
        <div class="BlogPost">
            <a href="/article/<%# Eval("ArticleID")%>/<%# Eval("Description").ToString().Replace("\"","").Replace(" ", "_").Replace(":", "_") %>">
            <img src="<%#Eval("Icon") %>" 
                style="float:left; margin-right:10px;" />
            </a>
            <h2><a href="/article/<%# Eval("ArticleID")%>/<%# Eval("Description").ToString().Replace("\"","").Replace(" ", "_").Replace(":", "_") %>"><%# Eval("Description")%></a></h2>
            <h3>
                by <%# Eval("Category")%> on <%# Eval("DateAdded", "{0:D}")%><br />
                <%# Eval("LongDescription")%>
            </h3>
        </div>
    </ItemTemplate>
    </asp:Repeater>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

    <h1>Article Archive by Year</h1>
    <div class="BlogPost">
        <asp:SqlDataSource runat="server" ID="sdsYears" ConnectionString="<%$ ConnectionStrings:CS %>" 
         EnableCaching="true" CacheDuration="9000"
         SelectCommand="SPOT2012ArticlesYearList" SelectCommandType="StoredProcedure" />
        <asp:Repeater runat="server" ID="rptYears" DataSourceID="sdsYears">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <div class="SizeSelectionGridItemSmall">
            <a href="al.aspx?Y=<%# Eval("Year") %>"><%# Eval("Year") %></a>
            </div>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
        </asp:Repeater>
    </div>


    <h1>Article Archive by Category</h1>

    <div class="BlogPost">
        <asp:SqlDataSource runat="server" ID="sdsCategories" ConnectionString="<%$ ConnectionStrings:CS %>" 
         EnableCaching="true" CacheDuration="9000"
         SelectCommand="SPOT2012ArticlesTagListing" SelectCommandType="StoredProcedure" />
        <asp:Repeater runat="server" ID="rptCategories" DataSourceID="sdsCategories">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <li>
                <a href="ac.aspx?ID=<%#Eval("ArticleTagID") %>"><%#Eval("Description") %></a> (<%#Eval("Total") %>)
            </li>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
        </asp:Repeater>
    </div>


</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="closeoutm.aspx.cs" Inherits="closeoutm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

    
<meta name="description" content="Closeout and sale items from <%=strTitle %>. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="Closeout and sale items from <%=strTitle %>. ">
<meta itemprop="description" content="Closeout and sale items from <%=strTitle %>. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="http://skateparkoftampa.com/spot/productimages/<%=Request.QueryString["ID"] %>mfgr.jpg">

<meta property="og:title" content="Closeout and sale items from <%=strTitle %>."/>
<meta property="og:type" content="company"/>
<meta property="og:image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg"/>
<meta property="og:site_name" content="Skatepark of Tampa Features: Articles, News, Contest Coverage, Skater Database and More"/>
<meta property="og:description" content="Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
<div class="BlogPost">
    <h1>Sale / Closeout Items In Stock From <%=strTitle %></h1>

    <asp:SqlDataSource runat="server" ID="sdsNew"
        SelectCommand="SPOT2012CloseoutProductsMfgr" SelectCommandType="StoredProcedure"
        ConnectionString="<%$ ConnectionStrings:CS %>"
        EnableCaching="true" CacheDuration="2000">
        <SelectParameters>
            <asp:QueryStringParameter Name="ManufacturerID" QueryStringField="ID" DefaultValue="1263" />
        </SelectParameters>
        </asp:SqlDataSource>
        <asp:Repeater ID="rptNew" DataSourceID="sdsNew" 
        runat="server">
        <ItemTemplate>
                <div class="ProductBlock">
                
                    <a title="<%#Eval("Name") %> <%#Eval("Color") %> <%#Eval("ShortDescr") %>" 
                    href="/product/<%#Eval("ProductID") %>/<%#Eval("Name").ToString().Replace("\"", "").Replace(" ", "_") %>_<%#Eval("Color").ToString().Replace("\"", "").Replace(" ", "_").Replace("/", "") %>_<%#Eval("ShortDescr").ToString().Replace("\"", "").Replace(" ", "_") %>/&CID=<%#Eval("ColorID") %>"><img 
                        title="<%#Eval("Name").ToString().Replace("\"", "") %> <%#Eval("Color").ToString().Replace("\"", "") %> <%#Eval("ShortDescr").ToString().Replace("\"", "") %>" 
                        width="190" height="190" 
                        src="http://skateparkoftampa.com/spot/productimages/colors/<%#Eval("ColorID") %>_<%#Eval("ProductID") %>.jpg" /></a>
                
                    <div class="ProductBlockText">
                        <a title="<%#Eval("Name") %> <%#Eval("Color") %> <%#Eval("ShortDescr") %>" 
                            href="/product/<%#Eval("ProductID") %>/<%#Eval("Name").ToString().Replace("\"", "").Replace(" ", "_") %>_<%#Eval("Color").ToString().Replace("\"", "").Replace(" ", "_").Replace("/", "") %>_<%#Eval("ShortDescr").ToString().Replace("\"", "").Replace(" ", "_") %>/&CID=<%#Eval("ColorID") %>">
                        <%#Eval("Name")%> 
                        <%#Eval("ShortDescr")%> <%#Eval("Color")%></a> <%#Eval("CurrentPrice", "{0:c}")%>
                    </div>
                    <div class="ProductBlockTextAlert">
                        <%#Eval("SaleNote") %> <%#Eval("FreeShippingNote") %>
                        <%#Eval("InShopOnly")%>
                    </div>

                </div>
            </ItemTemplate>
        </asp:Repeater>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

    <div class="BlogPost" style="text-align:center;">
        <a href="/company/<%=Request.QueryString["ID"] %>/<%=strTitle.Replace(" ", "_") %>">
        <img style="width:280px;" src="http://skateparkoftampa.com/spot/productimages/<%=Request.QueryString["ID"] %>mfgr.jpg" />
        </a>
        <a href="/company/<%=Request.QueryString["ID"] %>/<%=strTitle.Replace(" ", "_") %>">
            View All Items From <%=strTitle %>
        </a>
    </div>

    <div class="BlogPost">
        <h1>Companies With Closeout Items in Stock Now</h1>    
            

            <asp:SqlDataSource runat="server" ID="sdsMfgrs"
            SelectCommand="SPOT2012CloseoutProductsMfgrSummary" SelectCommandType="StoredProcedure"
            ConnectionString="<%$ ConnectionStrings:CS %>"
            EnableCaching="true" CacheDuration="2000"></asp:SqlDataSource>


            <asp:Repeater runat="server" ID="rptMfgrs" DataSourceID="sdsMfgrs">
                <ItemTemplate>
                <div class="NewArrivalSmallBlock" style="height:90px;">
                    <div>
                        <a title="<%#Eval("Name").ToString().Replace("\"", "")%>" 
                        href="closeoutm.aspx?ID=<%# Eval("ManufacturerID")%>">
                        <img height="60" width="60" src="http://www.skateparkoftampa.com/spot/productimages/<%# Eval("ManufacturerID")%>mfgrthumb.jpg" title="<%#Eval("Name").ToString().Replace("\"", "")%>" />
                        </a>
                    </div>
                    <div class="NotesAndTips">
                        <a title="<%#Eval("Name").ToString().Replace("\"", "")%>" 
                        href="m.aspx?ID=<%# Eval("ManufacturerID")%>">
                        <%# Eval("Name")%>
                        </a>
                    </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>

</asp:Content>


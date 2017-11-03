﻿<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="ss.aspx.cs" Inherits="ss" %>
<%@ Register Src="control_categorylist.ascx" TagName="Categories" TagPrefix="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" Runat="Server">

<h1><%=strTitle %></h1>

We have thousands of products, tens of thousands of photos, articles, blog posts, and the best skater database there is on the web.  
Search through it all right here.

<form method="get" action="ss.aspx">
    <h2>Search Products</h2>
    Search our store by entering a keyword for the company and product you're looking for. You can also include a size and color filter if you want.
    <div class="table-responsive">
    <table>
        <tr>
            <td align="right">Brand/Company:</td>
            <td><input type="text" style="width:100px;" id="m" name="m" value="<%=Request["m"] %>" /></td>
            <td align="right">Product:</td>
            <td><input type="text" style="width:100px;" id="t" name="t" value="<%=Request["t"] %>" /></td>
        </tr>
        <tr>
            <td align="right">Size:</td>
            <td><input type="text" style="width:100px;" id="s" name="s" value="<%=Request["s"] %>" /></td>
            <td align="right">Color:</td>
            <td><input type="text" style="width:100px;" id="c" name="c" value="<%=Request["c"] %>" /></td>
        </tr>
    </table>
    </div>

    <input type="hidden" id="SearchType" name="SearchType"  value="Products" />
    <input type="submit" id="SearchProducts" name="SearchProducts" value="Search Store" />

        <h2><%=strTitle %></h2>
        <div style="color:Red; font-weight:bold;"><%=strTitleProduct%></div>
        <asp:DataList runat="server" ID="dlProducts" Visible="false" RepeatDirection="Horizontal" RepeatColumns="9" CellSpacing="0" CellPadding="0">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <div class="NotesAndTips">
                <div>
                <a target="_blank" href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>">
                    <img title="<%#Eval("Name").ToString().Replace("\"", "") %>: <%#Eval("ShortDescr").ToString().Replace("\"", "") %>" 
                        src="http://www.skateparkoftampa.com/spot/productimages/colors/<%#Eval("ColorID") %>_<%#Eval("ProductID") %>thumb.jpg" />
                </a>
                </div>
                <a target="_blank" title="<%#Eval("Name").ToString().Replace("\"", "") %>: <%#Eval("ShortDescr").ToString().Replace("\"", "") %>" 
                    href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>"><%#Eval("Name") %>: <%#Eval("ShortDescr") %></a>
            </div>
        </ItemTemplate>
        </asp:DataList>


    <div class="NotesAndTips">
        We have tons of <a href="cat.aspx">products</a> and <a href="com.aspx">brands</a>.  Sometimes it's just easier to browse, but if you're looking for something specific, we're here to help.
        Email us at info@skateparkoftampa.com if you're having trouble finding something.
    </div>

</form>


<h1>Other Searches</h1>

<form method="get" action="ss.aspx">
    <h2>Search Skaters</h2>
    Enter any portion of a name: <input type="text" id="t" name="t" value="<%=Request["t"] %>" /> <input type="submit" value="Search Skaters" />
    <input type="hidden" id="Hidden1" name="SearchType"  value="Skaters" />
    <div class="NotesAndTips">
        We have best skater database there is. You can also <a href="sd.aspx">view the whole skater list</a>.
    </div>

    <asp:DataList runat="server" ID="dlSkaters" Visible="false" ItemStyle-HorizontalAlign="Center" 
    RepeatDirection="Horizontal" RepeatColumns="9" CellSpacing="0" CellPadding="0">
    <HeaderTemplate><h2><%=strTitle %>:</h2></HeaderTemplate>
    <ItemTemplate>
        <div class="NotesAndTips">
            <div>
            <a href="sk.aspx?ID=<%#Eval("SkaterID") %>">
                <img title="<%#Eval("FirstName").ToString().Replace("\"", "") %> <%#Eval("LastName").ToString().Replace("\"", "") %> Skater Profile" 
                    src="<%#Eval("MugShot") %>" />
            </a>
            </div>
            <a title="<%#Eval("FirstName").ToString().Replace("\"", "") %> <%#Eval("LastName").ToString().Replace("\"", "") %> Skater Profile" 
                href="sk.aspx?ID=<%#Eval("SkaterID") %>"><%#Eval("FirstName") %> <%#Eval("LastName") %></a>
        </div>
    </ItemTemplate>
    </asp:DataList>

</form>



<form method="get" action="ss.aspx">
    <h2>Search Photos</h2>
    Keywords: <input type="text" id="t" name="t" value="<%=Request["t"] %>" /> <input type="submit" value="Search Photos" />
    <input type="hidden" id="SearchType" name="SearchType"  value="Photos" />
    <div class="NotesAndTips">
        There are thousands of photos on the site. Find them here or just <a href="ph.aspx">browse the whole photo list</a>.
    </div>

    <asp:DataList runat="server" ID="dlPhotos" Visible="false" ItemStyle-HorizontalAlign="Center" 
    RepeatDirection="Horizontal" RepeatColumns="4" ItemStyle-Width="150" CellSpacing="0" CellPadding="0">
    <HeaderTemplate><h2><%=strTitle %>:</h2></HeaderTemplate>
    <ItemTemplate>
        <div class="NotesAndTips">
            <div>
            <a href="phi.aspx?I=<%#Eval("ImageID") %>">
                <img title="<%#Eval("Title").ToString().Replace("\"", "") %>" 
                    src="<%#Eval("Thumbnail") %>" />
            </a>
            </div>
            <a title="<%#Eval("Title").ToString().Replace("\"", "") %>" 
                href="phi.aspx?I=<%#Eval("ImageID") %>"><%#Eval("Title") %></a>
        </div>
    </ItemTemplate>
    </asp:DataList>

</form>


<form method="get" action="ss.aspx">
    <h2>Search Articles</h2>
    Keywords: <input type="text" id="t" name="t" value="<%=Request["t"] %>" /> <input type="submit" value="Search Articles" />
    <input type="hidden" id="SearchType" name="SearchType"  value="Articles" />
    <div class="NotesAndTips">
        We've been publishing articles on skating for over a decade. Search here or <a href="al.aspx">check the entire article list</a>.
    </div>


    <asp:DataList runat="server" ID="dlArtiles" Visible="false" ItemStyle-HorizontalAlign="Center" 
    RepeatDirection="Horizontal" RepeatColumns="3" ItemStyle-Width="200" CellSpacing="0" CellPadding="0">
    <HeaderTemplate><h2><%=strTitle %>:</h2></HeaderTemplate>
    <ItemTemplate>
        <div class="NotesAndTips">
            <div>
            <a href="a.aspx?ID=<%#Eval("ArticleID") %>">
                <img title="<%#Eval("Description").ToString().Replace("\"", "") %>" 
                    src="<%#Eval("Icon") %>" />
            </a>
            </div>
            <a title="<%#Eval("Description").ToString().Replace("\"", "") %>" 
                href="a.aspx?ID=<%#Eval("ArticleID") %>"><%#Eval("Description") %></a>
                <div>
                    <%#Eval("LongDescription") %>
                </div>
        </div>
    </ItemTemplate>
    </asp:DataList>

</form>

<form method="get" action="ss.aspx">
    <h2>Search Posts</h2>
    Keywords: <input type="text" id="t" name="t" value="<%=Request["t"] %>" /> <input type="submit" value="Search Posts" />
    <input type="hidden" id="SearchType" name="SearchType"  value="Posts" />
    <div class="NotesAndTips">
        Search our What's Up blog that we've been posting on here for over a decade.  You can <a href="whatsnew.aspx">view the full archives here</a>.
    </div>

    <asp:DataList runat="server" ID="dlPosts" Visible="false"
    RepeatDirection="Horizontal" RepeatColumns="1" CellSpacing="0" CellPadding="0">
    <HeaderTemplate><h2><%=strTitle %>:</h2></HeaderTemplate>
    <ItemTemplate>
        <div style="margin:5px; padding:5px;">
            <a title="<%#Eval("Title").ToString().Replace("\"", "") %>" 
                href="w.aspx?ID=<%#Eval("WhatsNewID") %>"><%#Eval("Title") %></a>
                <div style="margin-left:20px;">
                    Posted by <%#Eval("PostedBy") %> on <%#Eval("DateAdded", "{0:D}") %>
                </div>
        </div>
    </ItemTemplate>
    </asp:DataList>

</form>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSidebar" Runat="Server">

<div class="BlogPost">
    <h2>Looking for Shoes? Click Your Size</h2>
    <div class="col-xs-2"><div class="SizeSelectionGridItemSmall"><a title="Size 5 Skate Shoes in Stock Now" href="cz.aspx?ID=7&SID=6">5</a></div></div>

<Products:Categories runat="server" />

<div class="BlogPost CategoryListSmall">
<h1>Additional Products</h1>
    <asp:SqlDataSource runat="server" ID="sdsFlagsMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOTSHOPProductGetFullFlagList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="10000" />
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sdsFlagsMenu">
        <ItemTemplate>
            | <a title="<%# Eval("SearchTextDescription").ToString().Replace("\"", "")%>" 
	            href="f.aspx?ID=<%# Eval("FlagID")%>">
                <%# Eval("Description")%>
            </a>
        </ItemTemplate>
        <FooterTemplate> | </FooterTemplate>
    </asp:Repeater>
</div>


</asp:Content>

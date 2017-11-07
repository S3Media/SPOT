<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="cz.aspx.cs" Inherits="cz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">


<meta name="description" content="<%=strTitle %>. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="<%=strTitle %> at SPoT Skate Shop">
<meta itemprop="description" content="<%=strTitle %>. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta itemprop="image" content="http://www.skateparkoftampa.com/spot/images3/circlecity450.jpg">

<meta property="og:title" content="<%=strTitle %> at SPoT Skate Shop"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa <%=strCategory %>"/>
<meta property="og:description" content="<%=strTitle %>: All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>


<script type="text/javascript">

    $(document).ready(function () {

        <%=strHideMain %>

        $(".NewArrivalsPagesLink").click(function (e) {
            e.preventDefault();
            //fill the NewArrivals div with the page they clicked
            //alert($(this).attr("href"));
            $(".NewArrivalsPagesLink").css('color', '#d52626');
            //set link clicked to green
            $(this).css('color', 'green');

            $.ajax({
                url: "ajax/products_category_bysize.aspx?M=<%=Request["M"] %>&SID=<%=Request["SID"] %>&P=" + $(this).html().trim() + "&ID=<%=Request["ID"] %>",
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


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">



<div class="BlogPost">
<h1><%=strCompany %> <%=strCategory %> in Stock: Size <%=strSize %></h1>

    <asp:Label runat="server" ID="lblMessage" />
    <asp:SqlDataSource runat="server" ID="sdsPages" SelectCommand="SPOT2012CategoryProductsNumberOfPagesBySize" ConnectionString="<%$ConnectionStrings:CS %>"
        SelectCommandType="StoredProcedure" EnableCaching="true" CacheDuration="10000">
    <SelectParameters>
        <asp:QueryStringParameter Name="CategoryID" QueryStringField="ID" />
        <asp:QueryStringParameter Name="SizeID" QueryStringField="SID" />
        <asp:QueryStringParameter Name="ManufacturerID" QueryStringField="M" DefaultValue="0" />
    </SelectParameters> 
    </asp:SqlDataSource>
    <asp:Repeater runat="server" ID="rptPages" DataSourceID="sdsPages">
    <HeaderTemplate>
        <div class="ProductPager">
        More <%=strTitle %>: 
            <span>
    </HeaderTemplate>
    <ItemTemplate>
                <a class="NewArrivalsPagesLink" href="cz.aspx?ID=<%=Request.QueryString["ID"] %>&SID=<%=Request.QueryString["SID"] %>&M=<%=Request.QueryString["M"] %>&P=<%#Eval("PageNumber") %>"><%#Eval("PageNumber") %></a>
    </ItemTemplate>
    <FooterTemplate>
            </span>
        </div>
    </FooterTemplate>
    </asp:Repeater>





    <div id="NewArrivals">
        <asp:SqlDataSource runat="server" ID="sdsNew"
            SelectCommand="SPOT2012CategoryProductsNewArrivalsPagedBySize" SelectCommandType="StoredProcedure"
            ConnectionString="<%$ ConnectionStrings:CS %>"
            EnableCaching="true" CacheDuration="3000">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="ID" Name="CategoryID" />
                <asp:QueryStringParameter QueryStringField="P" Name="Page" DefaultValue="1" />
                <asp:QueryStringParameter QueryStringField="SID" Name="SizeID" />
                <asp:QueryStringParameter QueryStringField="M" Name="ManufacturerID" DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Repeater ID="rptNew" DataSourceID="sdsNew" runat="server">
        <ItemTemplate>
                <div class="ProductBlock">
                
                    <a href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>"><img 
                        title="<%#Eval("Name") %> <%#Eval("Color") %> <%#Eval("ShortDescr") %>" width="190" height="190" 
                        src="http://www.skateparkoftampa.com/spot/productimages/colors/<%#Eval("ColorID") %>_<%#Eval("ProductID") %>.jpg" /></a>
                
                    <div class="ProductBlockText"><%#Eval("Name")%> 
                        <%#Eval("ShortDescr")%> <%#Eval("Color")%> <%#Eval("CurrentPrice", "{0:c}")%>
                    </div>
                    <div class="ProductBlockTextAlert">
                        <%#Eval("SaleNote") %> <%#Eval("FreeShippingNote") %>
                        <%#Eval("InShopOnly")%>
                    </div>

                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>



    <asp:Repeater runat="server" ID="rptPages2" DataSourceID="sdsPages">
    <HeaderTemplate>
        <div class="ProductPager">
        More <%=strTitle %>: 
            <span>
    </HeaderTemplate>
    <ItemTemplate>
                <a class="NewArrivalsPagesLink" href="cz.aspx?ID=<%=Request.QueryString["ID"] %>&SID=<%=Request.QueryString["SID"] %>&M=<%=Request.QueryString["M"] %>&P=<%#Eval("PageNumber") %>"><%#Eval("PageNumber") %></a>
    </ItemTemplate>
    <FooterTemplate>
            </span>
        </div>
    </FooterTemplate>
    </asp:Repeater>


</div>


</asp:Content>






<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

<asp:Panel runat="server" ID="pnlShoes">
<div class="BlogPost">
<h1>Select Your Shoe Size</h1>
    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 5 In Stock Now" href="cz.aspx?ID=7&SID=6&M=<%=Request.QueryString["M"] %>">5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 5.5 In Stock Now" href="cz.aspx?ID=7&SID=7&M=<%=Request.QueryString["M"] %>">5.5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 6 In Stock Now" href="cz.aspx?ID=7&SID=8&M=<%=Request.QueryString["M"] %>">6</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 6.5 In Stock Now" href="cz.aspx?ID=7&SID=9&M=<%=Request.QueryString["M"] %>">6.5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 7 In Stock Now" href="cz.aspx?ID=7&SID=10&M=<%=Request.QueryString["M"] %>">7</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 7.5 In Stock Now" href="cz.aspx?ID=7&SID=11&M=<%=Request.QueryString["M"] %>">7.5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 8 In Stock Now" href="cz.aspx?ID=7&SID=12&M=<%=Request.QueryString["M"] %>">8</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 8.5 In Stock Now" href="cz.aspx?ID=7&SID=13&M=<%=Request.QueryString["M"] %>">8.5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 9 In Stock Now" href="cz.aspx?ID=7&SID=14&M=<%=Request.QueryString["M"] %>">9</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 9.5 In Stock Now" href="cz.aspx?ID=7&SID=15&M=<%=Request.QueryString["M"] %>">9.5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 10 In Stock Now" href="cz.aspx?ID=7&SID=16&M=<%=Request.QueryString["M"] %>">10</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 10.5 In Stock Now" href="cz.aspx?ID=7&SID=17&M=<%=Request.QueryString["M"] %>">10.5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 11 In Stock Now" href="cz.aspx?ID=7&SID=18&M=<%=Request.QueryString["M"] %>">11</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 11.5 In Stock Now" href="cz.aspx?ID=7&SID=19&M=<%=Request.QueryString["M"] %>">11.5</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 12 In Stock Now" href="cz.aspx?ID=7&SID=20&M=<%=Request.QueryString["M"] %>">12</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 13 In Stock Now" href="cz.aspx?ID=7&SID=22&M=<%=Request.QueryString["M"] %>">13</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 14 In Stock Now" href="cz.aspx?ID=7&SID=24&M=<%=Request.QueryString["M"] %>">14</a></div>    <div class="SizeSelectionGridItemSmall"><a title="<%=strCompany %> <%=strCategory %> Size 15 In Stock Now" href="cz.aspx?ID=7&SID=26&M=<%=Request.QueryString["M"] %>">15</a></div>    <div style="clear:both; font-size:.7em; text-align:center;"><a href="c.aspx?ID=<%=Request.QueryString["ID"] %>">View All Sizes</a></div>
</div>
</asp:Panel>
<asp:Panel runat="server" ID="pnlOtherCategorySizeSelection">
<div class="BlogPost">
<h1><%=strCategory %> Sizes</h1>
    <asp:SqlDataSource runat="server" ID="sdsSizes" SelectCommand="SPOT2012CategorySizes" SelectCommandType="StoredProcedure"
     ConnectionString="<%$ConnectionStrings:CS %>">
    <SelectParameters><asp:QueryStringParameter Name="CategoryID" QueryStringField="ID" /></SelectParameters>
    </asp:SqlDataSource>
    <asp:Repeater runat="server" ID="rptSizes" DataSourceID="sdsSizes">
        <HeaderTemplate><ul></HeaderTemplate>
        <ItemTemplate>
            <li>
            <a href="cz.aspx?ID=<%=Request.QueryString["ID"] %>&SID=<%#Eval("SizeID") %>&M=<%=Request.QueryString["M"] %>"><%#Eval("Description") %></a>
            </li>
        </ItemTemplate>
        <FooterTemplate></ul>
        <div style="clear:both; font-size:.7em; text-align:center;"><a href="c.aspx?ID=<%=Request.QueryString["ID"] %>">View All Sizes</a></div>
        </FooterTemplate>
    </asp:Repeater>

</div>
</asp:Panel>

<asp:SqlDataSource runat="server" ID="sdsBrands" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012CategoryBrandSummary" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="6000">
    <SelectParameters>
        <asp:QueryStringParameter Name="CategoryID" QueryStringField="ID" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:Repeater ID="dlBrands" runat="server"
    DataSourceID="sdsBrands">
    <HeaderTemplate>
        <div class="BlogPost">
        <h1>Companies in Stock Now:<br /><%=strCategory %></h1>

    </HeaderTemplate>
    <ItemTemplate>
        <div class="NewArrivalSmallBlock" style="height:90px;">
            <div>
                <a title="<%#Eval("Name").ToString().Replace("\"", "")%> size <%=strSize %> <%=strCategory %> in Stock Now" 
                href="cz.aspx?ID=<%=Request.QueryString["ID"] %>&SID=<%=Request.QueryString["SID"] %>&M=<%# Eval("ManufacturerID")%>">
                <img height="60" width="60" 
                src="http://www.skateparkoftampa.com/spot/productimages/<%# Eval("ManufacturerID")%>mfgrthumb.jpg" 
                title="<%#Eval("Name").ToString().Replace("\"", "")%> size <%=strSize %> <%=strCategory %> in Stock Now" />
                </a>
            </div>
            <div class="NotesAndTips">
                <a title="<%#Eval("Name").ToString().Replace("\"", "")%> size <%=strSize %> <%=strCategory %> in Stock Now" 
                href="cz.aspx?ID=<%=Request.QueryString["ID"] %>&SID=<%=Request.QueryString["SID"] %>&M=<%# Eval("ManufacturerID")%>">
                <%# Eval("Name")%>
                </a>
            </div>
        </div>
    </ItemTemplate>
    <FooterTemplate>
        </div>
    </FooterTemplate>
</asp:Repeater>


</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="f.aspx.cs" Inherits="f" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">

<meta name="description" content="<%=strTitle %> Skateboarding Gear. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993.">
<meta itemprop="name" content="<%=strTitle %> Skateboarding Gear in stock at SPoT Skate Shop">
<meta itemprop="description" content="<%=strTitle %> Skateboarding Gear in stock at SPoT Skate Shop. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response.">
<meta property="og:title" content="<%=strTitle %> Skateboarding Gear in stock at SPoT Skate Shop"/>
<meta property="og:type" content="product"/>
<meta property="og:site_name" content="SPoT Skate Shop at Skatepark of Tampa"/>
<meta property="og:description" content="<%=strTitle %> Skateboarding Gear. All stuff shown is in stock with immediate shipping and great service. Email us at info@skateparkoftampa.com anytime for a quick response. Skatepark of Tampa: A crusty little warehouse in Tampa, Florida with the best service and selection in skateboarding since 1993."/>


<script type="text/javascript">

    $(document).ready(function () {
        $(".NewArrivalsPagesLink").click(function (e) {
            e.preventDefault();
            //fill the NewArrivals div with the page they clicked
            //alert($(this).attr("href"));
            $(".NewArrivalsPagesLink").css('color', '#d52626');
            //set link clicked to green
            $(this).css('color', 'green');

            $.ajax({
                url: "ajax/products_flag_arrivals.aspx?P=" + $(this).html().trim() + "&ID=<%=Request["ID"] %>",
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
<h1><%=strTitle %> in Stock Now, Immediate Shipping</h1>


<div class="BlogPost">

    <asp:SqlDataSource runat="server" ID="sdsPages" SelectCommand="SPOT2012FlagProductsNumberOfPages" ConnectionString="<%$ConnectionStrings:CS %>"
        SelectCommandType="StoredProcedure" EnableCaching="true" CacheDuration="10000">
    <SelectParameters><asp:QueryStringParameter Name="FlagID" QueryStringField="ID" /></SelectParameters> 
    </asp:SqlDataSource>
    <asp:Repeater runat="server" ID="rptPages" DataSourceID="sdsPages">
    <HeaderTemplate>
        <div class="ProductPager">
        More: 
            <span>
    </HeaderTemplate>
    <ItemTemplate>
                <a class="NewArrivalsPagesLink" href="f.aspx?ID=<%=Request.QueryString["ID"] %>&P=<%#Eval("PageNumber") %>"><%#Eval("PageNumber") %></a>
    </ItemTemplate>
    <FooterTemplate>
            </span>
        </div>
    </FooterTemplate>
    </asp:Repeater>





    <div id="NewArrivals">
        <div class="row">
        <asp:SqlDataSource runat="server" ID="sdsNew"
            SelectCommand="SPOT2012FlagProductsNewArrivalsPaged" SelectCommandType="StoredProcedure"
            ConnectionString="<%$ ConnectionStrings:CS %>"
            EnableCaching="true" CacheDuration="3000">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="ID" Name="FlagID" />
                <asp:QueryStringParameter QueryStringField="P" Name="Page" DefaultValue="1" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Repeater ID="rptNew" DataSourceID="sdsNew" runat="server">
        <ItemTemplate>
                <div class="col-xs-6 col-sm-4 ProductBlock">
                
                    <a href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>"><img 
                        title="<%#Eval("Name") %> <%#Eval("Color") %> <%#Eval("ShortDescr") %>" class="img-responsive img-center"
                        src="https://skateparkoftampa.com/spot/productimages/colors/<%#Eval("ColorID") %>_<%#Eval("ProductID") %>.jpg" /></a>
                
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
        </div>



<asp:Repeater runat="server" ID="rptPages2" DataSourceID="sdsPages">
<HeaderTemplate>
    <div class="ProductPager">
    More New <%=strTitle %>: 
        <span>
</HeaderTemplate>
<ItemTemplate>
            <a class="NewArrivalsPagesLink" href="f.aspx?ID=<%=Request.QueryString["ID"] %>&P=<%#Eval("PageNumber") %>"><%#Eval("PageNumber") %></a>
</ItemTemplate>
<FooterTemplate>
        </span>
    </div>
</FooterTemplate>
</asp:Repeater>


</div>




</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

<h1>Products in Stock Now</h1>
<div class="BlogPost CategoryListSmall">
    <asp:SqlDataSource runat="server" ID="sdsCategoryMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012CategoryList" SelectCommandType="StoredProcedure"
    EnableCaching="true" CacheDuration="10000" />
    <asp:Repeater ID="rptCategories" runat="server" DataSourceID="sdsCategoryMenu">
        <ItemTemplate>
            | <a title="Skateboarding <%# Eval("Description")%>"
                href="c.aspx?ID=<%# Eval("CategoryID")%>">
                <%# Eval("Description") %>
            </a>
        </ItemTemplate>
        <FooterTemplate> | </FooterTemplate>
    </asp:Repeater>
</div>
<h1>Additional Products</h1>
<div class="BlogPost CategoryListSmall">
    <asp:SqlDataSource runat="server" ID="sdsFlagsMenu" ConnectionString="<%$ ConnectionStrings:CS %>"
    SelectCommand="SPOT2012FlagList" SelectCommandType="StoredProcedure"
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


<%@ Page Title="" Language="C#" MasterPageFile="SPoT.master" AutoEventWireup="true" CodeFile="cm.aspx.cs" Inherits="cm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
<div class="BlogPost">
<h1><%=strName%> <%=strCategory%> in Stock Now</h1>
    <div class="row">
<asp:SqlDataSource runat="server" ID="sdsList"
SelectCommand="SPOT2012ManufacturerCategoryProducts" SelectCommandType="StoredProcedure"
ConnectionString="<%$ ConnectionStrings:CS %>"
EnableCaching="true" CacheDuration="3000">
<SelectParameters>
    <asp:QueryStringParameter QueryStringField="M" Name="ManufacturerID" />
    <asp:QueryStringParameter QueryStringField="C" Name="CategoryID" />
</SelectParameters>
</asp:SqlDataSource>
<asp:Repeater runat="server" ID="rptList" DataSourceID="sdsList">
<ItemTemplate>
                <div class="col-xs-6 col-sm-4 ProductBlock">
                
                    <a title="<%#Eval("Name") %> <%#Eval("Color") %> <%#Eval("ShortDescr") %>" 
                    href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>"><img 
                        title="<%#Eval("Name") %> <%#Eval("Color") %> <%#Eval("ShortDescr") %>" width="190" height="190" 
                        src="http://<%=Request.ServerVariables["HTTP_HOST"] %><%=ConfigurationSettings.AppSettings["SPoTFolder"] %>productimages/colors/<%#Eval("ColorID") %>_<%#Eval("ProductID") %>.jpg" /></a>
                
                    <div class="ProductBlockText">
                        <a title="<%#Eval("Name") %> <%#Eval("Color") %> <%#Eval("ShortDescr") %>" 
                            href="p.aspx?ID=<%#Eval("ProductID") %>&CID=<%#Eval("ColorID") %>">
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
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSidebar" Runat="Server">

<asp:SqlDataSource runat="server" ID="sdsCategories" SelectCommand="SPOT2012ManufacturerCategories" EnableCaching="true" CacheDuration="10000" 
    SelectCommandType="StoredProcedure" ConnectionString="<%$ConnectionStrings:CS %>">
<SelectParameters>
    <asp:QueryStringParameter Name="ManufacturerID" QueryStringField="M" />
</SelectParameters>
</asp:SqlDataSource>
<asp:Repeater runat="server" id="rptCategories" DataSourceID="sdsCategories">
<HeaderTemplate>
    <div class="BlogPost">
      <h1><%=strName %></h1>
    <a href="m.aspx?ID=<%=Request.QueryString["M"] %>">
        <img title="<%=strName %>" alt="<%=strName %>" src="<%=strImageURL %>" class="img-responsive img-center" />
    </a>
          <div>
                    <span class="counter-fb-like">
                        <iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fskateparkoftampa.com%2Fspot%2Fm.aspx%3FID%3D<%=Request.QueryString["ID"] %>&amp;send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21&amp;appId=128422270572394" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:80px; height:21px;" allowTransparency="true"></iframe>
                    </span>
                    <span class="counter-twitter">
                        <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://skateparkoftampa.com/spot/m.aspx?ID=<%=Request.QueryString["ID"] %>" data-count="horizontal" data-via="SPoTTampa">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
                    </span>
            </div>

    </div>
    <div class="BlogPost">
        <h1><%=strName %> Categories</h1>
        <ul>
</HeaderTemplate>
<ItemTemplate>
        <li>
            <a title="<%=strName %> <%#Eval("Description") %>" 
                href="cm.aspx?M=<%=Request.QueryString["M"] %>&C=<%#Eval("CategoryID") %>"><%#Eval("Description") %></a>
        </li>
</ItemTemplate>
<FooterTemplate>
        </ul>
    </div>
</FooterTemplate>
</asp:Repeater>

<%if (strName.Equals("NEFF")){ %>
    <div class="BlogPost">
        <h1>Get Hooked Up!</h1>
            <img src="http://skateparkoftampa.com/spot/images2011/neff.jpg"/>
    </div>
<%}%>

<div class="BlogPost">
<h1>Related Links</h1>

    <ul>
        <li><a href="/staff">Meet the SPoT Staff</a>
            <div class="NotesAndTips">
            We've been here since 1993. 
            Meet the crew that does everything from coding the website to packing and shipping your order.
            It's a nice list of skate nerds.</div>
        </li>
        <li>
            <a href="/feedback">Customer Feedback</a>
            <div class="NotesAndTips">
                Check our feedback to see what other customers have been saying for years. We've been giving great service online for over 10 years. You can find a long list of our real customer testimonials here.
            </div>
        </li>

        
    </ul>
</div>



</asp:Content>


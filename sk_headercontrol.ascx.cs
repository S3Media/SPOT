using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Practices.EnterpriseLibrary.Data;

public partial class sk_headercontrol : System.Web.UI.UserControl
{
    public string strSkaterName;
    public string strTwitter;
    public string strInsta;
    public string strProductsMoreLink;
    public string strImageURL;

    protected void Page_Load(object sender, EventArgs e)
    {
        //how to avoid this trip to DB? Get skater name from sk.aspx page somehow?
        strSkaterName = DatabaseFactory.CreateDatabase().ExecuteScalar("SPOT2012SkaterClickLogReturnName", 
            Request.QueryString["ID"]).ToString();

        string strInfoType = Request.QueryString["T"];
        switch (strInfoType)
        {
            case "Photos":
                GetPhotos();
                break;
            case "Coverage":
                GetCoverage();
                break;
            case "News":
                GetNews();
                break;
            case "Results":
                GetResults();
                break;
            case "Products":
                ShowProducts();
                break;
            case "Tweets":
                ShowTweets();
                break;
            case "Instagram":
                GetInsta();
                break;
            case "Mugs":
                GetMugs();
                break;
            default:
                ShowRandomProducts();
                break;
        }

        strImageURL = "http://www.skateparkoftampa.com/spot/headshots/" + Request.QueryString["ID"] + ".jpg";
    }


    protected void GetMugs()
    {
        pnlMugs.Visible = true;
        rptMugHistory.DataSource = DatabaseFactory.CreateDatabase().ExecuteDataSet("SPOT2012SkatersMugShotRecent", Request.QueryString["ID"]);
        rptMugHistory.DataBind();
        if (rptMugHistory.Items.Count < 1)
        {
            pnlMugs.Visible = false;
            lblMessage.Text = "No mugshot history found for " + strSkaterName;
            lblMessage.CssClass = "ErrorMessages";
        }
    }

    protected void GetInsta()
    {

        strInsta = DatabaseFactory.CreateDatabase().ExecuteScalar("SPOT2012SkatersInsta", Request.QueryString["ID"]).ToString();
        try
        {
            if (strInsta != "" && strInsta != null)
            {
                XmlDataSource xmlSource = new XmlDataSource();
                xmlSource.DataFile = "http://statigr.am/feed/" + strInsta;
                xmlSource.XPath = "rss/channel/item";
                rptInsta.DataSource = xmlSource;
                rptInsta.DataBind();
                pnlInsta.Visible = true;
            }
            else
            {
                pnlInsta.Visible = false;
                lblMessage.Text = "No Instagram found for " + strSkaterName + ".<br />Check out all pros and ams on Instagram at <a href=\"http://skateparkoftampa.com/insta\">skateparkoftampa.com/Insta</a>";
                lblMessage.CssClass = "ErrorMessages";
            }
        }
        catch (Exception ex)
        {
            //Response.Write(ex.Message);
            //if this site fails, just hide instagram feed
            pnlInsta.Visible = false;
            lblMessage.Text = "Ah crap, something's up at Instagram. There was an error getting " + strSkaterName + " Instagram photos. Please try again later.";
            lblMessage.CssClass = "ErrorMessages";
        }
    }

    protected void GetResults()
    {
        pnlResults.Visible = true;
        rptResultsHistory.DataSource = DatabaseFactory.CreateDatabase().ExecuteDataSet("SPOT2012SkatersContestHistoryAll", Request.QueryString["ID"]);
        rptResultsHistory.DataBind();
        if (rptResultsHistory.Items.Count < 1)
        {
            pnlResults.Visible = false;
            lblMessage.Text = "No contest results history found for " + strSkaterName;
            lblMessage.CssClass = "ErrorMessages";
        }
    }

    protected void GetPhotos()
    {
        pnlPhotos.Visible = true;
        rptPhotos.DataSource = DatabaseFactory.CreateDatabase().ExecuteDataSet("SPOT2012SkaterPhotosAll", Request.QueryString["ID"]);
        rptPhotos.DataBind();
        if (rptPhotos.Items.Count < 1)
        {
            pnlPhotos.Visible = false;
            lblMessage.Text = "No photos of " + strSkaterName + " found.";
            lblMessage.CssClass = "ErrorMessages";
        }
    }


    protected void GetCoverage()
    {
        pnlCoverage.Visible = true;

        rptCoverage.DataSource = DatabaseFactory.CreateDatabase().ExecuteDataSet("SPOT2012SkatersCoverageAll", Request.QueryString["ID"]);
        rptCoverage.DataBind();
        if (rptCoverage.Items.Count < 1)
        {
            rptCoverage.Visible = false;
            lblMessage.Text = "No coverage found for " + strSkaterName + ".";
            lblMessage.CssClass = "ErrorMessages";
        }
    }

    protected void ShowProducts()
    {
        rptSkaterProducts.Visible = true;
        rptSkaterProducts.DataSource = DatabaseFactory.CreateDatabase().ExecuteDataSet("SPOT2012SkatersProductsRecent",
            Request.QueryString["ID"]);
        rptSkaterProducts.DataBind();
        if (rptSkaterProducts.Items.Count < 1)
        {
            rptSkaterProductsRandom.Visible = true;
            rptSkaterProducts.Visible = false;
        }
    }

    protected void ShowTweets()
    {
        strTwitter = DatabaseFactory.CreateDatabase().ExecuteScalar("SPOT2012SkatersTwitter", Request.QueryString["ID"]).ToString();
        if (strTwitter.Length < 5)
        {
            lblMessage.Text = "Sorry, no twitter feed for " + strSkaterName + " was found.";
            pnlTwitter.Visible = false;
        }
        else
        {
            pnlTwitter.Visible = true;
        }
    }

    protected void ShowRandomProducts()
    {
        rptSkaterProducts.Visible = true;
        rptSkaterProducts.DataSource = DatabaseFactory.CreateDatabase().ExecuteDataSet("SPOT2012SkatersProductsRecent",
            Request.QueryString["ID"]);
        rptSkaterProducts.DataBind();
        if (rptSkaterProducts.Items.Count < 1)
        {
            rptSkaterProductsRandom.Visible = true;
            rptSkaterProducts.Visible = false;
            strProductsMoreLink = "";
        }
        else
        {
            strProductsMoreLink = "<a href=\"skpp.aspx?ID=" + Request.QueryString["ID"] + "\" title=\"" + strSkaterName.Replace("\"", "") + 
                " Skateboarding Products\">View All " + strSkaterName + " Products</a>";
        }
    }


    protected void GetNews()
    {
        rptSkaterNews.Visible = true;
        rptSkaterNews.DataSource = DatabaseFactory.CreateDatabase().ExecuteDataSet("SPOT2012SkatersNotesLastSix",
            Request.QueryString["ID"]);
        rptSkaterNews.DataBind();
        if (rptSkaterNews.Items.Count < 1)
        {
            rptSkaterNews.Visible = false;
            lblMessage.Text = "There was no skater news found for " + strSkaterName + ".<br />Get all the daily skate news and videos at <a href=\"http://skateparkoftampa.com/news\">skateparkoftampa.com/News</a>";
            lblMessage.CssClass = "ErrorMessages";
        }
    }
}
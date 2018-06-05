using System;
using System.Collections.Generic;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Xml;
using System.IO;
using System.Net;
using System.Text;

public partial class cart : System.Web.UI.Page
{
    public string strWhoDat;
    public string strCartID;
    public string strMessage;
    public int intCustomerID;
    public bool blnHasCouponDiscount;
    
    private Database _db = DatabaseFactory.CreateDatabase();
    public string strCouponSummary = "";
    public string strCouponApplyFeedback = "";
    public bool blnEmptyCart = true;
    public string strWeight;
    public string strZip;
    public string strState;

    public string strShippingOptions;
    public string strShippingErrorExplanation;

    protected void Page_Load(object sender, EventArgs e)
    {
                
            if (Request["CIDNO"] == "1")
            {
                //they're requesting to remove the coupon code here
                //do that first so it happens before the cart gets calculated
                _db.ExecuteNonQuery("SPOT2012RemoveCoupon", Request["CartID"]);
            }
            if (Request["CID"] != null)
            {
                ApplyCoupon();
            }
            if (Request["InventoryID"] != null)
            {
                UpdateCart();
            }
            if (Request["CartID"] != null && Request["CartID"] != "")
            {
                GetCart();
            }
            else
            {
                lblMessage.Text = "<div class=\"BlogPost\">There is nothing in your cart. Why not start with some of our <a href=\"staff.aspx\">Staff Recommendations</a>?</div>";
                rptCartRegular.Visible = false;
                rptCartDiscount.Visible = false;
                rptTotalsRegular.Visible = false;
                rptTotalsDiscount.Visible = false;
                DeleteAllCookies();
            }

        CheckLogin();
    }

    private void CheckLogin()
    {
        
        string strCustomerID;
        try
        {
            //see if they have a WhoDat cookie and if so, see if it's a valid customer id
            if (Request.Cookies["WhoDat"].Value != null)
            {
                strCustomerID = DecryptString(Request.Cookies["WhoDat"].Value);
                strWhoDat = Request.Cookies["WhoDat"].Value;
                //Response.Write("bind customer info, show shipping options. Customer ID is:" + strCustomerID);
                //BIND CUSTOMER INFO HERE AND ALSO SHOW SHIPPING OPTIONS
                if (blnEmptyCart == false)
                {
                    //show shipping choices
                }
                else
                {
                    //just show customer info
                }
            }
            pnlLoggedIn.Visible = true;
            pnlNotLoggedIn.Visible = false;
            ShowRates();
        }
        catch
        {
            pnlNotLoggedIn.Visible = true;
            pnlLoggedIn.Visible = false;
        }
    }

    private void ApplyCoupon()
    {
        //here, see if it's a valid coupon
        //if not, set lblMessage telling them why
        lblMessage.Text = "<div class=\"BlogPost\"><h1>Coupon Code: " + Request["CID"] + "</h1>" + _db.ExecuteScalar("SPOT2012CouponApplyValidate", Request["CID"], Request["CartID"]).ToString() + "</div>";
        
    }

    private void UpdateCart()
    {
        string strAffiliateID = "0";
        try
        {
            //0 is SPoT, 1 is skateboard.com
            strAffiliateID = Request.Cookies["AffiliateID"].Value;
        }
        catch
        {
            //if affiliateid cookie can't be read, just set it as the default, 0
            strAffiliateID = "0";
        }

        string strReferer = "";
        //the SavedHTTP_REFERER cookie is saved in the session_start event
        try
        {
            strReferer = Request.Cookies["SavedHTTP_REFERER"].Value;
        }
        catch
        {
            strReferer = "";
            //do nothing
        }

        string strCustomerID;
        try
        {
            strCustomerID = DecryptString(Request.Cookies["WhoDat"].Value);
        }
        catch
        {
            strCustomerID = null;
        }

        Response.Cookies["CartID"].Value = _db.ExecuteScalar("SPOT2012CartAddItem",
            Request["CartID"], Request["InventoryID"], Request["Quantity"],
            strCustomerID, strAffiliateID, strReferer).ToString();
        Response.Cookies["CartID"].Expires = DateTime.Now.AddMonths(12);

    }

    private void GetCart()
    {
        if (DiscountCart())
        {
            //show cart with discount fields
            rptCartDiscount.DataSource = _db.ExecuteDataSet("SPOT2012CartGet", Request["CartID"]);
            rptCartDiscount.DataBind();
            rptCartRegular.Visible = false;
            if (rptCartDiscount.Items.Count < 1)
            {
                blnEmptyCart = true;
                lblMessage.Text = "<div class=\"BlogPost\">There is nothing in your cart. Why not start with some of our <a href=\"staff.aspx\">Staff Recommendations</a>?</div>";
                rptCartRegular.Visible = false;
                rptCartDiscount.Visible = false;
                rptTotalsRegular.Visible = false;
                rptTotalsDiscount.Visible = false;
                DeleteAllCookies();
            }
            else
            {
                //show totals
                rptTotalsDiscount.DataSource = _db.ExecuteDataSet("SPOT2012CartGetTotals", Request["CartID"]);
                rptTotalsDiscount.DataBind();
                rptTotalsRegular.Visible = false;
                
            }
            //adjust strCouponSummary - strips out the beginning "YES" used in the DiscountCart procedure below - saves a trip to the DB
            strCouponSummary = "<div class=\"BlogPost\">" + strCouponSummary.Substring(3, strCouponSummary.Length - 3) + "</div>";
        }
        else
        {
            //show regular cart
            rptCartRegular.DataSource = _db.ExecuteDataSet("SPOT2012CartGet", Request["CartID"]);
            rptCartRegular.DataBind();
            rptCartDiscount.Visible = false;
            if (rptCartRegular.Items.Count < 1)
            {
                blnEmptyCart = true;
                lblMessage.Text = "<div class=\"BlogPost\">There is nothing in your cart. Why not start with some of our <a href=\"staff.aspx\">Staff Recommendations</a>?</div>";
                rptCartRegular.Visible = false;
                rptCartDiscount.Visible = false;
                rptTotalsRegular.Visible = false;
                rptTotalsDiscount.Visible = false;
                DeleteAllCookies();
            }
            else
            {
                //show totals
                rptTotalsRegular.DataSource = _db.ExecuteDataSet("SPOT2012CartGetTotals", Request["CartID"]);
                rptTotalsRegular.DataBind();
                rptTotalsDiscount.Visible = false;
                
            }
        }

    }

    private bool DiscountCart()
    {
        bool blnDiscount;
        try
        {
            strCouponSummary = _db.ExecuteScalar("SPOT2012CartCheckSaleOrCouponCode", Request["CartID"]).ToString();
            if (strCouponSummary.Substring(0, 3) == "YES")
            {
                blnDiscount = true;
            }
            else
            {
                blnDiscount = false;
            }
        }
        catch
        {
            blnDiscount = false;
        }

        return blnDiscount;
    }

    private void DeleteAllCookies()
    {


        /*
        //there were some weird errors where browsers were storing blank, not null, cookies
        //this make sure their cookes start over 100% from scratch if they get the "nothing in cart" message
        //on browsers that was happening on, the problem was fixed if the user deleted all their cookies manually
        string[] cookies = Request.Cookies.AllKeys;
        foreach (string cookie in cookies)
        {
            Response.Cookies[cookie].Expires = DateTime.Now.AddDays(-1);
        }
        */

        //Oct 28, 2010, changed this to just delete the CartID cookie
        //Response.Cookies["CartID"].Expires = DateTime.Now.AddDays(-1);
    }



    private string EncryptString(string strEncrypted)
    {
        try
        {
            byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrypted);
            string encryptedConnectionString = Convert.ToBase64String(b);
            return encryptedConnectionString;
        }
        catch
        {
            throw;
        }
    }

    private string DecryptString(string encrString)
    {
        try
        {
            byte[] b = Convert.FromBase64String(encrString);
            string decryptedConnectionString = System.Text.ASCIIEncoding.ASCII.GetString(b);
            return decryptedConnectionString;
        }
        catch
        {
            throw;
        }
    }


    protected void ShowRates()
    {
        if (HasCart())
        {
            GetShippingOptions();
            strCartID = EncryptString(Request["CartID"]);
        }
        else
        {
            strMessage = "I didn't find anything in your cart so you can't really check out.  Email us at info@skateparkoftampa.com if you have any questions.";
            pnlUPS.Visible = false;
        }
    }

    protected void GetShippingOptions()
    {
        //now, see if they have a coupon code - this is used later when shipping options are displayed
        if (float.Parse(_db.ExecuteScalar("SPOT2012CartHasCouponDiscount", Request["CartID"]).ToString()) > 0)
        { blnHasCouponDiscount = true; }
        else
        { blnHasCouponDiscount = false; }
        try
        {
            //get their cart weight
            strWeight = _db.ExecuteScalar("SPOT2012CartWeight", Request.Cookies["CartID"].Value).ToString();
            //strWeight is now in ounces, we need to convert to pounds by dividing by 16
            if (int.Parse(strWeight) < 16)
            { strWeight = "1"; }
            else
            { strWeight = (int.Parse(strWeight) / 16).ToString(); }
        }
        catch
        {
            //if there's an error getting their cart weight due to an improperly set up product, just set the weight to 1lb
            strWeight = "1";
        }
        strZip = _db.ExecuteScalar("SPOT2012CustomerZipCode", DecryptString(Request.Cookies["WhoDat"].Value)).ToString();
        strState = _db.ExecuteScalar("SPOT_2018CustomerState", DecryptString(Request.Cookies["WhoDat"].Value)).ToString();
        //now, the fucked up procedure of getting shipping rates from UPS:
        GetUPSRates();
        //here, I'm logging customers that made it to this page so later on, I can compare who made it here and didn't place an order
        _db.ExecuteNonQuery("SPOT2012CartAbandonLogEntry", DecryptString(Request.Cookies["WhoDat"].Value), Request["CartID"], 0);
    }

    protected void GetUPSRates()
    {
    	//adding dimensions, need to check if cart has a deck
    	String boxHeight;
    	String boxWidth;
    	String boxLength;
    	
		try
		{
	        String needsBigBox;
	        needsBigBox = _db.ExecuteScalar("SPOT2012CartHasDeck", Request["CartID"]).ToString();
	        if (needsBigBox == "ADD")
	        {
	        	boxHeight = "8.00";
	        	boxWidth = "10.50";
	        	boxLength = "33.00";
	        }
	        else
	        {
	        	boxHeight = "6.00";
	        	boxWidth = "10.00";
	        	boxLength = "18.00";
	        } 
	    }
	    catch
	    {
	    	// error getting cart info
			boxHeight = "8.00";
			boxWidth = "8.00";
			boxLength = "8.00";	    	
	    }
    	
    
        //strShippingOptions = "get shit from ups here";
        try
        {

            String strXMLToSend;
            strXMLToSend = "<?xml version=\"1.0\"?><AccessRequest xml:lang=\"en-US\"><AccessLicenseNumber>8D435E22518C8888</AccessLicenseNumber><UserId>spotshipping</UserId><Password>D0ntSt3al!</Password></AccessRequest>";
            strXMLToSend += "<?xml version=\"1.0\"?>" +
                "<RatingServiceSelectionRequest xml:lang=\"en-US\">" +
                "<Request><TransactionReference><CustomerContext>Rating and Service</CustomerContext>" +
                "<XpciVersion>1.0001</XpciVersion></TransactionReference>" +
                "<RequestAction>Rate</RequestAction><RequestOption>shop</RequestOption>" +
                "</Request><PickupType><Code>01</Code></PickupType><Shipment><Shipper><Address><PostalCode>33605</PostalCode>" +
                "</Address></Shipper><ShipTo><Address>" +
                "<PostalCode>" + strZip + "</PostalCode><CountryCode>US</CountryCode></Address></ShipTo>" +
                "<Service><Code>11</Code></Service><Package><PackagingType><Code>02</Code><Description>Package</Description>" +
                "</PackagingType><Description>Rate Shopping</Description><PackageWeight>" +
                "<Weight>" + strWeight + "</Weight></PackageWeight>" +
				"<Dimensions><UnitOfMeasurement><Code>IN</Code><Description>Inches</Description></UnitOfMeasurement>" +
				"<Length>" + boxLength + "</Length><Width>" + boxWidth + "</Width><Height>" + boxHeight + "</Height>" +
                "</Dimensions></Package></Shipment></RatingServiceSelectionRequest>";
            String strXMLResult;
            strXMLResult = GetURI("https://www.ups.com/ups.app/xml/Rate", strXMLToSend);
            GetRateList(strXMLResult);
        }
        catch (Exception e)
        {
            //strShippingOptions = e.Message;
            strShippingOptions = "<input checked='true' type='radio' name = 'Rates' value =',UPS System Down - Adjust Shipping Later, $7.00,'>UPS System Is Down - your shipping amount, including any discounts, will be adjusted before your order is shipped. A $7.00 temp charge will be added. </option>";
            //Response.Write(e.Message + e.StackTrace);
            //pnlChooseShipping.Visible = true;
            strShippingErrorExplanation = "<div class=\"BlogPost\">What does UPS down mean?  Sometimes when we send your zip and cart weight to UPS to get shipping quotes, an error happens.  Rather than inconvenience you and ask you to come back or try again later, we just apply a temporary charge of $7 for shipping and let you  move on to checkout.  When we determine your real shipping cost, we will adjust the shipping amount down if necessary.  It will not be higher than $7 unless we get your permission first.  Feel free to email Rob for an more detailed explanation - rob@skateparkoftampa.com.";
        }
    }

    protected bool HasCart()
    {
        int intCartID = 0;
        try
        {
            intCartID = int.Parse(Request.Cookies["CartID"].Value);

        }
        catch
        {
            //if there's not cart id cookie, then they don't have a cart
            //Response.Write("NO CART ID");
            return false;
        }
        //now we have their cart id, check to see if there's stuff in it
        if (DatabaseFactory.CreateDatabase().ExecuteScalar("SPOT2012CartCheckItems", intCartID).ToString() == "OK")
        {
            //they have a cart, okay to proceed
            //Response.Write("cart found");
            return true;
        }
        else
        {
            return false;
        }
    }

    private string GetURI(string URI, string Parameters)
    {
        //got this code from Ollie Cornes [lotsofemail@cornes.org]
        //from a reply he made to someone on the wrox aspx list
        //it just makes an http request and returns in a string
        //the stuff returned from the server.  Add any form elements
        //you want posted in the Parameters variable
        string CommandURI = URI;
        WebRequest MyWebRequest = WebRequest.Create(CommandURI);
        MyWebRequest.Timeout = 4000;
        MyWebRequest.ContentType = "application/x-www-form-urlencoded";
        MyWebRequest.Method = "POST";
        byte[] bytes = System.Text.Encoding.ASCII.GetBytes(Parameters);
        MyWebRequest.ContentLength = bytes.Length;
        Stream OutputStream = MyWebRequest.GetRequestStream();
        OutputStream.Write(bytes, 0, bytes.Length);
        OutputStream.Close();
        WebResponse MyWebResponse = MyWebRequest.GetResponse();
        Stream MyStream = MyWebResponse.GetResponseStream();
        StreamReader MyStreamReader = new StreamReader(MyStream);
        return MyStreamReader.ReadToEnd().Trim();
    }


    private void GetRateList(String strXMLFromUPS)
    {
        float fltCartTotal;
        fltCartTotal = float.Parse(_db.ExecuteScalar("SPOT2012CartTotalsScalar", Request["CartID"]).ToString());
        //the first thing to do before the rate list is generated is to see if they have
        //something from the deck, complete, or grind rail category
        //if they do, add ten bucks to their non-ground shipping amounts
        String strResult;
        strResult = _db.ExecuteScalar("SPOT2012CartHasDeck", Request["CartID"]).ToString();
        Hashtable htServiceTypes = new Hashtable();
        htServiceTypes.Add("01", "UPS Next Business Day Air");
        htServiceTypes.Add("02", "UPS 2nd Business Day Air");
        htServiceTypes.Add("03", "UPS Ground");
        htServiceTypes.Add("12", "UPS Three Business Day Select");
        //initialize
        XmlNodeReader r = null;
        XmlDocument doc = new XmlDataDocument();
        string lastAction = "";
        StringBuilder sb = new StringBuilder();
        //sb.Append("Shipping options for a " + Request.Cookies["Weight"].Value + " ounce package from our zip code (33605) to your zip code (" + Request.Cookies["Zip"].Value + "):<br />");
        Stack s = new Stack();
        bool blnGetCost = false;
        int ctrNodeCounter = 0;
        string strRadioOption = "";

        //define
        doc.LoadXml(strXMLFromUPS);
        r = new XmlNodeReader(doc);

        lastAction = "";
        s.Push("start");
        while (r.Read())
        {
            switch (r.NodeType)
            {
                case XmlNodeType.Element:
                    lastAction = "element";
                    if (!r.IsEmptyElement)
                    {
                        s.Push(r.Name);
                    }

                    break;
                case XmlNodeType.Text:
                    if (htServiceTypes.Contains(r.Value))
                    {
                        strRadioOption = htServiceTypes[r.Value].ToString() + ", ";
                        blnGetCost = true;
                    }
                    if (blnGetCost == true)
                    {
                        ctrNodeCounter += 1;
                        if (ctrNodeCounter == 6)
                        //JAN 17, 2007 - THIS USED TO BE FIVE, BUT THEN THEY ADDED A NODE NOW IT'S SIXTH
                        //if we're at the fifth node down, get that value - it's the shipping cost
                        {
                            //not only are we adding 30%, but we're also tacking on an extra full dollar to the cost
                            //also, we're adding $10 if it's non-UPS Ground
                            if (strRadioOption.IndexOf("Ground") > 0)
                            {
                                //old line had a dollar added to it like this:
                                //strRadioOption += ((Double.Parse(r.Value) * 1.3) + 1).ToString("c");
                                //changed for 2012 and took out the buck, we get ups discounts now and can lower shipping
                                //2018 halved shipping price to compete with competition
                                //2018 Removed * 1.3 or 30% add on
                                strRadioOption += ((Double.Parse(r.Value) / 2)).ToString("c");

                                //strRadioOption += ((Double.Parse(r.Value) * 1.3 / 2)).ToString("c");
                                //strRadioOption += ((Double.Parse(r.Value))).ToString("c");
                            }
                            else
                            {
                                if (strResult == "ADD")
                                {
                                    //if they have a deck or a complete, add extra to their non-ground shipping options
                                    strRadioOption += ((Double.Parse(r.Value) * 1.1) + 11).ToString("c");
                                }
                                else
                                {
                                    //otherwise, just give them normal cost for non-ground shipping options
                                    //in 2018, removed 1.3 multiplier

                                    //strRadioOption += ((Double.Parse(r.Value) * 1.3)).ToString("c");
                                    strRadioOption += ((Double.Parse(r.Value))).ToString("c");
                                }
                            }

                            if (strRadioOption.IndexOf("Ground") > 0)
                            {
                                /*
                                 * AS OF JANUARY 2009, WE ARE NO LONGER DOING FREE SHIPPING FOR $89 ORDERS
                                
                                 * 
                                 * UPDATE: FOR THE MONTH OF DECEMBER 2009, WE ARE DOING FREE SHPPING FOR $39 OR MORE ORDERS 
                                march 30, 2010: free shipping over $49 returned
                                 * june 4, 2012: free shipping over $59 adjusted
                                 */
                                if (fltCartTotal > 59 && blnHasCouponDiscount == false && strState != "AK" && strState != "HI")
                                {
                                    strRadioOption = "<input checked='true' type='radio' name = 'Rates' value =',UPS Ground,0'>FREE UPS Ground Shipping, $0.00</option><br />";
                                    strRadioOption += "<input type='radio' name = 'Rates' value =',In Store Pickup,0'>In Store Pickup, $0.00</option><br />";
                                }
                                else if (strState == "HI" || strState == "AK")
                                {
                                    strRadioOption = "<input checked='true' type='radio' name = 'Rates' value =',UPS Ground,35'>UPS Ground Shipping, $35.00</option><br />";
                                    strRadioOption += "<input type='radio' name = 'Rates' value =',In Store Pickup,0'>In Store Pickup, $0.00</option><br />";
                                }
                                else
                                {
                                    strRadioOption = "<input checked='true' type='radio' name = 'Rates' value ='," + strRadioOption + ",'>" + strRadioOption + "</option><br />";
                                    strRadioOption += "<input type='radio' name = 'Rates' value =',In Store Pickup,0'>In Store Pickup, $0.00</option><br />";
                                }


                                //PUT THIS LINE BACK WHEN FREE SHIPPING PROMOTION IS OVER
                                //strRadioOption = "<input checked='true' type='radio' name = 'Rates' value ='," + strRadioOption + ",'>" + strRadioOption + "</option><br />";
                            }
                            else
                            {
                                strRadioOption = "<input type='radio' name = 'Rates' value ='," + strRadioOption + ",'>" + strRadioOption + " </option><br />";
                            }
                            sb.Append(strRadioOption);
                            ctrNodeCounter = 0;
                            blnGetCost = false;
                        }
                    }
                    lastAction = "text";
                    break;
                case XmlNodeType.CDATA:
                    lastAction = "cdata";
                    break;
                case XmlNodeType.ProcessingInstruction:
                    lastAction = "processinginstruction";
                    break;
                case XmlNodeType.Comment:
                    lastAction = "comment";
                    break;
                case XmlNodeType.XmlDeclaration:
                    lastAction = "xmldeclaration";
                    break;
                case XmlNodeType.Document:
                    lastAction = "document";
                    break;
                case XmlNodeType.EndElement:
                    lastAction = "endelement";
                    s.Pop();
                    break;
            }
        }

        strShippingOptions = sb.ToString();

        //lblRates.Text += "<br />len: " + lblRates.Text.Length;
        if (strShippingOptions.Length < 100)
        {
            strShippingOptions = "<input checked='true' type='radio' name = 'Rates' value =',UPS System Down - Adjust Shipping Later, $7.00,'>UPS System Is Down - your shipping amount, including any discounts, will be adjusted before your order is shipped. A $7.00 temp charge will be added. </option>";
            strShippingErrorExplanation = "<div class=\"BlogPost\">What does UPS down mean?  Sometimes when we send your zip and cart weight to UPS to get shipping quotes, an error happens.  Rather than inconvenience you and ask you to come back or try again later, we just apply a temporary charge of $7 for shipping and let you  move on to checkout.  When we determine your real shipping cost, we will adjust the shipping amount down if necessary.  It will not be higher than $7 unless we get your permission first.  Feel free to email Rob for an more detailed explanation - rob@skateparkoftampa.com.";

        }
    }
}
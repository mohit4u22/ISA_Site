using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.IO;
using System.Net.Mail;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
    public string HelloWorld()
    {

        JavaScriptSerializer js = new JavaScriptSerializer();// Use this when formatting the data as JSON
        return js.Serialize("Hello World");
        // return "Hello World";
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
    public string LoginUser(String email, String password)
    {

        String retval = "";

        try
        {

            string SQLString = "SELECT * FROM usertable WHERE email='" + email + "'";
            SqlHelper sqlh = new SqlHelper();
            try
            {
                SqlDataReader userdata = sqlh.ReturnDataReaderFromSQLText(SQLString);
                if (userdata.Read())
                {
                    if (userdata["Email"].Equals(email) && userdata["Password"].Equals(password))
                    {
                        retval = "Success";

                    }
                    else
                    {
                        retval = "You have entered Wrong Credentials. Please Try Again!";
                        //LinkButtonforgot.Visible = true;
                        //Label1.Text = "You have entered Wrong Credentials. Please Try Again!!!!";
                    }
                }
                else
                {
                    retval = "You have entered Wrong Credentials. Please Try Again!";
                }
                userdata.Close();
            }
            catch (Exception ex) { }
            finally
            {
                sqlh.Kill();
            }

        }
        catch (SqlException exception)
        {
            retval = "Some Error";
        }


        JavaScriptSerializer js = new JavaScriptSerializer();
        return js.Serialize(retval);

    }



    [WebMethod]
    [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
    public string SignUpUser(String fname, String lname, String email, String password, String phone, String country, String street, String city, String state, String zip, String securityques, String securityanswer, bool status)
    {
        //// Database code
        String retval = "";




        string SQLString = "SELECT * FROM usertable WHERE email='" + email + "'";
        SqlHelper sqlh = new SqlHelper();
        SqlDataReader cc = sqlh.ReturnDataReaderFromSQLText(SQLString);


        if (cc.HasRows)
        {
            retval = "User Email already exists";
        }

        else
        {
            cc.Close();

            string studentinfo = "insert into usertable values('"
                + fname + "', '"
                + lname + "', '"
                + email + "', '"
                + password + "', '"
                + phone + "', '"
                + country + "', '"
                + street + "', '"
                + city + "', '"
                + state + "', '"
                + zip + "', '"
                + securityques + "', '"
                + securityanswer + "')";



            sqlh.ExecuteNonQuerySQLText(studentinfo);

            sqlh.Kill();
            retval = "Success";
            if (status)
            {
                SmtpClient mailClient = new SmtpClient();
                MailMessage mail = new MailMessage("mohitjain0890@gmail.com", email);

                string body = "Congratulations, you have successfully signed up for the INDIAN STUDENTS ASSOCIATION!! <br/>Title : ";
                body += "The Description you entered is " + "<br>" +
                       "<br /> Full Name : " + fname + " " + lname +
                       "<br /> Email : " + email +
                       "<br /> Password : " + password +
                       "<br /> Security Ques : " + securityques +
                       "<br /> Security Answer : " + securityanswer +
                  "<br/><br/><br/>" + " <a href='" + ConfigurationManager.AppSettings["SiteRootUrl"] + "unsubscribe.aspx'>Click Here</a> to unsubscribe";


                string path = Server.MapPath("images/logonew.png");
                LinkedResource logo = new LinkedResource(path);
                logo.ContentId = "MyLogo";
                AlternateView altview = AlternateView.CreateAlternateViewFromString("<img src=cid:MyLogo/><br />" + body, null, "text/html");
                altview.LinkedResources.Add(logo);

                mail.AlternateViews.Add(altview);

                mail.IsBodyHtml = true;
                mail.Subject = "Welcome To ISA at ISU";
                mailClient.Send(mail);
            }

        }

        JavaScriptSerializer js = new JavaScriptSerializer();// Use this when formatting the data as JSON
        return js.Serialize(retval);



    }



    [WebMethod]
    [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
    public string DonateUser(String firstname, String lastname, String email, String phone, String comment)
    {

        String retval = "";

        string SQLString = "SELECT * FROM donatetable WHERE email='" + email + "'";
        SqlHelper sqlh = new SqlHelper();
        try
        {
            SqlDataReader userdata = sqlh.ReturnDataReaderFromSQLText(SQLString);
            string studentdonateinfo = "insert into donatetable values('"
            + firstname + "', '"
            + lastname + "', '"
            + email + "', '"
           + phone + "', '"
           + comment + "')";

            sqlh.ExecuteNonQuerySQLText(studentdonateinfo);

            sqlh.Kill();
            retval = "Success";

        }

        catch (SqlException exception)
        {
            retval = "Some Error";
        }
        JavaScriptSerializer js = new JavaScriptSerializer();// Use this when formatting the data as JSON
        return js.Serialize(retval);
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
    public String GetCountries()
    {
        var res = new WebClient().DownloadString("http://www.westclicks.com/webservices/?f=option&#8221");
        return res;
        // return Json(res, JsonRequestBehavior.AllowGet);
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
    public String GetStates(string code)
    {
        var res = new WebClient().DownloadString("http://www.westclicks.com/webservices/?f=option&c=" + code);
        return res;
        //return Json(res, JsonRequestBehavior.AllowGet);
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
    public String GetBoardMembers()
    {
        SqlHelper sqlh = new SqlHelper();
        DataSet ds = sqlh.ReturnDataSetFromSqlText("select * from BoardMembers");
        DataTable dt = new DataTable();
        if (ds != null && ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
        }
        return ConvertDataTabletoJSON(dt);
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
    public String GetEvents()
    {
        SqlHelper sqlh = new SqlHelper();
        DataSet ds = sqlh.ReturnDataSetFromSqlText("select * from Events");
        DataTable dt = new DataTable();
        String returnVal = "";
        if (ds != null && ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            List<Dictionary<string, Object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, Object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                    if (col.ColumnName.ToLower().Equals("galleryfolderpath"))
                    {
                        if (Directory.Exists(Server.MapPath(@"~\Images\Gallery\" + dr[col])))
                        {
                            row.Add("FolderImage", @"Images\Gallery\" + dr[col] + @"\" + getrandomfile(Server.MapPath(@"~\Images\Gallery\" + dr[col])));
                        }
                    }
                }
                rows.Add(row);
            }
            returnVal = serializer.Serialize(rows);
        }
        return returnVal;

    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
    public String GetGalleryFiles(String FolderName)
    {
        List<String> fls = new List<string>();
        if (Directory.Exists(Server.MapPath(@"~\Images\Gallery\" + FolderName)))
        {
            DirectoryInfo dinfo = new DirectoryInfo(Server.MapPath(@"~\Images\Gallery\" + FolderName));
            FileInfo[] finfo = dinfo.GetFiles();
            foreach (FileInfo inf in finfo)
            {
                if ((inf.Extension.ToLower() == ".jpg") ||
           (inf.Extension.ToLower() == ".gif") ||
           (inf.Extension.ToLower() == ".bmp") ||
           (inf.Extension.ToLower() == ".png"))
                {
                    fls.Add(FolderName + "\\" + inf.Name);
                }
            }
        }
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        return serializer.Serialize(fls);
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
    public void SubmitRSVP(String email, String EventID, String RSVP)
    {
        SqlHelper sqlh = new SqlHelper();
        sqlh.Parameters.AddWithValue("@EventID", EventID);
        sqlh.Parameters.AddWithValue("@Email", email);
        Boolean rs = false;
        Boolean.TryParse(RSVP, out rs);
        sqlh.Parameters.AddWithValue("@Response", rs);
        sqlh.ExecuteStoredProcedure("[dbo].[SubmitRSVP]");

    }


    private string getrandomfile(string path)
    {
        string file = null;
        if (!string.IsNullOrEmpty(path))
        {
            var extensions = new string[] { ".png", ".jpg", ".gif" };
            try
            {
                var di = new DirectoryInfo(path);
                var rgFiles = di.GetFiles("*.*").Where(f => extensions.Contains(f.Extension.ToLower()));
                Random R = new Random();
                file = rgFiles.ElementAt(R.Next(0, rgFiles.Count())).Name;
            }
            // probably should only catch specific exceptions
            // throwable by the above methods.
            catch { }
        }
        return file;
    }

    public string ConvertDataTabletoJSON(DataTable dt)
    {
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        List<Dictionary<string, Object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, Object> row;
        foreach (DataRow dr in dt.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in dt.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }
        return serializer.Serialize(rows);

    }


}


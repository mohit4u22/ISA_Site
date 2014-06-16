using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

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
      
         SqlConnection dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ToString());
        String retval="";

        try
        {

            string SQLString = "SELECT * FROM usertable WHERE email='" + email + "'";
            SqlCommand checkIDTable = new SqlCommand(SQLString, dbConnection);
            SqlDataReader userdata = checkIDTable.ExecuteReader();
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
            dbConnection.Close();
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
    public string SignUpUser(String fname, String lname, String email, String password, String phone, String country, String street, String city, String state, String zip, String securityques, String securityanswer)
    {
        //// Database code
        SqlConnection dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ToString());
        String retval="";
        try
        {
            dbConnection.Open();

        }
        catch (SqlException exception)
        {
            retval = "There is an Error with the DB, Please try Again!";
        }


                finally
                {
                    string sqlstring = "select * from usertable where email='" + email + "';";
                    SqlCommand checkidtable = new SqlCommand(sqlstring, dbConnection);
                    SqlDataReader cc = checkidtable.ExecuteReader();

         

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

                        SqlCommand sqlcommand1 = new SqlCommand(studentinfo, dbConnection);
                        sqlcommand1.ExecuteNonQuery();
                        sqlcommand1.Dispose();

                        dbConnection.Close();
                        retval="Success";

                        //smtpclient mailclient = new smtpclient();
                        //mailmessage mail = new mailmessage("mohit4u22@gmail.com", textbox6.text);

                        //string body = "congratulations, you have successfully signed up!! <br>" + "welcome " + textbox2.text + ", " + textbox1.text +
                        //    "!!!!!<br /> with username : <b>" + textbox3.text + "</b><br /> and password :<b> " + textbox4.text +
                        //    "</b><br /> confirm password : " + textbox5.text +
                        //    "<br /> emailid : " + textbox6.text +
                        //    "<br /> security question : " + textbox7.text +
                        //    "<br /> security answer : " + textbox8.text +
                        //    "<br /> categories of interest : " + cat +
                        //    "<br /> cost: min : " + textbox9.text + " and max :" + textbox10.text +
                        //    "<br /> size: min : " + textbox11.text + " and max :" + textbox12.text + "<br/>";

                        //string path = server.mappath("images/isulogo.jpg");
                        //linkedresource logo = new linkedresource(path);
                        //logo.contentid = "mylogo";
                        //alternateview altview = alternateview.createalternateviewfromstring("<img src=cid:mylogo/><br />" + body, null, "text/html");
                        //altview.linkedresources.add(logo);

                        //mail.alternateviews.add(altview);

                        //mail.subject = "registration confirmation";
                        //mailclient.send(mail);
                        //response.redirect("registered.aspx");
                    }
                

      
                }

          JavaScriptSerializer js = new JavaScriptSerializer();// Use this when formatting the data as JSON
        return js.Serialize(retval);

            }
    

    }


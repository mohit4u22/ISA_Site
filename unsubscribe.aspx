<%@ Page Language="C#" AutoEventWireup="true" CodeFile="unsubscribe.aspx.cs" Inherits="unsubscribe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="js/myscripts.js"> </script>
    <script type="text/javascript">
        unsubscribe();
        function unsubscribe() {

            var email = ReadQueryString("email");
            // Make web service call to unsubcribe

            window.location.href = "Default.aspx?type=unsubscribe";
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           
    
        </div>
    </form>
</body>
</html>

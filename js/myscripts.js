
var SignupForm;
$(document).ready(function () {

    SignupForm = $("#frmRegister").validate({
        rules: {
            // txtregisterFName: "required",
            //txtregisterLName: "required"
            txtregisterFName: {
                required: true,
                minlength: 2
            }
            //password: {
            //    required: true,
            //    minlength: 5
            //},
            //confirm_password: {
            //    required: true,
            //    minlength: 5,
            //    equalTo: "#password"
            //},
            //email: {
            //    required: true,
            //    email: true
            //},
            //topic: {
            //    required: "#newsletter:checked",
            //    minlength: 2
            //},
            //agree: "required"
        },
        messages: {
            //txtregisterFName: "Please enter your firstname",
            // txtregisterLName: "Please enter your lastname"
            txtregisterFName: {
                required: "Please enter a username",
                minlength: "Your username must consist of at least 2 characters"
            }
            //password: {
            //    required: "Please provide a password",
            //    minlength: "Your password must be at least 5 characters long"
            //},
            //confirm_password: {
            //    required: "Please provide a password",
            //    minlength: "Your password must be at least 5 characters long",
            //    equalTo: "Please enter the same password as above"
            //},
            //email: "Please enter a valid email address",
            //agree: "Please accept our policy"
        }
    });

});



function LoginUser() {

    var val = LoginForm.valid();
    var email = $('#txtloginEmail').val()
    var password = $('#txtloginPassword').val()

    $.ajax({
        type: "Post",
        url: "../WebService.asmx/LoginUser",
        data: "{'email': '" + email + "', 'password': '" + password + "'}",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (result) {
            if (result.d == "Success") {
                alert("User Logged in Successfully");
            }
            else {
                alert("We're sorry but we are not able to authorize user as this time. <br>" + result.d);
            }

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(jqXHR.responseText);
        }
    });
}

function RegisterUser() {


   var val =  SignupForm.valid();
    return;
    alert(isValid);
    var firstname = $('#txtregisterFName').val();
    var lastname = $('#txtregisterFName').val();
    var email = $('#txtregisterFName').val();
    var confirmemail = $('#txtregisterFName').val();
    var password = $('#txtregisterFName').val();
    var confirmpassword = $('#txtregisterFName').val();
    var phone = $('#txtregisterFName').val();
    var country = $('#txtregisterFName').val();
    var street = $('#txtregisterFName').val();
    var city = $('#txtregisterFName').val();
    var state = $('#txtregisterFName').val();
    var zip = $('#txtregisterFName').val();
    var securityques = $('#txtregisterFName').val();
    var securityanswer = $('#txtregisterFName').val();

    $.ajax({
        type: "Post",
        url: "../WebService.asmx/SignUpUser",
        data: "{'fname': '" + firstname +
            "', 'lname': '" + lastname +
            "', 'email': '" + email +
            "', 'cemail': '" + confirmemail +
            "', 'password': '" + password +
            "', 'cpassword': '" + confirmpassword +
              "', 'phone': '" + phone +
             "', 'country': '" + country +
            "', 'street': '" + street +
            "', 'city': '" + city +
            "', 'state': '" + state +
            "', 'zip': '" + zip +
            "', 'securityques': '" + securityques +
            "', 'securityanswer': '" + securityanswer +
            "'}",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (result) {
            if (result.d == "Success") {
                alert("User Created Successfully");
            }
            else {
                alert("We're sorry but we are not able to create the user as this time. <br>" + result.d);
            }

        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("WE're unable to create the user as this time.");
        }
    });
}

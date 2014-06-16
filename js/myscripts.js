var SignupValidator;
var LoginValidator;
$(document).ready(function () {
    $('.JQValidateErrors').hide();
    BindRegisterUserValidation();
});



function LoginUser() {
    LoginForm.validate();
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
    if (!SignupValidator.validate()) {
        $('.JQValidateErrors').show();
        return false;
    }
    else {
        $('.JQValidateErrors').hide();
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
                alert("We're unable to create the user as this time.");
            }
        });
    }
}

function BindRegisterUserValidation() {
    var rules = {
        txtregisterFName: {
            required: true
        },
        txtregisterLName: {
            required: true
        },
        txtregisterEmail: {
            required: true,
            email: true
        }
    };
    var messages = {
        txtregisterFName: {
            required: "Please enter First Name"
        },
        txtregisterLName: {
            required: "Please enter Last Name"
        },
        txtregisterEmail: {
            required: "Please enter email.",
            email: "Please Enter a Valid Email"
        }
    };

    SignupValidator = new jQueryValidatorWrapper('frmRegister', rules, messages);


}

function jQueryValidatorWrapper(formId, rules, messages) {
    var showErrorMessage = false;

    var validator = $("#" + formId).validate();

    var settings = validator.settings;
    $.extend(settings, {
        onchange: true,
        rules: rules,
        messages: messages,
        highlight: function (element) {
            $(element).parent().addClass('has-error');
        },
        unhighlight: function (element) {
            $(element).parent().removeClass('has-error');
             
            $('#liJqValidate_' + $(element).attr('id') + '').remove();
            if ($('ul.JQValidateErrors li').length == 0)
            {
                $('.JQValidateErrors').hide();
            }
        }
        , errorPlacement: function (error, element) {
            if (showErrorMessage) {
                var li = document.createElement("li")
                li.appendChild(document
                  .createTextNode(error.html()));
                $(li).attr('id', 'liJqValidate_' + $(element).attr('id'))
                $('.JQValidateErrors').append(li);
            }
        },
        showErrors: function (errorMap, errorList) {
            this.defaultShowErrors();
            if ((errorList.length != 0) && showErrorMessage) {
                //$dialog.dialog('open');
            }
        }
    });
    // This is the function to call whem make the validation
    this.validate = function () {
        $("ul.JQValidateErrors").empty();
        showErrorMessage = true;
        var result = validator.form();
        showErrorMessage = false;

        return result;
    };
}
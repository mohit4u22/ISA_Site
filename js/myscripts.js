var SignupValidator;
var LoginValidator;
$(document).ready(function () {
    $('.JQValidateErrors').hide();
    BindCountriesStates();
    BindRegisterUserValidation();
    BindLoginValidation();
    PopulateBoardMembers();

});



function LoginUser() {
    if (!LoginValidator.validate()) {
        $('.JQValidateErrors').show();
        return false;
    }
    else {
        $('.JQValidateErrors').hide();
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
}

function RegisterUser() {
    if (!SignupValidator.validate()) {
        $('.JQValidateErrors').show();
        return false;
    }
    else {
        $('.JQValidateErrors').hide();
        var firstname = $('#txtregisterFName').val();
        var lastname = $('#txtregisterLName').val();
        var email = $('#txtregisterEmail').val();
        var confirmemail = $('#txtregisterCEmail').val();
        var password = $('#txtregisterPassword').val();
        var confirmpassword = $('#txtregisterCPassword').val();
        var phone = $('#txtregisterPhone').val();
        var country = $('#txtregisterCountry').val();
        var street = $('#txtregisterStreet').val();
        var city = $('#txtregisterCity').val();
        var state = $('#txtregisterState').val();
        var zip = $('#txtregisterZip').val();
        var securityques = $('#txtregisterSquestion').val();
        var securityanswer = $('#txtregisterSanswer').val();

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
        },
        txtregisterCEmail: {
            equalTo: '#txtregisterEmail'
        },
        txtregisterPassword: {
            required: true,
            pwcheck: true,
            minlength: 8
        },
        txtregisterCPassword: {
            equalTo: '#txtregisterPassword'
        },
        txtregisterCountry: {
            required: true
        },
        txtregisterCity: {
            required: true
        },
        txtregisterSquestion: {
            required: true
        },
        txtregisterSanswer: {
            required: true
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
        },
        txtregisterCEmail: {
            equalTo: "Emails do not match"
        },
        txtregisterPassword: {
            required: "Please enter Password",
            pwcheck: "Please enter valid password",
            minlength: "Please enter valid password"
        },
        txtregisterCPassword: {
            equalTo: "Passwords do not match"
        },
        txtregisterCountry: {
            required: "Please enter your Country"
        },
        txtregisterCity: {
            required: "Please enter your City"
        },
        txtregisterSquestion: {
            required: "Please enter your Security Question"
        },
        txtregisterSanswer: {
            required: "Please enter your Security Answer"
        }
    };


    SignupValidator = new jQueryValidatorWrapper('frmRegister', rules, messages);


}


function BindLoginValidation() {
    var rules = {
        txtloginEmail: {
            required: true
        },
        txtloginPassword: {
            required: true
        }
    };
    var messages = {
        txtloginEmail: {
            required: "Please enter Email"
        },
        txtloginPassword: {
            required: "Please enter Password"
        }
    };

    LoginValidator = new jQueryValidatorWrapper('frmLogin', rules, messages);


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
            if ($('ul.JQValidateErrors li').length == 0) {
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


function BindCountriesStates() {
    $.ajax({
        type: "Get",
        url: "../WebService.asmx/GetCountries",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (result) {
            if (result.d.length > 0) {
                var decoded = $('<div/>').html(result.d).text();
                $('#ddlCountry').append("<option value=''></option>");
                $('#ddlCountry').append(decoded);


            }






        },
        error: function (jqXHR, textStatus, errorThrown) {
            // alert(jqXHR.responseText);
        }
    });

    $('#ddlCountry').change(function () {
        var dStates = "";
        var code = $('#ddlCountry').val();
        $.ajax({
            type: "Post",
            url: "../WebService.asmx/GetStates",
            data: "{'code': '" + code + "'}",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.d.length > 0) {
                    dStates = $('<div/>').html(result.d).text();
                    $('#ddlState').html('');
                    $('#ddlState').append(dStates);
                }


            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });

    });


}

function PopulateBoardMembers() {
    $.ajax({
        type: "Get",
        url: "../WebService.asmx/GetBoardMembers",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (result) {
            var obj = JSON.parse(result.d);
            var divtext = '';
            $.each(obj, function (i, item) {
                divtext += "<div class='label_1_of_4 about_1_of_4'> <img src='" + item.PhotoPath + "' alt='" + item.Name + "' /><h3>" + item.Name + "</h3><span>" + item.Position + "</span><p>" + item.Description + "</p></div>";
            });
            $('#divBoardMembersWrapper').append(divtext);
        },
        error: function (jqXHR, textStatus, errorThrown) {
           // alert(jqXHR.responseText);
        }
    });

}
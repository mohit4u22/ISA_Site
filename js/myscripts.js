var SignupValidator;
var LoginValidator;
var DonateValidator;
var PickupValidator;
$(document).ready(function () {
    PopulateGalleryFolders();
    $('.JQValidateErrors').hide();
    BindCountriesStates();
    BindRegisterUserValidation();
    BindLoginValidation();
    PopulateBoardMembers();
    BindDonateValidation();
    BindPickupValidation();
});

// Normal Functions from here

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

function DonateUser() {
    if (!DonateValidator.validate()) {
        $('.JQValidateErrors').show();
        return false;
    }
    else {
        $('.JQValidateErrors').hide();
        var firstname = $('#txtdonateFName').val();
        var lastname = $('#txtdonateLName').val();
        var email = $('#txtdonateEmail').val();
        var phone = $('#txtdonatePhone').val();
        var comment = $('#txtdonateComment').val();


        $.ajax({
            type: "Post",
            url: "../WebService.asmx/DonateUser",
            data: "{'fname': '" + firstname +
                "', 'lname': '" + lastname +
                "', 'email': '" + email +
                  "', 'phone': '" + phone +
                 "', 'comment': '" + comment +

                "'}",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.d == "Success") {
                    alert(" Successful");
                }
                else {
                    alert("We're sorry but we are not able to send this message at this time. <br>" + result.d);
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("We're not able to send this message at this time.");
            }
        });
    }
}

function PickupUser() {
    if (!PickupValidator.validate()) {
        $('.JQValidateErrors').show();
        return false;
    }
    else {
        $('.JQValidateErrors').hide();
        var firstname = $('#txtpickupFName').val();
        var lastname = $('#txtpickupLName').val();
        var email = $('#txtpickupEmail').val();
        var phone = $('#txtpickupPhone').val();
        var flight = $('#txtpickupFlight').val();
        var arrivaldate = $('#txtpickupArrivalDate').val();
        var time = $('#txtpickupTime').val();
        var airport = $('#txtpickupAirport').val();
        var venue = $('#txtpickupVenue').val();
        var comment = $('#txtpickupComment').val();

        $.ajax({
            type: "Post",
            url: "../WebService.asmx/SignUpUser",
            data: "{'firstname': '" + firstname +
                "', 'lastname': '" + lastname +
                "', 'email': '" + email +
                "', 'phone': '" + phone +
                "', 'flight': '" + flight +
                "', 'arrivaldate': '" + arrivaldate +
                  "', 'time': '" + time +
                 "', 'airport': '" + airport +
                "', 'venue': '" + venue +
                "', 'comment': '" + comment +
                "'}",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (result.d == "Success") {
                    alert("Message sent Successfully");
                }
                else {
                    alert("We're sorry but we are not able to send this information at this time. <br>" + result.d);
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("We're sorry but we are not able to send this information at this time.");
            }
        });
    }
}

//Bind Functions from here

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

function BindDonateValidation() {
    var rules = {

        txtdonateFName: {
            required: true
        },
        txtdonateLName: {
            required: true
        },
        txtdonateEmail: {
            required: true,
            email: true
        },
        txtdonatePhone: {
            required: true,
            minlength: 10,
            phoneUS: true
        }
    };
    var messages = {
        txtdonateFName: {
            required: "Please enter First Name"
        },
        txtdonateLName: {
            required: "Please enter Last Name"
        },
        txtdonateEmail: {
            required: "Please enter email.",
            email: "Please Enter a Valid Email"
        },
        txtdonatePhone: {
            required: "Please enter Phone Number",
            minlength: "Please enter valid Phone Number",
            phoneUS: "Please enter valid Phone Number"
        }
    };

    DonateValidator = new jQueryValidatorWrapper('frmDonate', rules, messages);


}

function BindPickupValidation() {
    var rules = {
        txtpickupFName: {
            required: true
        },
        txtpickupLName: {
            required: true
        },
        txtpickupEmail: {
            required: true,
            email: true
        },
        txtpickupPhone: {
            required: true,
            minlength: 10,
            phoneUS: true
        },
        txtpickupVenue: {
            required: true
        },
        txtpickupArrivalDate: {
            required: true
        },
        txtpickupTime: {
            required: true
        }
    };

    var messages = {
        txtpickupFName: {
            required: "Please enter First Name"
        },
        txtpickupLName: {
            required: "Please enter Last Name"
        },
        txtpickupEmail: {
            required: "Please enter email.",
            email: "Please Enter a Valid Email"
        },
        txtpickupPhone: {
            required: "Please enter Phone Number",
            minlength: "Please enter valid Phone Number",
            phoneUS: "Please enter valid Phone Number"
        },
        txtpickupVenue: {
            equalTo: "Passwords do not match"
        },
        txtpickupArrivalDate: {
            required: "Please enter your Country"
        },
        txtpickupTime: {
            required: "Please enter your City"
        }
    };


    PickupValidator = new jQueryValidatorWrapper('frmPickup', rules, messages);


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

function PopulateGalleryFolders() {

    $.ajax({
        type: "Get",
        url: "../WebService.asmx/GetGalleryFolders",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (result) {
            var obj = JSON.parse(result.d);
            var fdr = '';

            var transX = 0, transY = 0, index = 0;
            $.each(obj, function (i, item) {

                fdr += '<li class="element photo isotope-item" style="position: absolute; left: 0px; top: 0px; -webkit-transform: translate3d(' + transX + 'px, ' + transY + 'px, 0px);">';
                fdr += '<a href="javascript:void(0);" onclick="openGallery(\'' + item.GalleryFolderPath + '\');" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">';
                fdr += '<img src="' + item.FolderImage + '" alt="' + item.GalleryFolderName + '" width="200" height="200"  />';
                fdr += '<h3>' + item.GalleryFolderName + '</h3></a>';
                fdr += '</li>'
                // fdr += '<div class="meta-box clearfix">';
                //fdr += ' <span class="entry-categories"><a href="#">print art</a></span>';
                //fdr += '  &nbsp;/&nbsp;';
                //fdr += '<span class="entry-categories"><a href="#">' + item.GalleryFolderName + '</a></span>'
                //fdr += '</div><footer><div id="nivo-lightbox-demo">';
                //fdr += '<p><a href="javascript:void(0);" onclick="openGallery();" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">View</a> </p>'
                //fdr += '</div></footer></figcaption></li>';
                index++;
                if (index % 5 == 0) {
                    transY = transY + 267;
                }
                transX = transX + 295;
                if (transX > 1190)
                    transX = 0;
            });
            fdr += ' <div class="clear"> </div>';
            $('#divGalleryFolders ul').html(fdr);//.css({height: 575 + 'px', width:  1475 +'px'});;
           
        },
        error: function (jqXHR, textStatus, errorThrown) {
            // alert(jqXHR.responseText);
        }
    });

}

function ResetForm(FormID)
{

    $('#' + FormID + ' input').val('');



    $('#' + FormID).find('input[type=text],textarea,input,select').filter(':visible:first').focus();

}
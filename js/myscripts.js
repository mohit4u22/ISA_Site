﻿var SignupValidator;
var LoginValidator;
var DonateValidator;
var PickupValidator;
var AccomodationValidator;
$(document).ready(function () {
    $('.JQValidateErrors').hide();
    BindCountriesStates();
    BindRegisterUserValidation();
    BindLoginValidation();
    PopulateBoardMembers();
    BindDonateValidation();
    BindPickupValidation();
    BindAccomodationValidation();
    var cname = $.MyCookie.readCookie('Isa_Site_Login');
    if (cname != null) {
        $('#liTopLogin').hide();
        $('#litopRegister').hide();
        $('#liTopLogout').show();
        $('#LoggedinUserName').html('You are Logged in as: <b>' + cname + '</b>');
    }
    else {
        $('#liTopLogin').show();
        $('#litopRegister').show();
        $('#liTopLogout').hide();
        $('#LoggedinUserName').html('');
    }

    $('#liTopLogout a').click(function () {
        $('#LoggedinUserName').html('');
        $('#liTopLogin').show();
        $('#litopRegister').show();
        $('#liTopLogout').hide();
        $.MyCookie.eraseCookie('Isa_Site_Login');
        alert('You are successfully logged out!!!');

    });
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
                var res = JSON.parse(result.d);
                if (res.toString().toLowerCase() == "success") {

                    $.MyCookie.createCookie('Isa_Site_Login', email, 1);
                    $('#small-dialog-login button.mfp-close').click();
                    $('#liTopLogin').hide();
                    $('#litopRegister').hide();
                    $('#liTopLogout').show();
                    $('#LoggedinUserName').html('You are Logged in as: <b>' + email + '</b>');
                    if (ReopenForEventID != undefined && ReopenForEventID != null) {
                        ReopenForEventID = null;
                        OpenGalleryDetail(ReopenForEventID);
                        return false;
                    }
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
        var status = $('#chkregistersendemail').is(':checked');

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
                "', 'status': '" + status +
                "'}",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                var res = JSON.parse(result.d);
                if (res.toLowerCase() === "success") {
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
                var res = JSON.parse(result.d);
                if (res.toLowerCase() === "success") {
                    $('#small-dialog-donate button.mfp-close').click();
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
            url: "../WebService.asmx/PickupUser",
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
                var res = JSON.parse(result.d);
                if (res.toLowerCase() === "success") {
                    $('#small-dialog-pickup button.mfp-close').click();
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

function AccomodationUser() {
    if (!AccomodationValidator.validate()) {
        $('.JQValidateErrors').show();
        return false;
    }
    else {
        $('.JQValidateErrors').hide();
        var firstname = $('#txtaccomodationFName').val();
        var lastname = $('#txtaccomodationLName').val();
        var email = $('#txtaccomodationEmail').val();
        var phone = $('#txtaccomodationPhone').val();
        var arrivaldate = $('#txtaccomodationArrivalDate').val();
        var time = $('#txtaccomodationTime').val();
        var comment = $('#txtaccomodationComment').val();

        $.ajax({
            type: "Post",
            url: "../WebService.asmx/AccomodationUser",
            data: "{'firstname': '" + firstname +
                "', 'lastname': '" + lastname +
                "', 'email': '" + email +
                "', 'phone': '" + phone +
                "', 'arrivaldate': '" + arrivaldate +
                  "', 'time': '" + time +
                "', 'comment': '" + comment +
                "'}",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                var res = JSON.parse(result.d);
                if (res.toLowerCase() === "success") {
                    $('#small-dialog-accomodation button.mfp-close').click();
                    alert("Request sent Successfully");
                }
                else {
                    alert("We're sorry but we are not able to send this requesr at this time. <br>" + result.d);
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("We're sorry but we are not able to send this request at this time.");
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
            minlength: 10

        },
        txtpickupArrivalDate: {
            required: true
        },
        txtpickupTime: {
            required: true
        },
        txtpickupVenue: {
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
            minlength: "Please enter valid Phone Number"

        },
        txtpickupArrivalDate: {
            required: "Please enter your Date"
        },
        txtpickupTime: {
            required: "Please enter your time"
        },
        txtpickupVenue: {
            required: "Please enter your Venue"
        }
    };


    PickupValidator = new jQueryValidatorWrapper('frmPickup', rules, messages);


}

function BindAccomodationValidation() {
    var rules = {
        txtaccomodationFName: {
            required: true
        },
        txtaccomodationLName: {
            required: true
        },
        txtaccomodationEmail: {
            required: true,
            email: true
        },
        txtaccomodationPhone: {
            required: true,
            minlength: 10
        },
        txtaccomodationArrivalDate: {
            required: true
        },
        txtaccomodationTime: {
            required: true
        }
    };

    var messages = {
        txtaccomodationFName: {
            required: "Please enter First Name"
        },
        txtaccomodationLName: {
            required: "Please enter Last Name"
        },
        txtaccomodationEmail: {
            required: "Please enter email.",
            email: "Please Enter a Valid Email"
        },
        txtaccomodationPhone: {
            required: "Please enter Phone Number",
            minlength: "Please enter valid Phone Number"
        },
        txtaccomodationArrivalDate: {
            required: "Please enter your Date"
        },
        txtaccomodationTime: {
            required: "Please enter your Time"
        }
    };


    AccomodationValidator = new jQueryValidatorWrapper('frmAccomodation', rules, messages);


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



// Other Functions
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


function ResetForm(FormID) {

    $('#' + FormID + ' input').val('');



    $('#' + FormID).find('input[type=text],textarea,input,select').filter(':visible:first').focus();

}


(function ($) {
    $.fn.capslide = function (options) {
        var opts = $.extend({}, $.fn.capslide.defaults, options);
        return this.each(function () {
            $this = $(this);
            var o = $.meta ? $.extend({}, opts, $this.data()) : opts;

            if (!o.showcaption) $this.find('.ic_caption').css('display', 'none');
            else $this.find('.ic_text').css('display', 'none');

            var _img = $this.find('img:first');
            var w = _img.css('width');
            var h = _img.css('height');
            $('.ic_caption', $this).css({ 'color': o.caption_color, 'background-color': o.caption_bgcolor, 'bottom': '-10px', 'width': w });
            $('.overlay', $this).css('background-color', o.overlay_bgcolor);
            $this.css({ 'width': w, 'height': h, 'border': o.border });
            $this.hover(
				function () {
				    if ((navigator.appVersion).indexOf('MSIE 7.0') > 0)
				        $('.overlay', $(this)).show();
				    else
				        $('.overlay', $(this)).fadeIn();
				    if (!o.showcaption)
				        $(this).find('.ic_caption').slideDown(500);
				    else
				        $('.ic_text', $(this)).slideDown(500);
				},
				function () {
				    if ((navigator.appVersion).indexOf('MSIE 7.0') > 0)
				        $('.overlay', $(this)).hide();
				    else
				        $('.overlay', $(this)).fadeOut();
				    if (!o.showcaption)
				        $(this).find('.ic_caption').slideUp(200);
				    else
				        $('.ic_text', $(this)).slideUp(200);
				}
			);
        });
    };
    $.fn.capslide.defaults = {
        caption_color: 'white',
        caption_bgcolor: 'black',
        overlay_bgcolor: 'blue',
        border: '1px solid #fff',
        showcaption: true
    };
})(jQuery);


; (function ($) {

    $.MyCookie = $.fn.MyCookie = function () { }

    $.fn.MyCookie.createCookie = function (name, value, hrs) {
        var expires;

        if (hrs) {
            var date = new Date();
            date.setTime(date.getTime() + (hrs * 60 * 60 * 1000));
            expires = "; expires=" + date.toGMTString();
        } else {
            expires = "";
        }
        document.cookie = escape(name) + "=" + escape(value) + expires + "; path=/";
    };

    $.fn.MyCookie.readCookie = function (name) {
        var nameEQ = escape(name) + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) === ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) === 0) return unescape(c.substring(nameEQ.length, c.length));
        }
        return null;
    }

    $.fn.MyCookie.eraseCookie = function (name) {

        document.cookie = name + '=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
    }
})(jQuery);




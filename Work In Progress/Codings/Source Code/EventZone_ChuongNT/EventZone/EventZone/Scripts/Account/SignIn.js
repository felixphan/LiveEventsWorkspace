﻿$("#SignInForm").submit(function(event) {
    //@*Validate form.*@
    var isValidForm = $("#SignInForm").validate().form();
    //@*Form is invalid.*@
    if (!isValidForm) {

        //@*Prevent this form from being submitted*@
        event.preventDefault();
        $("#signin-Password").val("");
        return false;
    }
    $("#signin-Password").val($.md5($("#signin-Password").val()));
    return true;
});

function OnSignInRequestSucceeded(data) {
    if (data.state === 1) {
        $("#myModal2").modal("toggle");
        $(".modal-backdrop").remove();
        //A space before #SignUl means that they don't add other div again
        $("#SignUl").load(location.href + " #SignUl");
    } else {
        $("#alertPanelSignIn").empty();
        $("#alertPanelSignIn").append("<p>Invalid username or password</p>");
        $("#alertPanelSignIn").show();
    }
    console.log("This event is fired when a request has been sent to server successfully");
    console.log(data);
}

$("#i_quen_mk").click(function() {
    $("#myModal2").modal("toggle");
    $("#ForgotPasswordInfo").empty();
});
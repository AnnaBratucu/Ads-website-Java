/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () { //wait until all the document loads
    $("#username").keyup(function () { //when element with uname id changes
        $("#uname_error").html(""); //change innerHTML of the span to loading
        $("#uname_error").show();
        var username = $("#username").val();
        $.ajax({
            type: "get", //http method
            url: "ValidController", //servlet url
            data: "username=" + username, //parameter for servlet
            success: function (data) {
                if (data == "0") {
                    $("#uname_error").html("");
                    document.getElementById("myBtn").disabled = false;
                } else {
                    $("#uname_error").html("This username already exists");
                    document.getElementById("myBtn").disabled = true;
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {}
        });
    });
});

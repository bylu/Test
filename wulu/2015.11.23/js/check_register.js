
function UpdateImage() {
    document.getElementById("picVerifyCode").src = "ValidateImage.aspx?r=" + Math.random();
}

function hintMessage(hintObj, error, message) {
    //删除样式
    if (error == "error") {
        $("#" + hintObj + "_succeed").html("");
        $("#" + hintObj + "_succeed").css("display", "none");
        $("#" + hintObj + "").removeClass("onCorrect");
        $("#" + hintObj + "").removeClass("onFocus");
        $("#" + hintObj + "").addClass("onError");
        $("#" + hintObj + "").html(message);
    } else if (error == "right") {
        $("#" + hintObj + "_succeed").html("");
        $("#" + hintObj + "").removeClass("onError");
        $("#" + hintObj + "").removeClass("onFocus");
        $("#" + hintObj + "").addClass("onCorrect");
        $("#" + hintObj + "_succeed").css("display", "none");
        $("#" + hintObj + "").html(message);
    } else if (error == "info") {
        $("#" + hintObj + "").removeClass("onError");
        $("#" + hintObj + "").addClass("onFocus");
        $("#" + hintObj + "").removeClass("onCorrect");
    }

}

function checkAccounts() {
    if ($.trim($("#txtAccounts").val()) == "") {
        hintMessage("txtAccountsTip", "error", "请输入您的用户名");
        return false;
    }
    var reg = /^[A-Za-z0-9]+$/;
    if (!reg.test($("#txtAccounts").val())) {
        hintMessage("txtAccountsTip", "error", "用户名只能是英文和或数字的组合！");
        return false;
    }

    var length = $.trim($("#txtAccounts").val()).replace(/[^\x00-\xff]/g, "xx").length;
    if (length < 6 || length > 16) {

        hintMessage("txtAccountsTip", "error", "用户名的长度为6-16个字符");
        return false;
    }
    hintMessage("txtAccountsTip", "right", "");
    return true;
}

function checkNickName() {
    if ($.trim($("#txtNickname").val()) == "") {
        hintMessage("txtNicknameTip", "error", "请输入您的昵称");
        return false;
    }
    var reg = /^[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
    if (!reg.test($("#txtNickname").val())) {
        hintMessage("txtNicknameTip", "error", "由字母、数字、下划线和汉字的组合！");
        return false;
    }

    var length = $.trim($("#txtNickname").val()).replace(/[^\x00-\xff]/g, "xx").length;
    if (length < 6 || length > 16) {
        hintMessage("txtNicknameTip", "error", "昵称的长度为6-16个字符");
        return false;
    }
    if ($("#txtNickname").val().length > 31) {
        hintMessage("txtNicknameTip", "error", "昵称的长度不能超过31个字符");
        return false;
    }
    hintMessage("txtNicknameTip", "right", "");
    return true;
}

var isExitsUserName = true;
function checkUserName() {
    $.ajax({
        async: false,
        contentType: "application/json",
        url: "/WS/WSAccounts.asmx/CheckName",
        data: "{userName:'" + $("#txtAccounts").val() + "'}",
        type: "POST",
        dataType: "json",
        success: function (json) {
            json = eval("(" + json.d + ")");
            if (json.success == "error") {
                hintMessage("txtAccountsTip", "error", json.msg);
                isExitsUserName = true;
                return;
            } else if (json.success == "success") {
                hintMessage("txtAccountsTip", "right", "该用户名可以使用");
                isExitsUserName = false;
                return;
            }
        },
        error: function (err, ex) {
            //alert(err.responseText);
        }
    });
}
var isExitsNickName = true;
function checkNickNameExit() {
    $.ajax({
        async: false,
        contentType: "application/json",
        url: "/WS/WSAccounts.asmx/CheckNickName",
        data: "{nickName:'" + $("#txtNickname").val() + "'}",
        type: "POST",
        dataType: "json",
        success: function (json) {

            json = eval("(" + json.d + ")");
            if (json.success == "error") {
                hintMessage("txtNicknameTip", "error", json.msg);
                isExitsNickName = true;
                return;
            } else if (json.success == "success") {
                hintMessage("txtNicknameTip", "right", "该昵称可以使用");
                isExitsNickName = false;
                return;
            }
        },
        error: function (err, ex) {
            //alert(err.responseText);
        }
    });
}

function checkLoginPass() {
    if ($("#txtLogonPass").val() == "") {
        hintMessage("txtLogonPassTip", "error", "请输入您的登录密码");
        return false;
    }
    if ($("#txtLogonPass").val().length < 6 || $("#txtLogonPass").val().length > 32) {
        hintMessage("txtLogonPassTip", "error", "登录密码长度为6到32个字符");
        return false;
    }
    hintMessage("txtLogonPassTip", "right", "");
    return true;
}

function checkLoginConPass() {
    if ($("#txtLogonPass2").val() == "") {
        hintMessage("txtLogonPass2Tip", "error", "请输入登录确认密码");
        return false;
    }
    if ($("#txtLogonPass2").val() != $("#txtLogonPass").val()) {
        hintMessage("txtLogonPass2Tip", "error", "登录确认密码与原密码不同，请重新输入");
        return false;
    }
    hintMessage("txtLogonPass2Tip", "right", "");
    return true;
}

function checkInsurePass() {
    if ($("#txtInsurePass1").val() == "") {
        hintMessage("txtInsurePass1Tip", "error", "请输入您的保险柜密码");
        return false;
    }
    if ($("#txtInsurePass1").val().length < 6 || $("#txtInsurePass1").val().length > 32) {
        hintMessage("txtInsurePass1Tip", "error", "保险柜密码长度为6到32个字符");
        return false;
    }
    hintMessage("txtInsurePass1Tip", "right", "");
    return true;
}
function checkInsureConPass() {
    if ($("#txtInsurePass2").val() == "") {
        hintMessage("txtInsurePass2Tip", "error", "请输入您的保险柜确认密码");
        return false;
    }
    if ($("#txtInsurePass2").val() != $("#txtInsurePass1").val()) {
        hintMessage("txtInsurePass2Tip", "error", "登录确认密码与原密码不同，请重新输入");
        return false;
    }
    hintMessage("txtInsurePass2Tip", "right", "");
    return true;
}

function checkCompellation() {

    if ($("#txtCompellation").val() == "") {
        hintMessage("txtCompellationTip", "error", "请输入你的真实姓名");
        return false;
    }
    if ($.trim($("#txtCompellation").val()) != "") {
        var realname = $("#txtCompellation").val();
        var reg = /^[A-Z u4E00-u9FA5]+$/;
        if (reg.test(realname)) {
            hintMessage("txtCompellationTip", "error", "真实姓名输入有误");
            return false;
        }
    }
    hintMessage("txtCompellationTip", "right", "");
    return true;
}

function checkPhone() {
    if ($.trim($("#txtMobile").val()) != "") {
        var ok = ($("#txtMobile").val()).match(/^0?(13|15|18)[0-9]{9}$/);
        if (ok == null) {
            hintMessage("txtMobileTip", "error", "您的手机号码输入错误，请重新输入");
            return false;
        }
    }
    hintMessage("txtMobileTip", "right", "");
    return true;
}
function checkCard() {

    if ($("#txtPassPortID").val() == "") {
        hintMessage("txtPassPortIDTip", "error", "请输入你的身份证号码");
        return false;
    }
    if ($.trim($("#txtPassPortID").val()) != "") {
        var ok = ($("#txtPassPortID").val()).match(/^[1-9]([0-9]{13}[0-9a-z]|[0-9]{16}[0-9a-z])$/);
        if (ok == null) {
            hintMessage("txtPassPortIDTip", "error", "您的身份证号错误，请重新输入");
            return false;
        }
    }
    hintMessage("txtPassPortIDTip", "right", "");
    return true;
}
function checkVerifyCode() {
    if ($("#txtCode").val() == "") {
        hintMessage("txtCodeTip", "error", "请输入验证码");
        return false;
    }
    hintMessage("txtCodeTip", "right", "");
    return true;
}
function checkSpreader() {
    if ($("#txtSpreader").val() != "") {
        if ($("#txtSpreader").val().length > 31) {
            hintMessage("txtSpreaderTip", "error", "推荐人账号长度不能大于31个字符");
            return false;
        }
    }
    hintMessage("txtSpreaderTip", "right", "");
    return true;
}
function byteLength(str) {
    var length = 0;
    var charArray = str.split("");

    for (i = 0; i < charArray.length; i++) {
        if (charArray[i].charCodeAt(0) < 299)
            length++;
        else
            length += 2;
    }

    return length;
}

function checkService() {

    if (!$("#chkAgree").attr("checked")) {

        hintMessage("chkAgreeTip", "error", "请选中已阅读并同意服务条款");
        return false;
    }
    hintMessage("chkAgreeTip", "right", "");
    return true;
}

function checkInput() {

    if (!checkAccounts()) {
        $("#txtAccounts").focus(); return false;
    } else {
        if (isExitsUserName) {
            $("#txtAccounts").focus();
            hintMessage("txtAccountsTip", "error", "很遗憾，该用户名已经被注册");
            return false;
        }
    }

    if (!checkNickName()) {
        $("#txtNickname").focus();
        return false;
    } else {
        if (isExitsNickName) {
            $("#txtNickname").focus();
            hintMessage("txtNicknameTip", "error", "很遗憾，该昵称已经被注册");
            return false;
        }
    }
    if (!checkLoginPass()) { $("#txtLogonPass").focus(); return false; }
    if (!checkLoginConPass()) { $("#txtLogonPass2").focus(); return false; }
    //if(!checkInsurePass()){ $("#txtInsurePass1").focus(); return false; }
    //if(!checkInsureConPass()){$("#txtInsurePass2").focus(); return false; }
    if (!checkSpreader()) { $("#txtSpreader").focus(); return false; }
    if (!checkCompellation()) { $("#txtCompellation").focus(); return false; }
    //if(!checkPhone()){ $("#txtMobile").focus(); return false; }
    if (!checkCard()) { $("#txtPassPortID").focus(); return false; }
    if (!checkVerifyCode()) { $("#txtCode").focus(); return false; }
    if (!checkService()) { return false; }
}

$(document).ready(function () {

    $("#txtAccounts").blur(function () {
        if (checkAccounts()) {
            checkUserName();
        }
    });

    $("#txtNickname").blur(function () {
        if (checkNickName()) {
            checkNickNameExit();
        }
    });
    $("#txtCompellation").blur(function () { checkCompellation(); });
    $("#txtLogonPass").blur(function () { checkLoginPass(); });
    $("#txtLogonPass2").blur(function () { checkLoginConPass(); });
    $("#txtInsurePass1").blur(function () { checkInsurePass(); });
    $("#txtInsurePass2").blur(function () { checkInsureConPass(); });
    $("#txtPassPortID").blur(function () { checkCard(); });
    $("#txtSpreader").blur(function () { checkSpreader(); });
    $("#txtMobile").blur(function () { checkPhone(); });
    $("#txtCode").blur(function () { checkVerifyCode(); });
    $("#btnRegister").click(function () {
        return checkInput();
    });
});
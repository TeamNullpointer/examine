$(function(){
    $("#stadd_submit").submit(function(){
        // メールアドレス判定(空)
        var mail_result = true;
        var mail = $("#mail").val();
        var mail_reg = /^[0-9]{7}$/;
        if(!mail){
            mail_result = false;
        }
        // メールアドレス判定(正規表現)
        if(!mail_reg.test(mail)){
            mail_result = false;
        }
        // パスワード判定(空)
        var pass_result = true;
        var pass = $("#pass").val();
        var pass_check = $("#pass_check").val();
        var pass_reg = /^[0-9a-zA-Z]{4,16}$/;
        if(!pass){
            pass_result = false;
        }
        // パスワード判定(正規表現)
        if(!pass_reg.test(pass)){
            pass_result = false;
        }
        // パスワード判定(チェック)
        if(!pass === pass_check){
            pass_result = false;
        }
        // 姓判定(空)
        var sei_result = true;
        var sei = $("#sei").val();
        if(!sei){
            sei_result = false;
        }
        // 姓判定(文字数)
        if(sei.length > 15){
            sei_result = false;
        }
        // 名判定(空)
        var mei_result = true;
        var mei = $("#mei").val();
        if(!mei){
            mei_result = false;
        }
        // 名判定(文字数)
        if(mei.length > 15){
            mei_result = false;
        }
        // セイ判定(空)
        var sei_kana_result = true;
        var sei_kana = $("#sei_kana").val();
        if(!sei_kana){
            sei_kana_result = false;
        }
        // 名判定(文字数)
        if(sei_kana.length > 15){
            sei_kana_result = false;
        }
        // 名判定(空)
        var mei_kana_result = true;
        var mei_kana = $("#mei_kana").val();
        if(!mei_kana){
            mei_kana_result = false;
        }
        // 名判定(文字数)
        if(mei_kana.length > 15){
            mei_kana_result = false;
        }
        // エラー判定
        if(!mail_result
        || !pass_result
        || !sei_result
        || !mei_result
        || !sei_kana_result
        || !mei_kana_result){
            var error = "";
            if(!mail_result){
                error = error + "メールアドレス\n";
            }
            if(!pass_result){
                error = error + "パスワード\n";
            }
            if(!sei_result){
                error = error + "姓\n";
            }
            if(!mei_result){
                error = error + "名\n";
            }
            if(!sei_kana_result){
                error = error + "セイ\n";
            }
            if(!mei_kana_result){
                error = error + "メイ\n";
            }
            error = error + "が正しくありません";
            alert(error);
            return false;
        }
    });
});
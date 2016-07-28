$(function(){
    // 初期化処理
    $("#syusai_select").prop('checked',true);
    $("#kentei_select").prop('checked',true);
    $("#syusai_new_input").prop('disabled',true);
    $("#kentei_new_input").prop('disabled',true);
    $("#syusai_select_select").val(0);
    $("#kentei_select_select").val(0);
    $("#syusai_new_input").val("");
    $("#kentei_new_input").val("");
    // 「新たな主催名を登録」を選択時
    $("#syusai_new").click(function(){
        $("#syusai_new_input").prop('disabled',false);
        $("#syusai_select_select").prop('disabled',true);
    });
    // 「登録済みの主催情報を登録」を選択時
    $("#syusai_select").click(function(){
        $("#syusai_new_input").prop('disabled',true);
        $("#syusai_select_select").prop('disabled',false);
    });
    // 「新たな検定名を登録」を選択時
    $("#kentei_new").click(function(){
        $("#kentei_new_input").prop('disabled',false);
        $("#kentei_select_select").prop('disabled',true);
    });
    // 「登録済みの検定情報を登録」を選択時
    $("#kentei_select").click('click',function(){
        $("#kentei_new_input").prop('disabled',true);
        $("#kentei_select_select").prop('disabled',false);
    });
    // 「検定を登録する」ボタン押下時
    $("#new_kentei").submit(function(){
        var result = true;
        // 「主催選択」を選択時のチェック
        if($("#syusai_select").prop('checked')){
            if($("#syusai_select_select").val() === 0){
                result = false;
            }
        }
        // 「新しい主催」を選択時のチェック
        if($("#syusai_new").prop('checked')){
            if(!$("#syusai_new_input").val()){
                result = false;
            }
        }
        // 「検定選択」を選択時のチェック
        if($("#kentei_select").prop('checked')){
            if($("#kentei_select_select").val() === 0){
                result = false;
            }
        }
        // 「新しい検定」を選択時のチェック
        if($("#kentei_new").prop('checked')){
            if(!$("#kentei_new_input").val()){
                result = false;
            }
        }
        // アラート
        if(!result){
            alert("未入力項目があります");
            return result;
        }
    });
});
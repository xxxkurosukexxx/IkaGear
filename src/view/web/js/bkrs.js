(function($, window) {
    var IkaGear = {};

    // localStorageが使えるかチェック
    if (window.localStorage === undefined) {
        $('.mainContent')
            .find('.row').remove().end()
            .append('<div class="row"><div class="col-xs-12"><p class="alert alert-danger">すみません、たぶんlocalStorageに非対応のブラウザです。<br>保存のためにlocalStorage対応ブラウザをご利用ください。</p></div></div>');
        return false;
    }

    // localStorageにKeyがあればバックアップ用テキストを生成する。
    if (window.localStorage.IkaGear !== undefined) {
        try {
            $('#bkrs__bk').text(Base64.toBase64(RawDeflate.deflate(Base64.utob(window.localStorage.IkaGear))));
        } catch (e) {
            // nop
            // JSONのパースに失敗した場合Exceptionが発生するが失敗した=おそらくデータがおかしいので無視する。
        }
    }

    // インポートボタンイベント設定
    $('#bkrs__rs__btn').on('click', function() {
        var rstxt = $('#bkrs__rs').val();
        if (rstxt != "") {
            if (window.localStorage.IkaGear !== undefined) {
                if (confirm('ブラウザに記憶されているデータを上書きします。よろしいですか？')) {
                    // ブラウザにすでにデータが存在する場合は確認してから実行
                    _IkaGearRestore(rstxt);
                } else {
                    // nop
                };
            } else {
                // ブラウザにデータが存在しないので問答無用に実行
                _IkaGearRestore(rstxt);
            }
        } else {
            alert('バックアップでコピーした文字列を貼り付けてから再度操作してください。');
        }
    });

    function _IkaGearRestore(rstxt) {
        try {
            var rawtxt = Base64.btou(RawDeflate.inflate(Base64.fromBase64(rstxt)));
            //念のためJSONのチェック代わりにオブジェクトに変換してみる
            IkaGear = JSON.parse(rawtxt);
            window.localStorage.IkaGear = rawtxt;
            alert('インポートが完了しました。');
        } catch (e) {
            // 復元失敗。入力データ異常？
            alert('インポートに失敗しました。バックアップから貼り付けた文字列が正しいかご確認ください。');
        }
    }
})(this.jQuery, this);

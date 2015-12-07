(function($, window) {
    var IkaGear = {};

    // localStorageが使えるかチェック
    if (window.localStorage === undefined) {
        $('.mainContent')
            .find('.row').remove().end()
            .append('<div class="row"><div class="col-xs-12"><p class="alert alert-danger">すみません、たぶんlocalStorageに非対応のブラウザです。<br>保存のためにlocalStorage対応ブラウザをご利用ください。</p></div></div>');
        return false;
    }

    // localStorageにKeyがあれば復元する。
    if (window.localStorage.IkaGear !== undefined) {
        try {
            IkaGear = JSON.parse(window.localStorage.IkaGear);
            $.each(Object.keys(IkaGear), function() {
                $('#ghc-' + this).prop('checked', IkaGear[this]);
            });
        } catch (e) {
            // nop
            // JSONのパースに失敗した場合Exceptionが発生するが失敗した=おそらくデータがおかしいので無視する。
        }
    }

    // formボタンのイベント設定
    $('.form__btn__search').on('click', function() {
        $('form').submit();
        return false;
    });
    $('.form__btn__count').on('click', function() {
        var checkBoxCount = $('.gearTable tbody input[type=checkbox]').size(),
            checkedCount = $('.gearTable tbody input[type=checkbox]:checked').size();
        alert('現在の検索条件での保有率：' + checkedCount + ' / ' + checkBoxCount);
        return false;
    });

    // lazyload.
    $('img.lazy').lazyload({
        effect: 'fadeIn'
    });

    // sortイベントの設定
    $('.sorter').on('click', function() {
        if ($(this).data('sortOrder') == 'asc') {
            $('#sort__order').val('desc');
        } else if ($(this).data('sortOrder') == 'desc') {
            $('#sort__order').val('asc');
        } else {
            $('#sort__name').val($(this).data('sortName'));
            $('#sort__order').val('asc');
        }
        $('form').submit();
        return false;
    });

    // 保有テェックイベントの設定
    $('.gear__have__check').on('change', function() {
        IkaGear[$(this).val()] = $(this).is(':checked');
        window.localStorage.IkaGear = JSON.stringify(IkaGear);
    });
})(this.jQuery, this);

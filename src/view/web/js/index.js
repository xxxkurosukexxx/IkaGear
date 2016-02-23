(function($, window) {
    var IkaGear = {};
    var VC_ALL = 'all',
        VC_HAVE = 'have',
        VC_NOTHAVE = 'nothave';

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
        ga('send', 'event', 'button', 'click', 'CountBtn');
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

    // 表示切替
    switch ($('.viewchange__hidden').val()) {
        case VC_ALL:
            _changeViewChange(VC_ALL);
            break;
        case VC_NOTHAVE:
            _changeViewChange(VC_NOTHAVE);
            break;
        case VC_HAVE:
            _changeViewChange(VC_HAVE);
            break;
        default:
            break;
    }
    $('.viewchange__a').on('click', function() {
        ga('send', 'event', 'button', 'click', 'ViewChange', $(this).data('value'));
        switch ($(this).data('value')) {
            case '全て':
                _changeViewChange(VC_ALL);
                break;
            case '未保有のみ':
                _changeViewChange(VC_NOTHAVE);
                break;
            case '保有のみ':
                _changeViewChange(VC_HAVE);
                break;
            default:
                break;
        }
        //return false;
    });

    function _changeViewChange(mode) {
        switch (mode) {
            case VC_ALL:
                $('.gearTable tbody .gear').removeClass('hide');
                $('#viewchange__btn__span').text('表示：全て');
                $('.viewchange__hidden').val(VC_ALL)
                break;
            case VC_NOTHAVE:
                $('.gearTable tbody .gear').addClass('hide')
                    .find('.gear__have__check:not(:checked)').parents('.gear').removeClass('hide');
                $('#viewchange__btn__span').text('表示：未保有のみ');
                $('.viewchange__hidden').val(VC_NOTHAVE)
                break;
            case VC_HAVE:
                $('.gearTable tbody .gear').addClass('hide')
                    .find('.gear__have__check:checked').parents('.gear').removeClass('hide');
                $('#viewchange__btn__span').text('表示：保有のみ');
                $('.viewchange__hidden').val(VC_HAVE)
                break;
            default:
                break;
        }
    }
})(this.jQuery, this);

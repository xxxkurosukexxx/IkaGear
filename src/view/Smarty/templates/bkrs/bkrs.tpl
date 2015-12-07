<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>IkaGear</title>

{include file="common/commonLoadCss.tpl"}

  <link rel="stylesheet" href="/css/bkrs.css">
</head>

<body>
  <div class="container mainContent">
{include file="common/commonHeader.tpl"}
    <div class="row">
      <div class="col-xs-12">
        <p>
          <strong>バックアップ</strong><br>
          他の端末，ブラウザにデータをコピーしたい場合は↓のテキストをコピーしてください。
        </p>
        <textarea id="bkrs__bk" rows="4"></textarea>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12">
        <p>
          <strong>インポート</strong><br>
          他の端末，ブラウザから取り込む場合は↓にコピーしたテキストを貼り付けてインポートボタンを押してください。
        </p>
        <textarea id="bkrs__rs" rows="4"></textarea>
        <button id="bkrs__rs__btn" class="btn btn-default pull-right">インポート</button>
      </div>
    </div>
  </div>

{include file="common/commonFooter.tpl"}

{include file="common/commonLoadJs.tpl"}

  <script src="/js/lib/base64.js"></script>
  <script src="/js/lib/rawinflate.js"></script>
  <script src="/js/lib/rawdeflate.js"></script>
  <script src="/js/bkrs.js"></script>
</body>

</html>

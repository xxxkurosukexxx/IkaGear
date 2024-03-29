<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>エラー発生 - IkaGear</title>

{include file="common/commonLoadCss.tpl"}

</head>

<body>
  <div class="container mainContent">
{include file="common/commonHeader.tpl"}
    <div class="row">
      <div class="col-xs-12">
        <p>エラーが発生しました。</p>
        <p>{$errorMessage}</p>
      </div>
    </div>
  </div>

{include file="common/commonFooter.tpl"}

{include file="common/commonLoadJs.tpl"}

  <script>
    ga('send', 'event', 'system', 'error');
  </script>
</body>

</html>

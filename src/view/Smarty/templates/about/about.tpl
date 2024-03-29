<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>当サイトについて・免責事項など - IkaGear</title>

{include file="common/commonLoadCss.tpl"}

  <link rel="stylesheet" href="/css/about.css?v={#version#}">
</head>

<body>
  <div class="container mainContent">
{include file="common/commonHeader.tpl"}
    <ol class="breadcrumb">
      <li><a href="index.php">IkaGear</a></li>
      <li class="active">当サイトについて・免責事項など</a></li>
    </ol>
    <div class="row">
        <div class="col-xs-12">
          <p class="h3">About</p>
        </div>
        <div class="col-xs-12">
          <p>
            何番煎じかわからないギアの検索と保有管理ツールです。
          </p>
          <p>
            保有チェックの保存はブラウザのlocalStorageに保存します。<br>
            <del>なので、他のブラウザ・端末で共有できません。（そのうち何とかするかも）</del><br>
            <a href="/bkrs.php">バックアップ・インポート</a>機能で他のブラウザにデータ引き継げるようになりました。<br>
          </p>
          <p>
            動作確認環境：Windows7+Chrome / iPhone 6s 9.0.2+Chrome<br>
            Internet Explorerは9以上じゃないと動かないです。（9以上で動く保証もないです。）<br>
            Twitterクライアントなどのアプリ内ブラウザも動くかわからないので、Safariとか使って頂いたほうが良いと思います。（未検証）<br>
          </p>
        </div>
    </div>
    <div class="row">
      <div class="col-xs-12">
        <p class="h3">Special Thanks</p>
      </div>
      <div class="col-xs-12">
        <p>当サイト制作にあたり、イカのサイトを参考にさせていただきました。</p>
        <dl>
          <dt>スプラトゥーン(Splatoon) for 2ch Wiki* 様</dt>
          <dd><a href="http://wikiwiki.jp/splatoon2ch/" target="_blank">http://wikiwiki.jp/splatoon2ch/</a></dd>
          <dt>ギア - IkaDB! - スプラトゥーン 装備品検索データベース 様</dt>
          <dd><a href="https://ikadb.herokuapp.com/gears" target="_blank">https://ikadb.herokuapp.com/gears</a></dd>
          <dt>スプラトゥーン ギアチェック 様</dt>
          <dd><a href="http://bukikoubou.com/splatoon_gear/" target="_blank">http://bukikoubou.com/splatoon_gear/</a></dd>
        </dl>
      </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
          <p class="h3">免責事項・その他</p>
        </div>
        <div class="col-xs-12">
          <p>本サイトのコンテンツに記載された会社名・製品名は、各法人または個人の登録商標または商標です。<br>スプラトゥーン/Splatoonは任天堂の登録商標です。<br>本サイトは任天堂やスプラトゥーン公式とは一切関係ありません。</p>
          <p>内容に誤りや問題があった場合、<a href="https://twitter.com/xxxkurosukexxx" target="_blank">ナカノヒト：@xxxkurosukexxx</a>へご連絡ください。</p>
        </div>
    </div>
    <div class="row">
      <div class="col-xs-12">
        <p class="h3">リリースノート</p>
      </div>
      <div class="col-xs-12">
        <dl>
          <dt><a href="https://github.com/xxxkurosukexxx/IkaGear/releases/tag/v20160202" target="_blank">v20160202</a></dt>
          <dd><ul>
            <li>Fix：内部調整</li>
          </ul></dd>
          <dt><a href="https://github.com/xxxkurosukexxx/IkaGear/releases/tag/v20151211" target="_blank">v20151211</a></dt>
          <dd><ul>
            <li>Fix：内部調整</li>
          </ul></dd>
          <dt><a href="https://github.com/xxxkurosukexxx/IkaGear/releases/tag/v20151208" target="_blank">v20151208</a></dt>
          <dd><ul>
            <li>New：表示切替機能追加（全て：未保有のみ：保有のみ）</li>
            <li>New：Aboutページにリリースノート追加</li>
            <li>Fix：JavaScript/CSSのキャッシュ対策追加</li>
          </ul></dd>
          <dt><a href="https://github.com/xxxkurosukexxx/IkaGear/releases/tag/v20151207" target="_blank">v20151207</a></dt>
          <dd><ul>
            <li>Fix：スマホ表示調整</li>
            <li>New：現在の検索条件で未保有数をalert表示</li>
            <li>New：バックアップ・インポート機能実装</li>
          </ul></dd>
          <dt><a href="https://github.com/xxxkurosukexxx/IkaGear/releases/tag/v20151204" target="_blank">v20151204</a></dt>
          <dd><ul>
            <li>1st release.</li>
          </ul></dd>
{* テンプレート
          <dt><a href="https://github.com/xxxkurosukexxx/IkaGear/releases/tag/" target="_blank">v</a></dt>
          <dd><ul>
            <li></li>
          </ul></dd>
*}
        </dl>
      </div>
    </div>
  </div>

{include file="common/commonFooter.tpl"}

{include file="common/commonLoadJs.tpl"}

</body>

</html>

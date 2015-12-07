<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>IkaGear</title>

{include file="common/commonLoadCss.tpl"}

  <link rel="stylesheet" href="/css/index.css">
</head>

<body>
  <div class="container mainContent">
{include file="common/commonHeader.tpl"}
    <div class="row">
      <form>
        <input type="hidden" name="sort__name" id="sort__name" value="{$sort['name']}">
        <input type="hidden" name="sort__order" id="sort__order" value="{$sort['order']}">
        <div class="col-xs-12">
          <div class="form-group">
            <label>ギア名（部分一致）</label>
            <input type="text" class="form-control" name="search__name"{if $sp['name']} value="{$sp['name']}"{/if}>
          </div>
        </div>
        <div class="col-xs-6 col-sm-3">
          <div class="form-group">
            <label>ギア種別</label>
            <select class="form-control" name="search__type">
              <option value="">---</option>
{foreach $types as $t}
              <option value="{$t['name']}"{if $sp['type']==$t['name']} selected{/if}>{$t['name']}</option>
{/foreach}
            </select>
          </div>
        </div>
        <div class="col-xs-6 col-sm-3">
          <div class="form-group">
            <label>ブランド</label>
            <select class="form-control" name="search__brand">
              <option value="">---</option>
{foreach $brands as $b}
              <option value="{$b['name']}"{if $sp['brand']==$b['name']} selected{/if}>{$b['name']}</option>
{/foreach}
            </select>
          </div>
        </div>
        <div class="col-xs-6 col-sm-3">
          <div class="form-group">
            <label>メインパワー</label>
            <select class="form-control" name="search__mainPower">
              <option value="">---</option>
{foreach $powers as $p}
              <option value="{$p['name']}"{if $sp['mainPower']==$p['name']} selected{/if}>{$p['name']}</option>
{/foreach}
            </select>
          </div>
        </div>
        <div class="col-xs-6 col-sm-3">
          <div class="form-group">
            <label>ランク</label>
            <select class="form-control" name="search__rank">
              <option value="">---</option>
              <option value="1"{if $sp['rank']=='1'} selected{/if}>★</option>
              <option value="2"{if $sp['rank']=='2'} selected{/if}>★★</option>
              <option value="3"{if $sp['rank']=='3'} selected{/if}>★★★</option>
            </select>
          </div>
        </div>
        <div class="col-xs-12">
          <div class="form-group">
            <label>追加バージョン</label>
            <div class="checkbox">
{foreach $versions as $v}
              <label><input type="checkbox" name="search__version[]" value="{$v['name']}"{if in_array($v['name'], $sp['version'])} checked{/if}> v{$v['name']}</label>　
{/foreach}
            </div>
          </div>
        </div>
        <div class="col-xs-12">
          <button class="btn btn-default form__btn__search">検索</button>
          <button class="btn btn-default pull-right form__btn__count">カウント</button>
        </div>
      </form>
    </div>
    <div class="row">
      <div class="col-xs-12">
        <table class="gearTable">
          <thead>
            <tr class="gear">
              <th class="gear__have">保有</th>
              <th class="gear__name"><a class="sorter" data-sort-name="sort__name" data-sort-order="{if $sort['name'] == 'sort__name'}{if $sort['order'] == 'desc'}desc{else}asc{/if}{/if}">ギア名{if $sort['name'] == 'sort__name'} {if $sort['order'] == 'desc'}▼{else}▲{/if}{/if}</a></th>
              <th class="gear__brand"><a class="sorter" data-sort-name="sort__brand" data-sort-order="{if $sort['name'] == 'sort__brand'}{if $sort['order'] == 'desc'}desc{else}asc{/if}{/if}">ブランド{if $sort['name'] == 'sort__brand'} {if $sort['order'] == 'desc'}▼{else}▲{/if}{/if}</a></th>
              <th class="gear__mainPower"><a class="sorter" data-sort-name="sort__mainPower" data-sort-order="{if $sort['name'] == 'sort__mainPower'}{if $sort['order'] == 'desc'}desc{else}asc{/if}{/if}">メイン{if $sort['name'] == 'sort__mainPower'} {if $sort['order'] == 'desc'}▼{else}▲{/if}{/if}</a></th>
              <th class="gear__easyPower hidden-xs"><a class="sorter" data-sort-name="sort__easyPower" data-sort-order="{if $sort['name'] == 'sort__easyPower'}{if $sort['order'] == 'desc'}desc{else}asc{/if}{/if}">付きやすい{if $sort['name'] == 'sort__easyPower'} {if $sort['order'] == 'desc'}▼{else}▲{/if}{/if}</a></th>
              <th class="gear__difficultyPower hidden-xs"><a class="sorter" data-sort-name="sort__difficultyPower" data-sort-order="{if $sort['name'] == 'sort__difficultyPower'}{if $sort['order'] == 'desc'}desc{else}asc{/if}{/if}">付きにくい{if $sort['name'] == 'sort__difficultyPower'} {if $sort['order'] == 'desc'}▼{else}▲{/if}{/if}</a></th>
              <th class="gear__rank"><a class="sorter" data-sort-name="sort__rank" data-sort-order="{if $sort['name'] == 'sort__rank'}{if $sort['order'] == 'desc'}desc{else}asc{/if}{/if}">ランク{if $sort['name'] == 'sort__rank'} {if $sort['order'] == 'desc'}▼{else}▲{/if}{/if}</a></th>
              <th class="gear__price"><a class="sorter" data-sort-name="sort__price" data-sort-order="{if $sort['name'] == 'sort__price'}{if $sort['order'] == 'desc'}desc{else}asc{/if}{/if}">価格{if $sort['name'] == 'sort__price'} {if $sort['order'] == 'desc'}▼{else}▲{/if}{/if}</a></th>
              <th class="gear__version hidden-xs"><a class="sorter" data-sort-name="sort__version" data-sort-order="{if $sort['name'] == 'sort__version'}{if $sort['order'] == 'desc'}desc{else}asc{/if}{/if}">実装{if $sort['name'] == 'sort__version'} {if $sort['order'] == 'desc'}▼{else}▲{/if}{/if}</a></th>
            </tr>
          </thead>
          <tbody>
{foreach $gears as $g}
            <tr class="gear">
              <td class="gear__have checkbox"><label><input type="checkbox" class="form-control input-sm gear__have__check" id="ghc-{$g['uuid']}" value="{$g['uuid']}"></label></td>
              <td class="gear__name"><img data-original="/img{$g['img']}" class="lazy gear__name__img">{$g['name']}</td>
              <td class="gear__brand"><img data-original="/img{$g['brand_img']}" class="lazy gear__brand__img">{$g['brand']}</td>
              <td class="gear__mainPower"><img data-original="/img{$g['power_img']}" class="lazy gear__mainPower__img"></td>
              <td class="gear__easyPower hidden-xs">{if {$g['easy_power_img']} != ''}<img data-original="/img{$g['easy_power_img']}" class="lazy gear__easyPower__img">{else}--{/if}</td>
              <td class="gear__difficultyPower hidden-xs">{if {$g['difficulty_power_img']} != ''}<img data-original="/img{$g['difficulty_power_img']}" class="lazy gear__difficultyPower__img">{else}--{/if}</td>
              <td class="gear__rank">{for $i=1 to $g['rank']}★{/for}</td>
              <td class="gear__price">{if is_numeric($g['price'])}{$g['price']|number_format}{else}{$g['price']}{/if}</td>
              <td class="gear__version hidden-xs">v{$g['version']}～</td>
            </tr>
{/foreach}
          </tbody>
        </table>
      </div>
    </div>
  </div>

{include file="common/commonFooter.tpl"}

{include file="common/commonLoadJs.tpl"}

  <script src="/js/index.js"></script>
</body>

</html>

-- 文字コード：UTF-8

-- ********************
-- ** CREATE TABLES
-- ********************

DROP TABLE IF EXISTS version;
CREATE TABLE version (
    uuid char(38) NOT NULL PRIMARY KEY DEFAULT(printf('%s-%s-%s-%s-%s', lower(hex(randomblob(4))), lower(hex(randomblob(2))), lower(hex(randomblob(2))), lower(hex(randomblob(2))), lower(hex(randomblob(6))))),
    name string
);

DROP TABLE IF EXISTS type;
CREATE TABLE type (
    uuid char(38) NOT NULL DEFAULT(printf('%s-%s-%s-%s-%s', lower(hex(randomblob(4))), lower(hex(randomblob(2))), lower(hex(randomblob(2))), lower(hex(randomblob(2))), lower(hex(randomblob(6))))),
    name string
);

DROP TABLE IF EXISTS power;
CREATE TABLE power (
    uuid char(38) NOT NULL PRIMARY KEY DEFAULT(printf('%s-%s-%s-%s-%s', lower(hex(randomblob(4))), lower(hex(randomblob(2))), lower(hex(randomblob(2))), lower(hex(randomblob(2))), lower(hex(randomblob(6))))),
    name string,
    img string
);

DROP TABLE IF EXISTS brand;
CREATE TABLE brand (
    uuid char(38) NOT NULL PRIMARY KEY DEFAULT(printf('%s-%s-%s-%s-%s', lower(hex(randomblob(4))), lower(hex(randomblob(2))), lower(hex(randomblob(2))), lower(hex(randomblob(2))), lower(hex(randomblob(6))))),
    name string,
    img string,
    easyadd_power_uuid char(38),
    difficultyadd_power_uuid char(38)
);

DROP TABLE IF EXISTS gear;
CREATE TABLE gear (
    uuid char(38) NOT NULL PRIMARY KEY DEFAULT(printf('%s-%s-%s-%s-%s', lower(hex(randomblob(4))), lower(hex(randomblob(2))), lower(hex(randomblob(2))), lower(hex(randomblob(2))), lower(hex(randomblob(6))))),
    name string,
    img string,
    rank int,
    price int,
    price2 string,
    brand_uuid char(38),
    power_uuid char(38),
    type_uuid char(38),
    version_uuid char(38)
);

-- ********************
-- ** INSERT
-- ** memo:依存関係に注意
-- ********************

INSERT INTO version (name) VALUES
    ("1.0.0"),
    ("2.0.0"),
    ("2.3.0");

INSERT INTO type (name) VALUES
    ("アタマ"),
    ("フク"),
    ("クツ");

INSERT INTO power (name, img) VALUES
    ("スペシャル増加量アップ", "/power/power_001.png"),
    ("ヒト移動速度アップ", "/power/power_002.png"),
    ("ボムサーチ", "/power/power_003.png"),
    ("ボム飛距離アップ", "/power/power_004.png"),
    ("マーキングガード", "/power/power_005.png"),
    ("ラストスパート", "/power/power_006.png"),
    ("安全シューズ", "/power/power_007.png"),
    ("逆境強化", "/power/power_008.png"),
    ("攻撃力アップ", "/power/power_009.png"),
    ("復活時間短縮", "/power/power_010.png"),
    ("防御力アップ", "/power/power_011.png"),
    ("イカダッシュ速度アップ", "/power/power_012.png"),
    ("イカニンジャ", "/power/power_013.png"),
    ("インク回復力アップ", "/power/power_014.png"),
    ("インク効率アップ（サブ）", "/power/power_015.png"),
    ("インク効率アップ（メイン）", "/power/power_016.png"),
    ("うらみ", "/power/power_017.png"),
    ("カムバック", "/power/power_018.png"),
    ("スーパージャンプ時間短縮", "/power/power_019.png"),
    ("スタートダッシュ", "/power/power_020.png"),
    ("スタートレーダー", "/power/power_021.png"),
    ("ステルスジャンプ", "/power/power_022.png"),
    ("スペシャル減少量ダウン", "/power/power_023.png"),
    ("スペシャル時間延長", "/power/power_024.png");

INSERT INTO brand (name, img, easyadd_power_uuid, difficultyadd_power_uuid) VALUES
    ("amiibo", "/brand/brand_001.png", NULL, NULL),
    ("KOG", "/brand/brand_002.png", NULL, NULL),
    ("アイロニック", "/brand/brand_003.png", (select uuid from power where name = "スーパージャンプ時間短縮"), (select uuid from power where name = "復活時間短縮")),
    ("アタリメイド", "/brand/brand_004.png", NULL, NULL),
    ("アロメ", "/brand/brand_005.png", (select uuid from power where name = "インク回復力アップ"), (select uuid from power where name = "スーパージャンプ時間短縮")),
    ("エゾッコ", "/brand/brand_006.png", (select uuid from power where name = "スペシャル減少量ダウン"), (select uuid from power where name = "スペシャル増加量アップ")),
    ("クラーゲス", "/brand/brand_007.png", (select uuid from power where name = "イカダッシュ速度アップ"), (select uuid from power where name = "防御力アップ")),
    ("シグレニ", "/brand/brand_008.png", (select uuid from power where name = "防御力アップ"), (select uuid from power where name = "攻撃力アップ")),
    ("ジモン", "/brand/brand_009.png", (select uuid from power where name = "インク効率アップ（メイン）"), (select uuid from power where name = "ヒト移動速度アップ")),
    ("バトロイカ", "/brand/brand_010.png", (select uuid from power where name = "攻撃力アップ"), (select uuid from power where name = "インク効率アップ（メイン）")),
    ("ファミ通", "/brand/brand_011.png", NULL, NULL),
    ("フォーリマ", "/brand/brand_012.png", (select uuid from power where name = "スペシャル時間延長"), (select uuid from power where name = "インク効率アップ（サブ）")),
    ("ホタックス", "/brand/brand_013.png", (select uuid from power where name = "復活時間短縮"), (select uuid from power where name = "スペシャル減少量ダウン")),
    ("ホッコリー", "/brand/brand_014.png", (select uuid from power where name = "インク効率アップ（サブ）"), (select uuid from power where name = "インク回復力アップ")),
    ("ヤコ", "/brand/brand_015.png", (select uuid from power where name = "スペシャル増加量アップ"), (select uuid from power where name = "スペシャル時間延長")),
    ("ロッケンベルグ", "/brand/brand_016.png", (select uuid from power where name = "ヒト移動速度アップ"), (select uuid from power where name = "イカダッシュ速度アップ")),
    ("侵略！イカ娘", "/brand/brand_017.png", NULL, NULL);

INSERT INTO gear (name, img, rank, price, price2, brand_uuid, power_uuid, type_uuid, version_uuid) VALUES
    ("アイロニックレイヤード", "/gear/c/gear_c_001.png", 1, 600, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "攻撃力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("アオサドーレ", "/gear/c/gear_c_002.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "ヤコ"), (SELECT uuid FROM power WHERE name = "攻撃力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("かくれパイレーツ", "/gear/c/gear_c_003.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "攻撃力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("カレッジスウェット　ネイビー", "/gear/c/gear_c_004.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "攻撃力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ロッケンベルグT ブラック", "/gear/c/gear_c_005.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "攻撃力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカ娘ノースリーブ", "/gear/c/gear_c_006.png", 2, 2000, NULL, (SELECT uuid FROM brand WHERE name = "侵略！イカ娘"), (SELECT uuid FROM power WHERE name = "攻撃力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ボーダーネイビー", "/gear/c/gear_c_007.png", 2, 2300, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "攻撃力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("スタジャンロゴマシ", "/gear/c/gear_c_008.png", 3, 12000, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "攻撃力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("エゾッコラグラン", "/gear/c/gear_c_009.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "防御力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ニクショクT", "/gear/c/gear_c_010.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "防御力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ミントT", "/gear/c/gear_c_011.png", 1, 400, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "防御力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ヤキフグ8bit ブラック", "/gear/c/gear_c_012.png", 1, 600, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "防御力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("FCカラスミ", "/gear/c/gear_c_013.png", 2, 1800, NULL, (SELECT uuid FROM brand WHERE name = "ヤコ"), (SELECT uuid FROM power WHERE name = "防御力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("ベイビークラゲシャツ", "/gear/c/gear_c_014.png", 2, 2200, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "防御力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("チャリキングジャージ", "/gear/c/gear_c_015.png", 3, 8900, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "防御力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("レトロジャッジ", "/gear/c/gear_c_016.png", 3, 9000, NULL, (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "防御力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("オータムネル", "/gear/c/gear_c_017.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（メイン）"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("ベクトルパターン レッド", "/gear/c/gear_c_018.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "ヤコ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（メイン）"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("レイニーブルーT", "/gear/c/gear_c_019.png", 1, 300, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "インク効率アップ（メイン）"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("レイヤード ブラック", "/gear/c/gear_c_020.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（メイン）"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカセーラー ホワイト", "/gear/c/gear_c_021.png", 2, 3000, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（メイン）"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("ギンガムチェック アカ", "/gear/c/gear_c_022.png", 2, 2000, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（メイン）"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカホワイト", "/gear/c/gear_c_023.png", 1, 400, NULL, (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（サブ）"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("パールドットT", "/gear/c/gear_c_024.png", 1, 400, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "インク効率アップ（サブ）"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("バスケジャージ アウェイ", "/gear/c/gear_c_025.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "インク効率アップ（サブ）"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("マルエリシャツ", "/gear/c/gear_c_026.png", 1, 600, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（サブ）"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ヤマビコT ブルー", "/gear/c/gear_c_027.png", 1, 400, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（サブ）"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("タコゾネスプロテクター", "/gear/c/gear_c_028.png", 2, NULL, "ヒーローモードクリア報酬(非売品)", (SELECT uuid FROM brand WHERE name = "アタリメイド"), (SELECT uuid FROM power WHERE name = "インク効率アップ（サブ）"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("チョコガサネ", "/gear/c/gear_c_029.png", 2, 1800, NULL, (SELECT uuid FROM brand WHERE name = "ヤコ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（サブ）"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("おどるイカアロハ", "/gear/c/gear_c_030.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("グレープT", "/gear/c/gear_c_031.png", 1, 400, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("バトロングホワイト", "/gear/c/gear_c_032.png", 1, 600, NULL, (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("シロシャツ", "/gear/c/gear_c_033.png", 2, 1800, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("スクールブレザー", "/gear/c/gear_c_034.png", 2, NULL, "amiibo:ガールボス2クリア報酬(非売品)", (SELECT uuid FROM brand WHERE name = "amiibo"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ロゴマシマシアロハ", "/gear/c/gear_c_035.png", 2, 2900, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ロッケンベルグT ホワイト", "/gear/c/gear_c_036.png", 2, 2500, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("フォレストダウン", "/gear/c/gear_c_037.png", 3, 11000, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("イカノメT ブラック", "/gear/c/gear_c_038.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "ヒト移動速度アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ウーニーズBBシャツ", "/gear/c/gear_c_039.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "ヒト移動速度アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("クラーゲス528", "/gear/c/gear_c_040.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "ヒト移動速度アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("マリンボーダー", "/gear/c/gear_c_041.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "ヒト移動速度アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("F-190", "/gear/c/gear_c_042.png", 2, 2900, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "ヒト移動速度アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("オレンジボーダーラガー", "/gear/c/gear_c_043.png", 2, 2300, NULL, (SELECT uuid FROM brand WHERE name = "ヤコ"), (SELECT uuid FROM power WHERE name = "ヒト移動速度アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ガチガサネ", "/gear/c/gear_c_044.png", 3, 8500, NULL, (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "ヒト移動速度アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("カレッジスウェット グレー", "/gear/c/gear_c_045.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "イカダッシュ速度アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("チドリメロンＴ", "/gear/c/gear_c_046.png", 1, 400, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "イカダッシュ速度アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ハラグロラグラン", "/gear/c/gear_c_047.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "イカダッシュ速度アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("マルフグT", "/gear/c/gear_c_048.png", 1, 750, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "イカダッシュ速度アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("ラインT ホワイト", "/gear/c/gear_c_049.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "KOG"), (SELECT uuid FROM power WHERE name = "イカダッシュ速度アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ヒーロージャケット レプリカ", "/gear/c/gear_c_050.png", 2, NULL, "ヒーローモードクリア報酬(非売品)", (SELECT uuid FROM brand WHERE name = "アタリメイド"), (SELECT uuid FROM power WHERE name = "イカダッシュ速度アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("マウンテンダウン", "/gear/c/gear_c_051.png", 3, 11000, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "イカダッシュ速度アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("カモガサネ", "/gear/c/gear_c_052.png", 1, 600, NULL, (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "スペシャル増加量アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("サニーオレンジT", "/gear/c/gear_c_053.png", 1, 300, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "スペシャル増加量アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("レタード　オレンジ", "/gear/c/gear_c_054.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "スペシャル増加量アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ウラスカジャン", "/gear/c/gear_c_055.png", 2, 2900, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "スペシャル増加量アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("サムライジャケット", "/gear/c/gear_c_056.png", 2, NULL, "amiibo:ボーイボス2クリア報酬（非売品)", (SELECT uuid FROM brand WHERE name = "amiibo"), (SELECT uuid FROM power WHERE name = "スペシャル増加量アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("アーマージャケット　レプリカ", "/gear/c/gear_c_057.png", 3, NULL, "非売品(ランク30入手)", (SELECT uuid FROM brand WHERE name = "アタリメイド"), (SELECT uuid FROM power WHERE name = "スペシャル増加量アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ミスターベースボール", "/gear/c/gear_c_058.png", 3, 10000, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "スペシャル増加量アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("アイロニックロング", "/gear/c/gear_c_059.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "スペシャル時間延長"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカゴッチンベスト", "/gear/c/gear_c_060.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "スペシャル時間延長"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("イカブラック", "/gear/c/gear_c_061.png", 1, 400, NULL, (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "スペシャル時間延長"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("パイレーツボーダー", "/gear/c/gear_c_062.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "スペシャル時間延長"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("リールロールスウェット", "/gear/c/gear_c_063.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "スペシャル時間延長"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("ジップアップ グリーン", "/gear/c/gear_c_064.png", 2, 2800, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "スペシャル時間延長"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("マウンテンベリー", "/gear/c/gear_c_065.png", 2, 3000, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "スペシャル時間延長"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカライダーWHITE", "/gear/c/gear_c_066.png", 3, 11800, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "スペシャル時間延長"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("トリコロールラガー", "/gear/c/gear_c_067.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "ヤコ"), (SELECT uuid FROM power WHERE name = "復活時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("わかばイカT", "/gear/c/gear_c_068.png", 1, NULL, "初期装備", (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "復活時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("タイショウのまえかけ", "/gear/c/gear_c_069.png", 2, 2000, NULL, (SELECT uuid FROM brand WHERE name = "ファミ通"), (SELECT uuid FROM power WHERE name = "復活時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("パワードスーツ", "/gear/c/gear_c_070.png", 2, NULL, "amiibo:イカボス2クリア報酬(非売品)", (SELECT uuid FROM brand WHERE name = "amiibo"), (SELECT uuid FROM power WHERE name = "復活時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ボーダーホワイト", "/gear/c/gear_c_071.png", 2, 2300, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "復活時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("FCジャージー", "/gear/c/gear_c_072.png", 3, 9000, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "復活時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("イカスカジャン", "/gear/c/gear_c_073.png", 3, 8900, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "復活時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("ジップアップ カモ", "/gear/c/gear_c_074.png", 3, 9000, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "復活時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ドカンT ブラック", "/gear/c/gear_c_075.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "KOG"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("レイヤード ホワイト", "/gear/c/gear_c_076.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("グリーンＴ", "/gear/c/gear_c_077.png", 2, 1500, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("バスケジャージ ホーム", "/gear/c/gear_c_078.png", 2, 2300, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ベクトルラインガサネ", "/gear/c/gear_c_079.png", 2, 2500, NULL, (SELECT uuid FROM brand WHERE name = "ヤコ"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカジャマイカ", "/gear/c/gear_c_080.png", 3, 8200, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("タイシャツ", "/gear/c/gear_c_081.png", 3, 8400, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("フェスＴ", "/gear/c/gear_c_082.png", 3, NULL, "フェス限定(非売品)フェス後返却", (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカスタンシャツ", "/gear/c/gear_c_083.png", 1, 750, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("ハラシロラグラン", "/gear/c/gear_c_084.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ベクトルパターン グレー", "/gear/c/gear_c_085.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "ヤコ"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("マスタードガサネ", "/gear/c/gear_c_086.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ヤマビコボーダー", "/gear/c/gear_c_087.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("バニーポップ ブラック", "/gear/c/gear_c_088.png", 2, 3000, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ブロックストライプシャツ", "/gear/c/gear_c_089.png", 2, 2200, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ミックスシャツグレー", "/gear/c/gear_c_090.png", 2, 2800, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("イカバッテン マスタード", "/gear/c/gear_c_091.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("カモフラパープル", "/gear/c/gear_c_092.png", 1, 600, NULL, (SELECT uuid FROM brand WHERE name = "ヤコ"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("シャンブレーシャツ", "/gear/c/gear_c_093.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ギンガムチェック ミドリ", "/gear/c/gear_c_094.png", 2, 2000, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ホッコリー ネイビー", "/gear/c/gear_c_095.png", 2, 2500, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカセーラー ブルー", "/gear/c/gear_c_096.png", 3, 11000, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("イカライダーBLACK", "/gear/c/gear_c_097.png", 3, 10100, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("イカノボリベスト", "/gear/c/gear_c_098.png", 1, 650, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "マーキングガード"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("イカノメT ライトブルー", "/gear/c/gear_c_099.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "マーキングガード"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("よもぎポロ", "/gear/c/gear_c_100.png", 1, 400, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "マーキングガード"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカリスウェット", "/gear/c/gear_c_101.png", 2, 3000, NULL, (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "マーキングガード"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("テッカサイクルシャツ", "/gear/c/gear_c_102.png", 2, 2900, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "マーキングガード"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("アーバンベスト ナイト", "/gear/c/gear_c_103.png", 3, 10000, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "マーキングガード"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("さくらエビポロ", "/gear/c/gear_c_104.png", 1, 400, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "イカニンジャ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ソウショクT", "/gear/c/gear_c_105.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "イカニンジャ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("ボーダーモスグリーン", "/gear/c/gear_c_106.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "イカニンジャ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("エゾッコパーカー アズキ", "/gear/c/gear_c_107.png", 2, 2800, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "イカニンジャ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("スクールジャージー", "/gear/c/gear_c_108.png", 2, 3000, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "イカニンジャ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ガチホワイト", "/gear/c/gear_c_109.png", 3, 8000, NULL, (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "イカニンジャ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカバッテンロング", "/gear/c/gear_c_110.png", 1, 600, NULL, (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "うらみ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ヤマビコT アイボリー", "/gear/c/gear_c_111.png", 1, 400, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "うらみ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("F-010", "/gear/c/gear_c_112.png", 2, 2700, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "うらみ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("アーバンベスト イエロー", "/gear/c/gear_c_113.png", 2, 3000, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "うらみ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ヴィンテージチェック", "/gear/c/gear_c_114.png", 3, 9000, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "うらみ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("タコT", "/gear/c/gear_c_115.png", 3, NULL, "非売品(ランク45入手)", (SELECT uuid FROM brand WHERE name = "アタリメイド"), (SELECT uuid FROM power WHERE name = "うらみ"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("カレッジラグラン", "/gear/c/gear_c_116.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "スタートレーダー"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ピンポンポロ", "/gear/c/gear_c_117.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "スタートレーダー"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("ヤキフグ8bit ホワイト", "/gear/c/gear_c_118.png", 1, 600, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "スタートレーダー"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ガチブラック", "/gear/c/gear_c_119.png", 2, 2800, NULL, (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "スタートレーダー"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("レタード　グリーン", "/gear/c/gear_c_120.png", 2, 1700, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "スタートレーダー"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("マウンテンオリーブ", "/gear/c/gear_c_121.png", 3, 11000, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "スタートレーダー"), (SELECT uuid FROM type WHERE name = "フク"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("スカッシュバンド", "/gear/h/gear_h_001.png", 1, 400, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "攻撃力アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("サムライヘルメット", "/gear/h/gear_h_002.png", 2, NULL, "amiibo:ボーイボス1クリア報酬(非売品)", (SELECT uuid FROM brand WHERE name = "amiibo"), (SELECT uuid FROM power WHERE name = "攻撃力アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ダイバーゴーグル", "/gear/h/gear_h_003.png", 2, NULL, "ヒーローモードクリア報酬(非売品)", (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "攻撃力アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("でんせつのぼうし", "/gear/h/gear_h_004.png", 3, NULL, "非売品(ランク50入手)", (SELECT uuid FROM brand WHERE name = "アタリメイド"), (SELECT uuid FROM power WHERE name = "攻撃力アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ヤコメッシュ", "/gear/h/gear_h_005.png", 1, 400, NULL, (SELECT uuid FROM brand WHERE name = "ヤコ"), (SELECT uuid FROM power WHERE name = "防御力アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("スプラッシュゴーグル", "/gear/h/gear_h_006.png", 2, 2800, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "防御力アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("チャリキング帽", "/gear/h/gear_h_007.png", 2, 2400, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "防御力アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("パワードマスク", "/gear/h/gear_h_008.png", 2, NULL, "amiibo:イカボス1クリア報酬(非売品)", (SELECT uuid FROM brand WHERE name = "amiibo"), (SELECT uuid FROM power WHERE name = "防御力アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ショートビーニー", "/gear/h/gear_h_009.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（メイン）"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("スゲ", "/gear/h/gear_h_010.png", 2, 2500, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（メイン）"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("スタジオヘッドホン", "/gear/h/gear_h_011.png", 2, 2800, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（メイン）"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("サファリハット", "/gear/h/gear_h_012.png", 3, 9000, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "インク効率アップ（メイン）"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("エイズリーバンダナ", "/gear/h/gear_h_013.png", 1, 750, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "インク効率アップ（サブ）"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("ビバレッジキャップ", "/gear/h/gear_h_014.png", 1, 600, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "インク効率アップ（サブ）"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ランニングバンド", "/gear/h/gear_h_015.png", 1, 400, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（サブ）"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("オーロラヘッドホン", "/gear/h/gear_h_016.png", 2, 8800, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（サブ）"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("フグベルハット", "/gear/h/gear_h_017.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ヘッドバンド ホワイト", "/gear/h/gear_h_018.png", 1, NULL, "初期装備", (SELECT uuid FROM brand WHERE name = "バトロイカ"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("トレジャーメット", "/gear/h/gear_h_019.png", 2, 3000, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("サイクルメット", "/gear/h/gear_h_020.png", 3, 11000, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("キャディ サンバイザー", "/gear/h/gear_h_021.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "ヒト移動速度アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ヒーローヘッズ レプリカ", "/gear/h/gear_h_022.png", 2, NULL, "ヒーローモードクリア報酬(非売品)", (SELECT uuid FROM brand WHERE name = "アタリメイド"), (SELECT uuid FROM power WHERE name = "ヒト移動速度アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("テンタクルズメット", "/gear/h/gear_h_023.png", 3, 11000, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "ヒト移動速度アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("キャンプキャップ", "/gear/h/gear_h_024.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "イカダッシュ速度アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカパッチン", "/gear/h/gear_h_025.png", 2, NULL, "amiibo:ガールボス1クリア報酬(非売品)", (SELECT uuid FROM brand WHERE name = "amiibo"), (SELECT uuid FROM power WHERE name = "イカダッシュ速度アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("カモメッシュ", "/gear/h/gear_h_026.png", 2, 2500, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "イカダッシュ速度アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ナイトビジョン", "/gear/h/gear_h_027.png", 3, 9800, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "イカダッシュ速度アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ヤキフグ サンバイザー", "/gear/h/gear_h_028.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "スペシャル増加量アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカベーダーキャップ", "/gear/h/gear_h_029.png", 2, 2300, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "スペシャル増加量アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ダテコンタクト", "/gear/h/gear_h_030.png", 2, 3000, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "スペシャル増加量アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("キャンプハット", "/gear/h/gear_h_031.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "スペシャル時間延長"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカンカン クラシック", "/gear/h/gear_h_032.png", 2, 1500, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "スペシャル時間延長"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("アローバンド ホワイト", "/gear/h/gear_h_033.png", 3, NULL, "非売品(ランク25入手)", (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "スペシャル時間延長"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("クロブチ レトロ", "/gear/h/gear_h_034.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "復活時間短縮"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("バックワードキャップ", "/gear/h/gear_h_035.png", 1, 9800, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "復活時間短縮"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イヤーマフ", "/gear/h/gear_h_036.png", 2, 2800, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "復活時間短縮"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("2ラインメッシュ", "/gear/h/gear_h_037.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ジェットキャップ", "/gear/h/gear_h_038.png", 1, 600, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカスカルマスク", "/gear/h/gear_h_039.png", 2, 1550, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("スケボーメット", "/gear/h/gear_h_040.png", 2, 2200, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカンカン", "/gear/h/gear_h_041.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("エゾッコメッシュ", "/gear/h/gear_h_042.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("マルベッコー", "/gear/h/gear_h_043.png", 1, 600, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("ボンボンニット", "/gear/h/gear_h_044.png", 2, 1500, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ウーニーズBBキャップ", "/gear/h/gear_h_045.png", 1, 600, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("テッカサイクルキャップ", "/gear/h/gear_h_046.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("サンサンサンバイザー", "/gear/h/gear_h_047.png", 2, 2600, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("タコゾネススコープ", "/gear/h/gear_h_048.png", 2, 11000, NULL, (SELECT uuid FROM brand WHERE name = "アタリメイド"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("パイロットゴーグル", "/gear/h/gear_h_049.png", 3, 300, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("バスケバンド", "/gear/h/gear_h_050.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "スタートダッシュ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカ娘ずきん", "/gear/h/gear_h_051.png", 2, 1600, NULL, (SELECT uuid FROM brand WHERE name = "侵略！イカ娘"), (SELECT uuid FROM power WHERE name = "スタートダッシュ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ボーダービーニー", "/gear/h/gear_h_052.png", 2, 2000, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "スタートダッシュ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("チドリキャップ", "/gear/h/gear_h_053.png", 3, 8500, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "スタートダッシュ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("モンゴウベレー", "/gear/h/gear_h_054.png", 3, 9700, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "スタートダッシュ"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("イロメガネ", "/gear/h/gear_h_055.png", 1, 350, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "ラストスパート"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ロブスターブーニー", "/gear/h/gear_h_056.png", 2, 2300, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "ラストスパート"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("オクタグラス", "/gear/h/gear_h_057.png", 3, 2500, NULL, (SELECT uuid FROM brand WHERE name = "ホッコリー"), (SELECT uuid FROM power WHERE name = "ラストスパート"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("タレサン18K", "/gear/h/gear_h_058.png", 3, 2000, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "ラストスパート"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("バイザーメット", "/gear/h/gear_h_059.png", 3, 10000, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "ラストスパート"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ウインターボンボン", "/gear/h/gear_h_060.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "逆境強化"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("アローバンド ブラック", "/gear/h/gear_h_061.png", 2, 8000, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "逆境強化"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("アーマーメット　レプリカ", "/gear/h/gear_h_062.png", 3, 2800, NULL, (SELECT uuid FROM brand WHERE name = "アタリメイド"), (SELECT uuid FROM power WHERE name = "逆境強化"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("サッカーバンド", "/gear/h/gear_h_063.png", 3, 8000, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "逆境強化"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("タコマスク", "/gear/h/gear_h_064.png", 3, 12000, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "逆境強化"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("テニスバンド", "/gear/h/gear_h_065.png", 1, 300, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "カムバック"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("5パネルキャップ", "/gear/h/gear_h_066.png", 2, 2000, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "カムバック"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("タイショウのはちまき", "/gear/h/gear_h_067.png", 2, 1600, NULL, (SELECT uuid FROM brand WHERE name = "ファミ通"), (SELECT uuid FROM power WHERE name = "カムバック"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("イカノルディック", "/gear/h/gear_h_068.png", 3, 9500, NULL, (SELECT uuid FROM brand WHERE name = "ホタックス"), (SELECT uuid FROM power WHERE name = "カムバック"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("フェイスゴーグル", "/gear/h/gear_h_069.png", 3, 10000, NULL, (SELECT uuid FROM brand WHERE name = "フォーリマ"), (SELECT uuid FROM power WHERE name = "カムバック"), (SELECT uuid FROM type WHERE name = "アタマ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("シアンビーンズ", "/gear/s/gear_s_001.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "攻撃力アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("レイニーシャボン", "/gear/s/gear_s_002.png", 1, 450, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "攻撃力アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("アケビコンフォート", "/gear/s/gear_s_003.png", 2, 2000, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "攻撃力アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカヤキチップ", "/gear/s/gear_s_004.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "防御力アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("グリッチョ ブルー", "/gear/s/gear_s_005.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "防御力アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("スリッポン チドリ", "/gear/s/gear_s_006.png", 2, 1500, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "防御力アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("オレンジアローズ", "/gear/s/gear_s_007.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "ヤコ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（メイン）"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("シーホースHi レッド", "/gear/s/gear_s_008.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "インク効率アップ（メイン）"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("パワードレッグス", "/gear/s/gear_s_009.png", 2, NULL, "amiibo:イカボス3クリア報酬(非売品)", (SELECT uuid FROM brand WHERE name = "amiibo"), (SELECT uuid FROM power WHERE name = "インク効率アップ（メイン）"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("アーマーブーツ レプリカ", "/gear/s/gear_s_010.png", 3, NULL, "非売品(ランク35入手)", (SELECT uuid FROM brand WHERE name = "アタリメイド"), (SELECT uuid FROM power WHERE name = "インク効率アップ（メイン）"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ブルーベリーコンフォート", "/gear/s/gear_s_011.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "インク効率アップ（サブ）"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("スクールローファー", "/gear/s/gear_s_012.png", 2, NULL, "amiibo:ガールボス3クリア報酬(非売品)", (SELECT uuid FROM brand WHERE name = "amiibo"), (SELECT uuid FROM power WHERE name = "インク効率アップ（サブ）"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("グリッチョ グリーン 限定版", "/gear/s/gear_s_013.png", 3, 8000, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "インク効率アップ（サブ）"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ベリベリホワイト", "/gear/s/gear_s_014.png", 3, 8700, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "インク効率アップ（サブ）"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("キャンバスHi モロヘイヤ", "/gear/s/gear_s_015.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("シーホース ホワイト", "/gear/s/gear_s_016.png", 1, 600, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ジョーズモカシン", "/gear/s/gear_s_017.png", 1, 750, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("トレッキングライト", "/gear/s/gear_s_018.png", 2, 2800, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "インク回復力アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ウミウシパープル", "/gear/s/gear_s_019.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "ヒト移動速度アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("オイスタークロッグ", "/gear/s/gear_s_020.png", 1, 600, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "ヒト移動速度アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("レイニーアセロラ", "/gear/s/gear_s_021.png", 1, 600, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "ヒト移動速度アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("シーホースHi ゴールド", "/gear/s/gear_s_022.png", 2, 3000, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "ヒト移動速度アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("タイショウのげた", "/gear/s/gear_s_023.png", 2, 1700, NULL, (SELECT uuid FROM brand WHERE name = "ファミ通"), (SELECT uuid FROM power WHERE name = "ヒト移動速度アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("グリッチョ オレンジ", "/gear/s/gear_s_024.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "エゾッコ"), (SELECT uuid FROM power WHERE name = "イカダッシュ速度アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ラバーソール ホワイト", "/gear/s/gear_s_025.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "イカダッシュ速度アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカ娘シューズ", "/gear/s/gear_s_026.png", 2, 1700, NULL, (SELECT uuid FROM brand WHERE name = "侵略！イカ娘"), (SELECT uuid FROM power WHERE name = "イカダッシュ速度アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("シーホース ブラックレザー", "/gear/s/gear_s_027.png", 2, 2000, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "イカダッシュ速度アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ウミウシブルー", "/gear/s/gear_s_028.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "スペシャル増加量アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("キャンバス クマノミ", "/gear/s/gear_s_029.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "スペシャル増加量アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("シーホースHi ゾンビ", "/gear/s/gear_s_030.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "スペシャル増加量アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ラバーソール ターコイズ", "/gear/s/gear_s_031.png", 2, 2800, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "スペシャル増加量アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ロッキンホワイト", "/gear/s/gear_s_032.png", 2, 2800, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "スペシャル増加量アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("シーホースHi パープル", "/gear/s/gear_s_033.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "スペシャル時間延長"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("サムライシューズ", "/gear/s/gear_s_034.png", 2, NULL, "amiibo:ボーイボス3クリア報酬(非売品)", (SELECT uuid FROM brand WHERE name = "amiibo"), (SELECT uuid FROM power WHERE name = "スペシャル時間延長"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("トレッキングカスタム", "/gear/s/gear_s_035.png", 2, 3000, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "スペシャル時間延長"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ホワイトアローズ", "/gear/s/gear_s_036.png", 2, 2500, NULL, (SELECT uuid FROM brand WHERE name = "ヤコ"), (SELECT uuid FROM power WHERE name = "スペシャル時間延長"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("イカスミチップ", "/gear/s/gear_s_037.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "復活時間短縮"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ブラックビーンズ", "/gear/s/gear_s_038.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "復活時間短縮"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("チョコクロッグ", "/gear/s/gear_s_039.png", 2, 1800, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "復活時間短縮"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("モトクロスブーツ", "/gear/s/gear_s_040.png", 2, 3000, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "復活時間短縮"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("キャンバス ホワイト", "/gear/s/gear_s_041.png", 1, NULL, "初期装備", (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("タコゾネスブーツ", "/gear/s/gear_s_042.png", 2, NULL, "ヒーローモードクリア報酬(非売品)", (SELECT uuid FROM brand WHERE name = "アタリメイド"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ロッキンイエロー", "/gear/s/gear_s_043.png", 2, 3000, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("ウミウシレッド", "/gear/s/gear_s_044.png", 3, 8000, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "スペシャル減少量ダウン"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("スリッポン レッド", "/gear/s/gear_s_045.png", 1, 300, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ヒーローキックス レプリカ", "/gear/s/gear_s_046.png", 2, NULL, "ヒーローモードクリア報酬(非売品)", (SELECT uuid FROM brand WHERE name = "アタリメイド"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ヌバックブーツ レッド", "/gear/s/gear_s_047.png", 3, 11000, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ミルキーダウンブーツ", "/gear/s/gear_s_048.png", 3, 8000, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "スーパージャンプ時間短縮"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("シャークモカシン", "/gear/s/gear_s_049.png", 1, 800, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("スリッポン ブルー", "/gear/s/gear_s_050.png", 1, 300, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ピンクビーンズ", "/gear/s/gear_s_051.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ヌバックブーツ イエロー", "/gear/s/gear_s_052.png", 2, 3000, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "ボム飛距離アップ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("キャンバス バナナ", "/gear/s/gear_s_053.png", 1, 400, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "ボムサーチ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("シーホース イエロー", "/gear/s/gear_s_054.png", 2, 1500, NULL, (SELECT uuid FROM brand WHERE name = "アイロニック"), (SELECT uuid FROM power WHERE name = "ボムサーチ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("トレッキングプロ", "/gear/s/gear_s_055.png", 3, 9800, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "ボムサーチ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ユデスパイカ", "/gear/s/gear_s_056.png", 3, 9600, NULL, (SELECT uuid FROM brand WHERE name = "ヤコ"), (SELECT uuid FROM power WHERE name = "ボムサーチ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("ロッキンチェリー", "/gear/s/gear_s_057.png", 3, 9000, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "ボムサーチ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("ウミウシイエロー", "/gear/s/gear_s_058.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "安全シューズ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ベリベリレッド", "/gear/s/gear_s_059.png", 1, 700, NULL, (SELECT uuid FROM brand WHERE name = "ジモン"), (SELECT uuid FROM power WHERE name = "安全シューズ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("キャンバスHi トマト", "/gear/s/gear_s_060.png", 2, 1800, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "安全シューズ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("レアスパイカ", "/gear/s/gear_s_061.png", 2, 2600, NULL, (SELECT uuid FROM brand WHERE name = "ヤコ"), (SELECT uuid FROM power WHERE name = "安全シューズ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("モトクロス ソリッドブルー", "/gear/s/gear_s_062.png", 3, 12000, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "安全シューズ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("キャンバスHi マッシュルーム", "/gear/s/gear_s_063.png", 1, 500, NULL, (SELECT uuid FROM brand WHERE name = "クラーゲス"), (SELECT uuid FROM power WHERE name = "ステルスジャンプ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("ラバーソール チェリー", "/gear/s/gear_s_064.png", 2, 2800, NULL, (SELECT uuid FROM brand WHERE name = "ロッケンベルグ"), (SELECT uuid FROM power WHERE name = "ステルスジャンプ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0")),
    ("レイニーモスグリーン", "/gear/s/gear_s_065.png", 2, 1600, NULL, (SELECT uuid FROM brand WHERE name = "シグレニ"), (SELECT uuid FROM power WHERE name = "ステルスジャンプ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.0.0")),
    ("アイスダウンブーツ", "/gear/s/gear_s_066.png", 3, 8200, NULL, (SELECT uuid FROM brand WHERE name = "アロメ"), (SELECT uuid FROM power WHERE name = "ステルスジャンプ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "2.3.0")),
    ("クレイジーアローズ", "/gear/s/gear_s_067.png", 3, 9000, NULL, (SELECT uuid FROM brand WHERE name = "ヤコ"), (SELECT uuid FROM power WHERE name = "ステルスジャンプ"), (SELECT uuid FROM type WHERE name = "クツ"), (SELECT uuid FROM version WHERE name = "1.0.0"));


-- ********************
-- ** CREATE VIEW
-- ********************

DROP VIEW IF EXISTS v_gear_list;
CREATE VIEW v_gear_list AS
    SELECT
        g.uuid 'uuid',
        g.name 'name',
        g.img 'img',
        g.rank 'rank',
        --IFNULL(g.price, char(45,45,10)||g.price2) 'price', -- sqliteのバージョン3.7.7.1だとcharが非対応... char()は3.7.16で搭載された。https://www.sqlite.org/releaselog/3_7_16.html
        IFNULL(g.price, g.price2) 'price',
        b.name 'brand',
        b.img 'brand_img',
        p.name 'power',
        p.img 'power_img',
        IFNULL(p2.name, '--') 'easy_power',
        IFNULL(p2.img, '') 'easy_power_img',
        IFNULL(p3.name, '--') 'difficulty_power',
        IFNULL(p3.img, '') 'difficulty_power_img',
        t.name 'type',
        v.name 'version'
    FROM
        gear g
        INNER JOIN brand b ON g.brand_uuid = b.uuid
        INNER JOIN power p ON g.power_uuid = p.uuid
        INNER JOIN type t ON g.type_uuid = t.uuid
        INNER JOIN version v ON g.version_uuid = v.uuid
        LEFT JOIN power p2 ON b.easyadd_power_uuid = p2.uuid
        LEFT JOIN power p3 ON b.difficultyadd_power_uuid = p3.uuid
;

DROP VIEW IF EXISTS v_version_list;
CREATE VIEW v_version_list AS
    SELECT
        v.uuid 'uuid',
        v.name 'name'
    FROM
        version v
;

DROP VIEW IF EXISTS v_type_list;
CREATE VIEW v_type_list AS
    SELECT
        t.uuid 'uuid',
        t.name 'name'
    FROM
        type t
;

DROP VIEW IF EXISTS v_power_list;
CREATE VIEW v_power_list AS
    SELECT
        p.uuid 'uuid',
        p.name 'name',
        p.img 'img'
    FROM
        power p
;

DROP VIEW IF EXISTS v_brand_list;
CREATE VIEW v_brand_list AS
    SELECT
        b.uuid 'uuid',
        b.name 'name',
        b.img 'img',
        IFNULL(p1.name, '') 'easy_power',
        IFNULL(p1.img, '') 'easy_power_img',
        IFNULL(p2.name, '') 'difficulty_power',
        IFNULL(p2.img, '') 'difficulty_power_img'
    FROM
        brand b
        LEFT JOIN power p1 ON b.easyadd_power_uuid = p1.uuid
        LEFT JOIN power p2 ON b.difficultyadd_power_uuid = p2.uuid
;

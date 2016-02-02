<?php
/**
 * IndexController.php.
 *
 * @package IkaGear\controller
 */
namespace IkaGear\controller;

use IkaGear\IkaGear;
use IkaGear\model\IndexModel;

/**
 * IndexController.
 */
class IndexController extends BaseController
{
    /** @var Array 検索パラメータ */
    private $_searchParams = null;

    /** @var Array ソートパラメータ */
    private $_sortParams = null;

    /**
     * init.
     */
    public function __construct()
    {
        try {
            IkaGear::logger(__CLASS__);
            $model = new IndexModel();

            $typeList = $model->getTypeList();
            $brandList = $model->getBrandList();
            $powerList = $model->getPowerList();
            $versionList = $model->getVersionList();
            $gearList = $model->searchGearList($this->searchParams(), $this->sortParams());

            $this->smarty()->assign([
                'sp' => $this->searchParams(),
                'sort' => $this->sortParams(),
                'types' => $typeList,
                'brands' => $brandList,
                'powers' => $powerList,
                'versions' => $versionList,
                'gears' => $gearList,
            ])->display('index/index.tpl');
        } catch (\Exception $e) {
            $this->catchException($e);
        }
    }

    /**
     * 検索パラメータ整形.
     */
    private function searchParams()
    {
        if (is_null($this->_searchParams)) {
            $this->_searchParams = [
                'name' => $this->getGetParamString('search__name'),
                'type' => $this->getGetParamString('search__type') ,
                'brand' => $this->getGetParamString('search__brand'),
                'mainPower' => $this->getGetParamString('search__mainPower'),
                'rank' => $this->getGetParamString('search__rank'),
                'version' => $this->getGetParamArray('search__version'),
                'viewchange' => $this->getGetParamString('viewchange', 'all'),
            ];
        }

        return $this->_searchParams;
    }

    /**
     * ソートパラメータ整形.
     */
    private function sortParams()
    {
        if (is_null($this->_sortParams)) {
            $this->_sortParams = [
                'name' => $this->getGetParamString('sort__name'),
                'order' => $this->getGetParamString('sort__order'),
            ];
        }

        return $this->_sortParams;
    }

     /**
      * GETパラメータ取得(String).
      *
      * @param String $key キー名
      * @param String $default デフォルト値
      *
      * @return String 値が取得できた場合はその値 || 取得できないかつデフォルト指定ありの場合は指定されたデフォルト値 || 取得できないかつデフォルト指定無しの場合は空文字
      */
     private function getGetParamString($key, $default = '')
     {
         return filter_input(INPUT_GET, $key) ?: $default;
     }

     /**
      * GETパラメータ取得(Array).
      *
      * @param String $key キー名
      *
      * @return String 値が取得できた場合はその値 || 取得できない場合は空配列
      */
     private function getGetParamArray($key)
     {
         return array_filter(filter_input(INPUT_GET, $key, FILTER_DEFAULT, FILTER_REQUIRE_ARRAY + FILTER_FORCE_ARRAY) ?: []);
     }
}

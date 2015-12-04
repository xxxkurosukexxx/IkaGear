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
            $gearList = $model->searchGearList($this->searchParams(),$this->sortParams());

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
                'name' => filter_input(INPUT_GET, 'search__name') ?: '',
                'type' => filter_input(INPUT_GET, 'search__type') ?: '',
                'brand' => filter_input(INPUT_GET, 'search__brand') ?: '',
                'mainPower' => filter_input(INPUT_GET, 'search__mainPower') ?: '',
                'rank' => filter_input(INPUT_GET, 'search__rank') ?: '',
                'version' => array_filter(filter_input(INPUT_GET, 'search__version', FILTER_DEFAULT, FILTER_REQUIRE_ARRAY + FILTER_FORCE_ARRAY) ?: []),
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
                'name' => filter_input(INPUT_GET, 'sort__name') ?: '',
                'order' => filter_input(INPUT_GET, 'sort__order') ?: '',
            ];
        }

        return $this->_sortParams;
    }
}

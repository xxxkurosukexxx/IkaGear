<?php
/**
 * IndexModel.php.
 *
 * @package IkaGear\model
 */
namespace IkaGear\model;

use IkaGear\IkaGear;
use IkaGear\model\object\GearObject;

/**
 * IndexModel.
 */
class IndexModel extends BaseModel
{
    /**
     * init.
     */
    public function __construct()
    {
        //print_r($this->getGearList());
    }

    /**
     * ギア検索.
     *
     * @param Array $searchParams 検索条件の配列
     * @param Array $sortParams   ソート条件の配列
     *
     * @return 検索結果
     *
     * @todo 検索条件、ソート条件、検索結果をそれぞれオブジェクト化する？
     */
    public function searchGearList($searchParams, $sortParams)
    {
        $sql = 'SELECT * FROM v_gear_list';
        $sqlWhere = [];
        $sqlParams = [];
        if (!empty($searchParams)) {
            if (isset($searchParams['name']) && !empty($searchParams['name'])) {
                $sqlWhere[] = 'name like ?';
                $sqlParams[] = '%'.addcslashes($searchParams['name'], '\_%').'%';
            }
            if (isset($searchParams['type']) && !empty($searchParams['type'])) {
                $sqlWhere[] = 'type = ?';
                $sqlParams[] = $searchParams['type'];
            }
            if (isset($searchParams['brand']) && !empty($searchParams['brand'])) {
                $sqlWhere[] = 'brand = ?';
                $sqlParams[] = $searchParams['brand'];
            }
            if (isset($searchParams['mainPower']) && !empty($searchParams['mainPower'])) {
                $sqlWhere[] = 'power = ?';
                $sqlParams[] = $searchParams['mainPower'];
            }
            if (isset($searchParams['rank']) && !empty($searchParams['rank'])) {
                $sqlWhere[] = 'rank = ?';
                $sqlParams[] = $searchParams['rank'];
            }
            if (isset($searchParams['version']) && !empty($searchParams['version'])) {
                foreach ($searchParams['version'] as $sv) {
                    $_in[] = '?';
                    $sqlParams[] = $sv;
                }
                $sqlWhere[] = 'version IN ('.implode(', ', $_in).')';
            }
            if (!empty($sqlWhere)) {
                $sql .= ' WHERE '.implode(' AND ', $sqlWhere);
            }
        }
        if (!empty($sortParams) && isset($sortParams['name']) && isset($sortParams['order'])) {
            $sql .= ' ORDER BY '.$this->getOrderKey($sortParams['name']).' '.$sortParams['order'];
        }

        IkaGear::logger()->debug([
            'sql' => $sql,
            'params' => $sqlParams,
        ]);
        $stmt = $this->db()->prepare($sql);
        $stmt->execute($sqlParams);
        $stmt->setFetchMode(\PDO::FETCH_CLASS | \PDO::FETCH_PROPS_LATE, '\IkaGear\model\object\GearObject');

        return $stmt->fetchAll();
    }

    /**
     * コントローラーから渡ってきたソートキー文字列をSQL用に変換する.
     *
     * @param String $sortName ソートキー文字列
     *
     * @return String SQL用ソートキー文字列
     */
    private function getOrderKey($sortName)
    {
        if ($sortName == 'sort__name') {
            return 'name';
        } elseif ($sortName == 'sort__brand') {
            return 'brand';
        } elseif ($sortName == 'sort__mainPower') {
            return 'power';
        } elseif ($sortName == 'sort__easyPower') {
            return 'easy_power';
        } elseif ($sortName == 'sort__difficultyPower') {
            return 'difficulty_power';
        } elseif ($sortName == 'sort__rank') {
            return 'rank';
        } elseif ($sortName == 'sort__price') {
            return 'price';
        } elseif ($sortName == 'sort__version') {
            return 'version';
        } else {
            return 'null';
        }
    }
}

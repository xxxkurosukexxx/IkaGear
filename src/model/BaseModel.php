<?php
/**
 * BaseModel.php.
 *
 * @package IkaGear\model
 */
namespace IkaGear\model;

use IkaGear\IkaGear;
use IkaGear\model\object\BrandObject;
use IkaGear\model\object\GearObject;
use IkaGear\model\object\PowerObject;
use IkaGear\model\object\TypeObject;
use IkaGear\model\object\VersionObject;

/**
 * BaseModel.
 */
class BaseModel
{
    /** @var Object PDOObject */
    private $db = null;

    /**
     * init.
     */
    public function __construct()
    {
    }

    /**
     * init PDO Object.
     *
     * @return Object PDO Object
     */
    public function db()
    {
        if (is_null($this->db)) {
            IkaGear::logger()->info('DB connecting.');
            $this->db = new \PDO(
                'sqlite:'.__DIR__.'/Ika.db',
                null,
                null,
                [
                    \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_CLASS,
                    \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                    \PDO::ATTR_EMULATE_PREPARES => false,
                ]
            );
            //debug用
            //IkaGear::logger()->debug($this->db->query('SELECT sqlite_version()')->fetchAll());
        }

        return $this->db;
    }

    /**
     * get gear list.
     *
     * @return Array gears
     */
    public function getGearList()
    {
        return $this->_getFromList('v_gear_list', 'GearObject');
    }

    /**
     * get brand list.
     *
     * @return Array brands
     */
    public function getBrandList()
    {
        return $this->_getFromList('v_brand_list', 'BrandObject');
    }

    /**
     * get power list.
     *
     * @return Array powers
     */
    public function getPowerList()
    {
        return $this->_getFromList('v_power_list', 'PowerObject');
    }

    /**
     * get type list.
     *
     * @return Array types
     */
    public function getTypeList()
    {
        return $this->_getFromList('v_type_list', 'TypeObject');
    }

    /**
     * get version list.
     *
     * @return Array versions
     */
    public function getVersionList()
    {
        return $this->_getFromList('v_version_list', 'VersionObject');
    }

     /**
      * viewを指定してデータを取得する.
      *
      * @param String $viewName view名
      * @param String $objectClassName object class名
      *
      * @return Array 結果
      */
     private function _getFromList($viewName, $objectClassName)
     {
         $stmt = $this->db()->prepare('SELECT * FROM '.$viewName);
         $stmt->setFetchMode(\PDO::FETCH_CLASS | \PDO::FETCH_PROPS_LATE, '\IkaGear\model\object\\'.$objectClassName);
         $stmt->execute();

         return $stmt->fetchAll();
     }
}

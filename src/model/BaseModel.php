<?php
/**
 * BaseModel.php.
 *
 * @package IkaGear\model
 */
namespace IkaGear\model;

use IkaGear\IkaGear;

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
                    \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
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
        return $this->db()->query('SELECT * FROM v_gear_list')->fetchAll();
    }

    /**
     * get brand list.
     *
     * @return Array brands
     */
    public function getBrandList()
    {
        return $this->db()->query('SELECT * FROM v_brand_list')->fetchAll();
    }

    /**
     * get power list.
     *
     * @return Array powers
     */
    public function getPowerList()
    {
        return $this->db()->query('SELECT * FROM v_power_list')->fetchAll();
    }

    /**
     * get type list.
     *
     * @return Array types
     */
    public function getTypeList()
    {
        return $this->db()->query('SELECT * FROM v_type_list')->fetchAll();
    }

    /**
     * get version list.
     *
     * @return Array versions
     */
    public function getVersionList()
    {
        return $this->db()->query('SELECT * FROM v_version_list')->fetchAll();
    }
}

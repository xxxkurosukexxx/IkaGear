<?php
/**
 * IkaGear.php.
 *
 * @package IkaGear
 */
namespace IkaGear;

use IkaGear\system\logger;

/**
 * IkaGear.
 */
class IkaGear
{
    /** @var Object ロガー */
    private static $_logger = null;

    /**
     *init.
     */
    public function __construct()
    {
    }

    /**
     * ロガー.
     *
     * @param String $class 記録元のClass名
     *
     * @return Object ロガーオブジェクト
     */
    public static function logger($class = __CLASS__)
    {
        if (is_null(self::$_logger)) {
            self::$_logger = new logger($class);
        }

        return self::$_logger->logger();
    }
}

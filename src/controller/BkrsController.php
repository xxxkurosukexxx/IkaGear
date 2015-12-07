<?php
/**
 * BkrsController.php.
 *
 * @package IkaGear\controller
 */
namespace IkaGear\controller;

use IkaGear\IkaGear;

/**
 * BkrsController.
 */
class BkrsController extends BaseController
{
    /**
     * init.
     */
    public function __construct()
    {
        try {
            IkaGear::logger(__CLASS__);

            $this->smarty()->assign([
            ])->display('bkrs/bkrs.tpl');
        } catch (\Exception $e) {
            $this->catchException($e);
        }
    }
}

<?php
/**
 * AboutController.php.
 *
 * @package IkaGear\controller
 */
namespace IkaGear\controller;

use IkaGear\IkaGear;

/**
 * AboutController.
 */
class AboutController extends BaseController
{
    /**
     * init.
     */
    public function __construct()
    {
        try {
            IkaGear::logger(__CLASS__);

            $this->smarty()->assign([
            ])->display('about/about.tpl');
        } catch (\Exception $e) {
            $this->catchException($e);
        }
    }
}

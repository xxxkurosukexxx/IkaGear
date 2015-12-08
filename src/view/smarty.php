<?php
/**
 * smarty.php.
 *
 * @package IkaGear\view
 */
namespace IkaGear\view;

/**
 * smarty.
 */
class smarty extends \Smarty
{
    /** @var Object Smarty */
    private $smarty = null;

    /**
     * init.
     */
    public function __construct()
    {
        if (is_null($this->smarty)) {
            $this->smarty = new \Smarty();
            $this->smarty->template_dir = __DIR__.'/Smarty/templates/';
            $this->smarty->compile_dir = __DIR__.'/Smarty/templates_c/';
            $this->smarty->config_dir = __DIR__.'/Smarty/config/';
            $this->smarty->cache_dir = __DIR__.'/Smarty/cache/';

            $this->smarty->default_modifiers = ['escape:"html"', 'nl2br'];
            $this->smarty->configLoad('commonParams.conf');
        }
    }

    /**
     * Smarty.
     *
     * @return Object Smarty;
     */
    public function smarty()
    {
        return $this->smarty;
    }
}

<?php
/**
 * BaseController.php.
 *
 * @package IkaGear\controller
 */
namespace IkaGear\controller;

use IkaGear\IkaGear;
use IkaGear\view\smarty;

/**
 * BaseController.
 */
class BaseController
{
    /** @var Object Smarty */
    private $smarty = null;

    /**
     * init.
     */
    public function __construct()
    {
    }

    /**
     * Smarty.
     *
     * @return Object Smarty
     */
    public function smarty()
    {
        if (is_null($this->smarty)) {
            $this->smarty = new smarty();
        }

        return $this->smarty->smarty();
    }

    /**
     * 各ControllerでExceptionをcatchした時に呼び出す共通処理.
     *
     * @param \Exception $e catchしたException
     */
    public function catchException(\Exception $e)
    {
        $this->errorLog($e);
        $this->smarty()->assign([
            'errorMessage' => $e->getMessage(),
        ])->display('common/error.tpl');
    }

    /**
     * 各ControllerでcatchしたExceptionのログを出力する.
     *
     * @param \Exception $e catchしたException
     */
    private function errorLog(\Exception $e)
    {
        $_message = $e->getMessage();
        $_file = $e->getFile();

        if (stripos($_message, 'log4php') !== false || stripos(basename($_file), 'logger.php') !== false) {
            // おそらくロガーの初期化に失敗しているので標準エラーにログを出力する。
            error_log('!!!エラー発生!!!');
            error_log($e);
        } else {
            // おそらくロガーは存在するのでロガーを経由する
            IkaGear::logger()->fatal('!!!エラー発生!!!');
            IkaGear::logger()->fatal($e);
        }
    }
}

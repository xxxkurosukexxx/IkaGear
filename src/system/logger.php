<?php
/**
 * logger.php.
 *
 * @package IkaGear\system
 */
namespace IkaGear\system;

/**
 * logger.
 */
class logger
{
    /** @var Object Logger */
    private $logger = null;

    /**
     * init.
     *
     * @param String $class 呼び出し元クラス名
     */
    public function __construct($class = __CLASS__)
    {
        if (is_null($this->logger)) {
            $_file = __DIR__.'/log4php.xml';
            if (!is_file($_file)) {
                throw new RuntimeException('NotFound:log4php.xml');
            }
            \Logger::configure($_file);
            $this->logger = \Logger::getLogger($class);
        }

        $this->logger->info('---------- ログ開始 -----');
    }

    /**
     * logger.
     *
     * @return Object Logger
     */
    public function logger()
    {
        return $this->logger;
    }

    /**
     * finish.
     */
    public function __destruct()
    {
        $this->logger->info('---------- ログ終了 -----');
    }
}

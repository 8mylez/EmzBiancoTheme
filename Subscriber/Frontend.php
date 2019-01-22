<?php

namespace EmzBiancoTheme\Subscriber;

use Enlight\Event\SubscriberInterface;
use EmzBiancoTheme\Bundle\StoreFrontBundle\ListProductService;
use Doctrine\Common\Collections\ArrayCollection;

class Frontend implements SubscriberInterface
{
    public static function getSubscribedEvents()
    {
      return [
        'Enlight_Bootstrap_AfterInitResource_shopware_storefront.list_product_service' => 'registerListProductService'
      ];
    }

    public function registerListProductService(\Enlight_Event_EventArgs $args)
    {
      Shopware()->Container()->set(
        'shopware_storefront.list_product_service',
        new ListProductService(
          Shopware()->Container()->get('shopware_storefront.list_product_service'),
          Shopware()->Container()->get('shopware_media.media_service')
          )
        );
    }
}
?>

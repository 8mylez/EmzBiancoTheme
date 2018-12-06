<?php

namespace EmzBiancoTheme\Subscriber;

use Enlight\Event\SubscriberInterface;
use Shopware\Components\Theme\LessDefinition;

class Emotion implements SubscriberInterface
{
  public static function getSubscribedEvents()
  {
    return [
      'Enlight_Controller_Action_PostDispatchSecure_Widgets_Emotion' => 'extendsEmotionTemplates',
      'Theme_Compiler_Collect_Plugin_Less' => 'onCollectLessFiles'
    ];
  }

  public function extendsEmotionTemplates(\Enlight_Event_EventArgs $args)
  {
    $controller = $args->getSubject();
    $view = $controller->View();

    $view->addTemplateDir(__DIR__ . '/../Resources/Views/emotion_components');
  }

  public function onCollectLessFiles()
  {
    return new LessDefinition(
      [],
      [__DIR__ . '/../Resources/Views/frontend/_public/src/less/all.less',]
    );
  }
}

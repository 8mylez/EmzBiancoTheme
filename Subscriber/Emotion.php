<?php

namespace EmzBiancoTheme\Subscriber;

use Enlight\Event\SubscriberInterface;

class Emotion implements SubscriberInterface
{
    /**
     * @var string
     */
    private $pluginDirectory;

    /**
     * @param $pluginDirectory
     */
    public function __construct($pluginDirectory)
    {
        $this->pluginDirectory = $pluginDirectory;
    }

    public static function getSubscribedEvents()
    {
        return [
            'Enlight_Controller_Action_PostDispatchSecure_Backend_Emotion' => 'onPostDispatchBackendEmotion',
            'Shopware_Controllers_Widgets_Emotion_AddElement' => 'onEmotionAddElement'
        ];
    }

    public function onPostDispatchBackendEmotion(\Enlight_Event_EventArgs $args)
    {
        $view = $args->getSubject()->View();
        $view->addTemplateDir($this->pluginDirectory . '/Resources/Views');
        $view->extendsTemplate('backend/emotion/emz_bianco_theme/view/detail/elements/elegance_hover.js');
        $view->extendsTemplate('backend/emotion/emz_bianco_theme/view/detail/elements/classic_hover.js');
    }

    public function onEmotionAddElement(\Enlight_Event_EventArgs $args)
    {
        $data = $args->getReturn();

        if (isset($data['emzphe_image'])) {
            //get choosed background image
            $emzBackgroundImage = $data['emzphe_image'];
            //parse the url
            $emzBackgroundImagePath = substr(parse_url($emzBackgroundImage)['path'], 1);
            //get the size of the image
            $emzBackgroundImageRes = getimagesize($emzBackgroundImagePath);
            //assign values to designated variables - back to data
            $data['emzphe_image_hdw'] = $emzBackgroundImageRes[1] / $emzBackgroundImageRes[0];
        }

        return $data;
    }
}

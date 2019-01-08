<?php

namespace EmzBiancoTheme;

use Shopware\Components\Plugin\Context\InstallContext;
use Shopware\Components\Plugin\Context\UninstallContext;
use Shopware\Models\Plugin\Plugin;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Shopware\Components\Plugin\Context\UninstallContext;
use Shopware\Components\Plugin\Context\UpdateContext;


class EmzBiancoTheme extends \Shopware\Components\Plugin
{
    public function install(InstallContext $context)
    {
        $emotionComponentHandler = $this->container->get('shopware.emotion_component_installer');

        //add elegance hover component
        $emzEleganceComponent = $emotionComponentHandler->createOrUpdate(
            $this->getName(),
            'EmzPremiumHoverElegance',
            [
                'name' => '8mylez Premium Hover: Eleganz',
                'xtype' => 'emotion-components-elegance',
                'template' => 'emotion_elegance',
                'cls' => 'emotion-elegance-element',
                'description' => 'Premium Hover Effekt: Eleganz'
            ]
        );

        $emzEleganceComponent->createTextField([
            'name' => 'emzphe_text_upper',
            'fieldLabel' => 'Oberer Text',
            'defaultValue' => 'Oberer Text',
            'translatable' => true
        ]);

        $emzEleganceComponent->createTextField([
            'name' => 'emzphe_text_lower',
            'fieldLabel' => 'Unterer Text',
            'defaultValue' => 'Unterer Text',
            'translatable' => true
        ]);

        $emzEleganceComponent->createMediaField([
            'name' => 'emzphe_image',
            'fieldLabel' => 'Hintergrundbild',
            'allowBlank' => true,
            'translatable' => true
        ]);

        $emzEleganceComponent->createTextField([
            'name' => 'emzphe_url',
            'fieldLabel' => 'Url',
            'allowBlank' => true,
            'translatable' => true
        ]);

        $emzEleganceComponent->createRadioField([
            'name' => 'emzphe_url_target',
            'fieldLabel' => 'Url Ziel',
            'defaultValue' => 'newtab',
            'supportText' => 'Neuer Tab'
        ]);

        $emzEleganceComponent->createRadioField([
            'name' => 'emzphe_url_target',
            'defaultValue' => 'intern',
            'supportText' => 'intern'
        ]);

        $emzEleganceComponent->createTextField([
            'name' => 'emzphe_background_color',
            'fieldLabel' => 'Hintergrundfarbe',
            'allowBlank' => true,
            'translatable' => true
        ]);

        $emzEleganceComponent->createMediaField([
            'name' => 'emzphe_hover_image',
            'fieldLabel' => 'Hover Bild',
            'allowBlank' => true,
            'translatable' => true
        ]);

        //add classic hover component
        $emzClassicComponent = $emotionComponentHandler->createOrUpdate(
            $this->getName(),
            'EmzPremiumHoverClassic',
            [
                'name' => '8mylez Premium Hover: Classic',
                'xtype' => 'emotion-components-classic',
                'template' => 'emotion_classic',
                'cls' => 'emotion-classic-element',
                'description' => 'Premium Hover Effekt: Classic'
            ]
        );

        $emzClassicComponent->createTextField([
            'name' => 'emzphc_text_upper',
            'fieldLabel' => 'Oberer Text',
            'defaultValue' => 'Oberer Text'
        ]);

        $emzClassicComponent->createTextField([
            'name' => 'emzphc_text_lower',
            'fieldLabel' => 'Unterer Text',
            'defaultValue' => 'Unterer Text'
        ]);

        $emzClassicComponent->createMediaField([
            'name' => 'emzphc_image',
            'fieldLabel' => 'Hintergrundbild',
            'allowBlank' => true
        ]);

        $emzClassicComponent->createTextField([
            'name' => 'emzphc_url',
            'fieldLabel' => 'Url',
            'allowBlank' => true
        ]);

        $emzClassicComponent->createRadioField([
            'name' => 'emzphc_url_target',
            'fieldLabel' => 'Url Ziel',
            'defaultValue' => 'newtab',
            'supportText' => 'Neuer Tab'
        ]);

        $emzClassicComponent->createRadioField([
            'name' => 'emzphc_url_target',
            'defaultValue' => 'intern',
            'supportText' => 'intern'
        ]);

        $emzClassicComponent->createTextField([
            'name' => 'emzphc_background_color',
            'fieldLabel' => 'Hintergrundfarbe',
            'allowBlank' => true
        ]);

        $this->installShopPageGroups();
    }

    public function uninstall(UninstallContext $context)
    {
        $this->uninstallShopPageGroups();
    }

    /**
     * Installs all needed shop page groups, that are needed in the theme
     *
     * @return bool
     */
    public function installShopPageGroups()
    {
        $manager = Shopware()->Models();
        $shopPageGroups = $this->getShopPageGroupNames();

        foreach ($shopPageGroups as $shopPageGroupKey => $shopPageGroupName) {
            if ($this->checkShopPageGroupKey($shopPageGroupKey)) {
                $model = new \Shopware\Models\Site\Group();
                $model->setKey($shopPageGroupKey);
                $model->setName($shopPageGroupName);

                $manager->persist($model);
            }
        }
        return true;
    }

    /**
     * Uninstalls all shop page groups that were needed in the theme
     *
     * @return bool
     */
    public function uninstallShopPageGroups()
    {
        $manager = Shopware()->Models();
        $repository = $manager->getRepository('Shopware\Models\Site\Group');
        $shopPageGroups = $this->getShopPageGroupNames();

        foreach ($shopPageGroups as $shopPageGroupKey => $shopPageGroupName) {
            $model = $repository->findOneBy(['key' => $shopPageGroupKey]);
            if ($model !== null) {
                $manager->remove($model);
                $manager->flush();
            }
        }

        return true;
    }

    /**
     * Returns an array with the names and keys of the used shop pages groups in the theme.
     * It can be easily extended for future updates
     *
     * @return array
     */
    public function getShopPageGroupNames()
    {
        return array(
            'emzFooterFifthColumn' => 'emzFooterFifthColumn',
            'emzFooterFourthColumn' => 'emzFooterFourthColumn',
            'emzFooterNavigation' => 'emzFooterNavigation'
        );
    }

    /**
     * Checks if the group key already exits
     *
     * @param string $key
     * @return bool
     */
    public function checkShopPageGroupKey($key)
    {
        $manager = Shopware()->Models();
        $repository = $manager->getRepository('Shopware\Models\Site\Group');

        // Check if key exists
        $model = $repository->findOneBy(['key' => $key]);
        if ($model !== null) {
            return false;
        }

        return true;
    }

    /**
     * @param Plugin\Context\UninstallContext $uninstallContext
     */
    public function uninstall(UninstallContext $uninstallContext)
    {
        parent::uninstall($uninstallContext);
    }

    /**
    * @param ContainerBuilder $container
    */
    public function build(ContainerBuilder $container)
    {
        parent::build($container);
    }

    public function update(UpdateContext $context)
    {
        $version = $context->getCurrentVersion();

        parent::update($context);
    }

}

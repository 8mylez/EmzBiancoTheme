<?php

namespace EmzBiancoTheme;

use Shopware\Models\Plugin\Plugin;
use Shopware\Components\Plugin\Context\InstallContext;
use Shopware\Components\Plugin\Context\UninstallContext;
use Shopware\Models\Site\Group;

class EmzBiancoTheme extends \Shopware\Components\Plugin
{
    /**
     * @param InstallContext $context
     */
    public function install(InstallContext $context)
    {
        $this->addEmotionComponents();
        $this->addShopPageGroups();
    }

    /**
     * @param UninstallContext $context
     */
    public function uninstall(UninstallContext $context)
    {
        $this->removeShopPageGroups();
    }

    /**
     * Adds emotion components "elegance hover" and "classic hover"
     */
    public function addEmotionComponents()
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
    }

    /**
     * Adds all shop page groups, that are used in the theme
     */
    public function addShopPageGroups()
    {
        $modelManager = $this->container->get('models');
        $groupRepository = $modelManager->getRepository(Group::class);
        $shopPageGroups = $this->getShopPageGroupNames();

        foreach ($shopPageGroups as $key => $name) {
            if (!$groupRepository->findOneBy(['key' => $key])) {
                $group = new Group();
                $group->setKey($key);
                $group->setName($name);

                $modelManager->persist($group);
            }
        }
    }

    /**
     * Removes all shop page groups, that were used in the theme
     */
    public function removeShopPageGroups()
    {
        $modelManager = $this->container->get('models');
        $groupRepository = $modelManager->getRepository(Group::class);
        $shopPageGroups = $this->getShopPageGroupNames();

        foreach ($shopPageGroups as $key => $name) {
            $group = $groupRepository->findOneBy(['key' => $key]);

            if ($group !== null) {
                $modelManager->remove($group);
                $modelManager->flush();
            }
        }
    }

    /**
     * Returns an array with the names and keys of the used shop pages groups in the theme
     *
     * @return array
     */
    public function getShopPageGroupNames()
    {
        return [
            'emzFooterSecondColumn' => 'EmzBiancoTheme Footer-Spalte 2',
            'emzFooterThirdColumn' => 'EmzBiancoTheme Footer Spalte 3',
            'emzFooterFourthColumn' => 'EmzBiancoTheme Footer Spalte 4',
            'emzFooterNavigation' => 'EmzBiancoTheme Footer-Navigation'
        ];
    }
}

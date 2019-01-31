<?php

namespace EmzBiancoTheme;

use Shopware\Models\Plugin\Plugin;
use Shopware\Components\Plugin\Context\InstallContext;
use Shopware\Components\Plugin\Context\UninstallContext;
use Shopware\Components\Plugin\Context\UpdateContext;
use Shopware\Models\Site\Group;
use Shopware\Models\Media\Album;

class EmzBiancoTheme extends \Shopware\Components\Plugin
{
    /**
     * @param InstallContext $context
     */
    public function install(InstallContext $context)
    {
        $this->buildAttribute();

        $this->addShopPageGroups();
        $this->addArticleAlbumThumbnailSizes();

        parent::install($context);
    }

    /**
     * @param UninstallContext $context
     */
    public function uninstall(UninstallContext $context)
    {
        $this->deleteAttribute();

        $this->removeShopPageGroups();
        $this->removeArticleAlbumThumbnailSizes();

        parent::uninstall($context);
    }

    /**
     * @param UpdateContext $context
     */
    public function update(UpdateContext $context) {

        $this->buildAttribute();

        parent::update($context);
    }

    public function buildAttribute() {
        $service = $this->container->get('shopware_attribute.crud_service');

        $service->update('s_articles_attributes', 'emz_hover_image', 'single_selection', [
        'entity' => \Shopware\Models\Media\Media::class,
        'label' => 'Bild beim Hovern',
        'displayInBackend' => true,
        'helpText' => 'Das Bild, welches beim Hovern im Listing angezeigt wird.',
        'position' => 0,
        'custom' => false,
        ]);

        $service->update('s_articles_attributes', 'emz_hover_image_standby', 'boolean', [
        'entity' => \Shopware\Models\Media\Media::class,
        'label' => 'Zweites Artikelbild für Hover nutzen',
        'defaultValue' => true,
        'displayInBackend' => true,
        'helpText' => 'Falls kein spezifisches Hover Bild ausgewählt wird, wird das zweite Artikelbild genutzt.',
        'position' => 0,
        'custom' => false,
        ],null,false,true);

        $this->rebuildModel();
    }

    public function rebuildModel() {
        $metaDataCache = Shopware()->Models()->getConfiguration()->getMetadataCacheImpl();
        $metaDataCache->deleteAll();
        Shopware()->Models()->generateAttributeModels(['s_articles_attributes']);
    }

    public function deleteAttribute() {
        $service = $this->container->get('shopware_attribute.crud_service');
        try{
        $service->delete('s_articles_attributes', 'emz_hover_image');
        }catch(\Exception $e){}

        try{
        $service->delete('s_articles_attributes', 'emz_hover_image_standby');
        }catch(\Exception $e){}

        $this->rebuildModel();

    }

    /**
     * Adds all shop page groups, that are used in the theme
     */
    public function addShopPageGroups()
    {
        /** @var ModelManager $modelManager */
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
        /** @var ModelManager $modelManager */
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

    /**
     * Adds thumbnail size used in listing
     */
    public function addArticleAlbumThumbnailSizes()
    {
        /** @var ModelManager $modelManager */
        $modelManager = $this->container->get('models');

        $albumRepository = $modelManager->getRepository(Album::class);
        $album = $albumRepository->find(Album::ALBUM_ARTICLE);

        if (!$album) {
            return;
        }

        $settings = $album->getSettings();
        $thumbnailSize = $settings->getThumbnailSize();

        $newSizes = $this->getArticleAlbumThumbnailSizes();

        foreach ($newSizes as $size) {
            if (in_array($size, $thumbnailSize)) {
                continue;
            }

            $thumbnailSize[] = $size;
        }

        $settings->setThumbnailSize($thumbnailSize);
        $modelManager->flush();
    }

    public function removeArticleAlbumThumbnailSizes()
    {
        /** @var ModelManager $modelManager */
        $modelManager = $this->container->get('models');

        $albumRepository = $modelManager->getRepository(Album::class);
        $album = $albumRepository->find(Album::ALBUM_ARTICLE);

        if (!$album) {
            return;
        }

        $settings = $album->getSettings();
        $thumbnailSize = $settings->getThumbnailSize();

        $newSizes = $this->getArticleAlbumThumbnailSizes();

        foreach ($newSizes as $size) {
            foreach ($thumbnailSize as $key => $defaultSize) {
                if ($size == $defaultSize) {
                    unset($thumbnailSize[$key]);
                }
            }
        }

        $settings->setThumbnailSize($thumbnailSize);
        $modelManager->flush();
    }

    /**
     * Returns an array with new thumbnail sizes for article album
     *
     * @return array
     */
    public function getArticleAlbumThumbnailSizes()
    {
        return [
            '270x405'
        ];
    }
}

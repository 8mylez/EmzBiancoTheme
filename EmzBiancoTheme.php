<?php

namespace EmzBiancoTheme;

use Shopware\Components\Model\ModelManager;
use Shopware\Components\Plugin\Context\InstallContext;
use Shopware\Components\Plugin\Context\UninstallContext;
use Shopware\Components\Plugin\Context\UpdateContext;
use Shopware\Models\Emotion\Library\Component;
use Shopware\Models\Plugin\Plugin;

class EmzBiancoTheme extends \Shopware\Components\Plugin
{

  public function install(InstallContext $context)
  {

    $this->buildAttribute();

    $component = $this->createEmotionComponent($context->getPlugin(), [
      'name' => 'Zwei Bilder ein Text',
      'xtype' => 'emotion-components-base',
      'template' => 'component_two_images_one_text',
      'cls' => 'two-images-one-text',
      'description' => 'Zeigt zwei Bilder mit einer Textbox an.',
    ]);

    $component->createTextField([
      'name' => 'title',
      'fieldLabel' => 'Titel',
      'allowBlank' => true
    ]);

    $component->createMediaField([
        'name' => 'left_image',
        'fieldLabel' => 'Linkes Bild',
        'valueField' => 'path'
    ]);

    $component->createMediaField([
        'name' => 'right_image',
        'fieldLabel' => 'Rechtes Bild',
        'valueField' => 'path'
    ]);

    $component->createTextField([
      'name' => 'descriptionTitle',
      'fieldLabel' => 'Beschreibung Titel',
      'allowBlank' => true
    ]);

    $component->createTextAreaField([
      'name' => 'description',
      'fieldLabel' => 'Beschreibung',
      'allowBlank' => true
    ]);

    $component->createTextField([
      'name' => 'readMoreLink',
      'fieldLabel' => 'Mehr Lesen Link',
      'allowBlank' => true
    ]);

    $component->createTextField([
      'name' => 'goShoppingLink',
      'fieldLabel' => 'Jetzt Shoppen Link',
      'allowBlank' => true
    ]);

    /** @var ModelManager $em */
    $em = $this->container->get('models');
    $em->persist($component);
    $em->flush();
  }

  public function uninstall(UninstallContext $context)
  {
    $em = $this->container->get('models');
    $component = $em->getRepository(Component::class)->findOneBy([
        'name' => 'Zwei Bilder ein Text',
        'pluginId' => $context->getPlugin()->getId()
    ]);

    if(!$component) {
      return;
    }

    $em->remove($component);
    $em->flush();
  }

  public function update(UpdateContext $context) {
    $this->buildAttribute();
  }

  /**
   * @param $options
   * @param Plugin $pluginModel
   * @return Component
   */
  protected function createEmotionComponent(Plugin $pluginModel, $options)
  {
      /** @var ModelManager $em */
      $em = $this->container->get('models');

      // if a component with this name already exists for this plugin, use that
      $component = $em->getRepository(Component::class)->findOneBy([
          'name' => $options['name'],
          'pluginId' => $pluginModel->getId()
      ]);

      // else: create a new component
      if (!$component) {
          $component = new Component();
      }

      $component->fromArray($options);

      $component->setPluginId($pluginModel->getId());
      $component->setPlugin($pluginModel);

      return $component;
  }

  public function buildAttribute()
  {
    $service = Shopware()->Container()->get('shopware_attribute.crud_service');

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

  public function rebuildModel()
  {
    $metaDataCache = Shopware()->Models()->getConfiguration()->getMetadataCacheImpl();
    $metaDataCache->deleteAll();
    Shopware()->Models()->generateAttributeModels(['s_articles_attributes']);
  }

  public function deleteAttribute()
  {
    $service = Shopware()->Container()->get('shopware_attribute.crud_service');
    try{
      $service->delete('s_articles_attributes', 'emz_hover_image');
    }catch(\Exception $e){}

    try{
      $service->delete('s_articles_attributes', 'emz_hover_image_standby');
    }catch(\Exception $e){}

    $this->rebuildModel();

  }

}

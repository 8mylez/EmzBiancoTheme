<?php

namespace EmzBiancoTheme\Bundle\StoreFrontBundle;

use Shopware\Bundle\StoreFrontBundle\Service\ListProductServiceInterface;
use Shopware\Bundle\StoreFrontBundle\Struct\ProductContextInterface;
use Shopware\Bundle\StoreFrontBundle\Struct\Attribute;
use Shopware\Bundle\StoreFrontBundle\Struct\ListProduct;
use Shopware\Bundle\MediaBundle\MediaServiceInterface;

class ListProductService implements ListProductServiceInterface
{
  private $service;

  public function __construct(ListProductServiceInterface $service)
  {
    $this->service = $service;
  }

  public function getList(array $numbers, ProductContextInterface $context)
  {
    $products = $this->service->getList($numbers, $context);

    foreach ($products as $product) {

        unset($emzHoverImageId);
        unset($checkAttribute);
        if( $product->getAttributes()['core'] ){
          $checkAttribute = $product->getAttributes()['core']->get('emz_hover_image');

          if( !empty($product->getAttributes()['core']->get('emz_hover_image')) ){

            //fetching the attributes of each product
            $emzHoverImageId = $product->getAttributes()['core']->get('emz_hover_image');
            
            $emzHoverImage = $this->getHoverImage($emzHoverImageId);

          }elseif( empty($product->getAttributes()['core']->get('emz_hover_image')) && $product->getAttributes()['core']->get('emz_hover_image_standby') == 1 ){
            $emzHoverProductId = $product->getId();
            $emzHoverImage = $this->getHoverArticleImage($emzHoverProductId);
          }else{
            continue;
          }

          //placing images to attribute
          if($emzHoverImage){
            $attribute = new Attribute();
            $product->addAttribute('emzExtendListing', $attribute);

            $attribute->set('emzHoverImage', $emzHoverImage);
          }
        }
    }
    //returning product to frontend
    return $products;
  }

  public function get($number, ProductContextInterface $context)
  {
    return array_shift($this->getList([$number],$context));
  }

  //getting the virtual path of the image
  public function getMediaPathByIdHover($mediaId)
  {
    $em = Shopware()->Container()->get('models');

    //building query for path
    $builder = $em->createQueryBuilder();
    $builder->select('media')
            ->from('\Shopware\Models\Media\Media', 'media')
            ->where('media.id = ?1')
            ->setParameter(1, $mediaId);
    $results = $builder->getQuery()->getArrayResult();

    //returning the virutal path of the image
    return $results;
  }

  //getting the virtual path of the second article image
  public function getMediaPathByIdArticle($id)
  {
    $em = Shopware()->Container()->get('models');

    //building query for path
    $builder = $em->createQueryBuilder();
    $builder->select(['images'])
            ->from('Shopware\Models\Article\Image','images')
            ->innerJoin('images.article','article')
            ->where('article.id = :articleId')
            ->orderBy('images.position', 'ASC')
            ->andWhere('images.main = :main')
            ->andWhere('images.parentId is NULL')
            ->setParameters(['articleId' => $id])
            ->setParameters(['main' => 2])
            ->setMaxResults(1);
    $results = $builder->getQuery()->getArrayResult();

    return $results;
  }

  public function getThumbnailSizes()
  {
    //fetching from config thumbnail sizes
    $config = Shopware()->Container()->get('shopware.plugin.cached_config_reader')->getByPluginName('EmzBiancoTheme');
    $thumbnail_sizes = array($config['thumbnail_size_small'],
                            $config['thumbnail_size_middle'],
                            $config['thumbnail_size_large']);

    return $thumbnail_sizes;
  }
    //getting the real path of the image
    public function getHoverImage($emzHoverImageId)
    {
      unset($emzHoverImage);
      $mediaService = Shopware()->Container()->get('shopware_media.media_service');

      //if is-gif then no thumbnail
      if( !$this->getCheckGif($emzHoverImageId) ){
        unset($emzHoverImage);
          
        //fetching from config thumbnail sizes
        $thumbnail_sizes = $this->getThumbnailSizes();
        $image = $this->getMediaPathByIdHover($emzHoverImageId);
        if (count($image) > 0){
          $emzHoverImage = array();
          $emzHoverImage[] = $mediaService->getUrl("media/image/thumbnails/{$image[0]['name']}_{$thumbnail_sizes[0]}.{$image[0]['extension']}") . ", " . $mediaService->getUrl("media/image/thumbnails/{$image[0]['name']}_{$thumbnail_sizes[0]}@2x.{$image[0]['extension']}") . " 2x";
          $emzHoverImage[] = $mediaService->getUrl("media/image/thumbnails/{$image[0]['name']}_{$thumbnail_sizes[1]}.{$image[0]['extension']}") . ", " . $mediaService->getUrl("media/image/thumbnails/{$image[0]['name']}_{$thumbnail_sizes[1]}@2x.{$image[0]['extension']}") . " 2x";
          $emzHoverImage[] = $mediaService->getUrl("media/image/thumbnails/{$image[0]['name']}_{$thumbnail_sizes[2]}.{$image[0]['extension']}") . ", " . $mediaService->getUrl("media/image/thumbnails/{$image[0]['name']}_{$thumbnail_sizes[2]}@2x.{$image[0]['extension']}") . " 2x";
        }else{
          $emzHoverImage = NULL;
        }

        //returning the real path of the image
        return $emzHoverImage;

      }else{
        $image = $this->getMediaPathByIdHover($emzHoverImageId);
        $repeat = 3;
        //placing same gif in array
        do{
          $emzHoverImage[] = $mediaService->getUrl("media/image/{$image[0]['name']}.{$image[0]['extension']}");
          $repeat--;
        }
        while($repeat>0);
      }

      //returning the real path of the image
      return $emzHoverImage;
    }

    public function getHoverArticleImage($emzHoverProductId)
    {
      unset($emzHoverImage);
      $mediaService = Shopware()->Container()->get('shopware_media.media_service');
        
      //fetching from config thumbnail sizes
      $thumbnail_sizes = $this->getThumbnailSizes();
      $image = $this->getMediaPathByIdArticle($emzHoverProductId);
      if (count($image) > 0){
        $emzHoverImage = array();
        $emzHoverImage[] = $mediaService->getUrl("media/image/thumbnails/{$image[0]['path']}_{$thumbnail_sizes[0]}.{$image[0]['extension']}") . ", " . $mediaService->getUrl("media/image/thumbnails/{$image[0]['path']}_{$thumbnail_sizes[0]}@2x.{$image[0]['extension']}") . " 2x";
        $emzHoverImage[] = $mediaService->getUrl("media/image/thumbnails/{$image[0]['path']}_{$thumbnail_sizes[1]}.{$image[0]['extension']}") . ", " . $mediaService->getUrl("media/image/thumbnails/{$image[0]['path']}_{$thumbnail_sizes[1]}@2x.{$image[0]['extension']}") . " 2x";
        $emzHoverImage[] = $mediaService->getUrl("media/image/thumbnails/{$image[0]['path']}_{$thumbnail_sizes[2]}.{$image[0]['extension']}") . ", " . $mediaService->getUrl("media/image/thumbnails/{$image[0]['path']}_{$thumbnail_sizes[2]}@2x.{$image[0]['extension']}") . " 2x";
      }else{
        $emzHoverImage = NULL;
      }

      //returning the real path of the image
      return $emzHoverImage;
    }

    //checks if isGif --> no thumbnail
    public function getCheckGif($mediaId)
    {
      $em = Shopware()->Container()->get('models');

      $builder = $em->createQueryBuilder();
      $extension = $builder->select('media.extension')
              ->from('\Shopware\Models\Media\Media', 'media')
              ->where('media.id = ?1')
              ->setParameter(1, $mediaId)
              ->getQuery()->getArrayResult();
      $extension = $extension['0']['extension'];

      //returning the virutal path of the image
      if($extension == "gif"){
        return true;
      }
      else{
        return false;
      }
    }
  }
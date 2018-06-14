<?php

namespace Shopware\Themes\BiancoTheme;

use Shopware\Components\Form as Form;

class Theme extends \Shopware\Components\Theme
{
    protected $extend = 'Responsive';

    protected $name = <<<'SHOPWARE_EOD'
Bianco Theme
SHOPWARE_EOD;

    protected $description = <<<'SHOPWARE_EOD'
Bianco Theme
SHOPWARE_EOD;

    protected $author = <<<'SHOPWARE_EOD'
8mylez.com
SHOPWARE_EOD;

    protected $license = <<<'SHOPWARE_EOD'

SHOPWARE_EOD;

    protected $css = [
        'src/css/font-awesome.min.css'
    ];

    protected $javascript = [
        'src/js/jquery.override.emz-filter-component.js',
        'src/js/jquery.override.emz-listing-actions.js',
        'src/js/jquery.override.emz-subcategory-nav.js',
        'src/js/jquery.emz-detail-read-more.js',

        'src/js/jquery.emz-bianco-theme.js'
    ];

    public function createConfig(Form\Container\TabContainer $container)
    {
      $navigationLineHeightMobileField = $this->createTextField(
        'emz-navigation-line-height-mobile',
        'Line height Mobile',
        '63'
      );

      $navigationLineHeightField = $this->createTextField(
        'emz-navigation-line-height',
        'Line height',
        '72'
      );

      $navigationLogoHeightField = $this->createTextField(
        'emz-navigation-logo-height',
        'Logo height',
        '50'
      );

      $socialMediaInstagramField = $this->createTextField(
        'emzSocialMediaInstagramLink',
        'Instragram Link',
        ''
      );

      $socialMediaFacebookField = $this->createTextField(
        'emzSocialMediaFacebookLink',
        'Facebook Link',
        ''
      );

      $socialMediaTwitterField = $this->createTextField(
        'emzSocialMediaTwitterLink',
        'Twitter Link',
        ''
      );

      $socialMediaPinterestField = $this->createTextField(
        'emzSocialMediaPinterestLink',
        'Pinterest Link',
        ''
      );

      $socialMediaYoutubeField = $this->createTextField(
        'emzSocialMediaYoutubeLink',
        'Youtube Link',
        ''
      );

      $socialMediaGooglePlusField = $this->createTextField(
        'emzSocialMediaGooglePlusLink',
        'Google+ Link',
        ''
      );

      $headerFieldSet = $this->createFieldSet(
        'emz_bianco_header_fieldset',
        'Header'
      );

      $socialMediaFieldSet = $this->createFieldSet(
        'emz_bianco_social_media_fieldset',
        'Soziale Netzwerke'
      );

      $biancoThemeTab = $this->createTab(
        'emz_bianco_theme',
        'Bianco Theme'
      );

      $headerFieldSet->addElement($navigationLineHeightMobileField);
      $headerFieldSet->addElement($navigationLineHeightField);
      $headerFieldSet->addElement($navigationLogoHeightField);

      $socialMediaFieldSet->addElement($socialMediaInstagramField);
      $socialMediaFieldSet->addElement($socialMediaFacebookField);
      $socialMediaFieldSet->addElement($socialMediaTwitterField);
      $socialMediaFieldSet->addElement($socialMediaPinterestField);
      $socialMediaFieldSet->addElement($socialMediaYoutubeField);
      $socialMediaFieldSet->addElement($socialMediaGooglePlusField);

      $biancoThemeTab->addElement($headerFieldSet);
      $biancoThemeTab->addElement($socialMediaFieldSet);

      $container->addTab($biancoThemeTab);
    }
}

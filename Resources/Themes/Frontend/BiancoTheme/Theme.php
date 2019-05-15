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
        'src/js/jquery.emz-loadOnHover.js',
        'src/js/jquery.emz-hl-responsive.js',
        'src/js/jquery.override.emz-filter-component.js',
        'src/js/jquery.override.emz-listing-actions.js',
        'src/js/jquery.override.emz-subcategory-nav.js',
        'src/js/jquery.emz-detail-read-more.js',
        'src/js/jquery.emz-bianco-theme.js',
        'src/js/jquery.search.js',
        'src/js/jquery.emzFancyShoppingCart.js'
    ];

    /**
     * @param Form\Container\TabContainer $container
     */
    public function createConfig(Form\Container\TabContainer $container)
    {

        $tab = $this->createTab(
            'emz_settings_tab',
            'Bianco Konfiguration'
        );

        $container->addTab($tab);

        $tab->addElement($this->createBottomTabPanel());
    }

    private $fieldSetDefaults = [
        'layout' => 'column',
        'height' => 170,
        'flex' => 0,
        'defaults' => ['columnWidth' => 0.5, 'labelWidth' => 180, 'margin' => '3 16 3 0'],
    ];

    /**
     * Helper function to create the main tab ("Responsive configuration").
     *
     * @return Form\Container\Tab
     */
    private function createMainConfigTab()
    {
        $tab = $this->createTab(
            'responsiveMain2',
            '__responsive_tab_header2__',
            [
                'attributes' => [
                    'layout' => 'anchor',
                    'autoScroll' => true,
                    'padding' => '0',
                    'defaults' => ['anchor' => '100%'],
                ],
            ]
        );

        $fieldSet = $this->createFieldSet(
            'bareGlobal2',
            '__global_configuration2__',
            [
                'attributes' => [
                    'padding' => '10',
                    'margin' => '5',
                    'layout' => 'anchor',
                    'defaults' => ['labelWidth' => 155, 'anchor' => '100%'],
                ],
            ]
        );

        $tab->addElement($fieldSet);

        return $tab;
    }

    /**
     * Helper function to create the child-tabs of ("Responsive colors").
     *
     * @return Form\Container\Tab
     */
    private function createBottomTabPanel()
    {
        $tabPanel = $this->createTabPanel(
            'bottom_tab_panel2',
            [
                'attributes' => [
                    'plain' => true,
                ],
            ]
        );

        $tabPanel->addTab($this->createFooterTab());
        $tabPanel->addTab($this->createHeaderTab());
        $tabPanel->addTab($this->createButtonsTab());
        $tabPanel->addTab($this->createPluginsTab());

        return $tabPanel;
    }

    /**
     * Helper function to create the tab ("Footer").
     *
     * @return Form\Container\Tab
     */
    private function createFooterTab()
    {
        $tab = $this->createTab(
            'footer_tab',
            '__footer_tab__',
            [
                'attributes' => [
                    'autoScroll' => true,
                ],
            ]
        );

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 150]);

        $column1FieldSet = $this->createFieldSet(
            'emzFooterColumn1Field_set',
            '__footer_tab_column1__',
            ['attributes' => $attributes]
        );

        $column1FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn1Headline',
                '__footer_column_headline__',
                'Letzte Saison'
            )
        );

        $column1FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn1Description',
                '__footer_column_description__',
                ''
            )
        );

        $column1FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn1Image',
                '__footer_column_image__',
                '',
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $column1FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn1Link',
                '__footer_column_link__',
                'Link',
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $column1FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn1Linktext',
                '__footer_column_linktext__',
                'Mehr entdecken'
            )
        );

        $tab->addElement($column1FieldSet);

        $column2FieldSet = $this->createFieldSet(
            'emzFooterColumn2Field_set',
            '__footer_tab_column2__',
            ['attributes' => $attributes]
        );

        $column2FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn2Headline',
                '__footer_column_headline__',
                'Kontakt'
            )
        );

        $column2FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn2Sitegroup',
                '__footer_column_sitegroup__',
                'emzFooterSecondColumn'
            )
        );

        $column2FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn2Link',
                '__footer_column_link__',
                'Link',
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $column2FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn2Linktext',
                '__footer_column_linktext__',
                'Mehr entdecken'
            )
        );

        $tab->addElement($column2FieldSet);

        $column3FieldSet = $this->createFieldSet(
            'emzFooterColumn3Field_set',
            '__footer_tab_column3__',
            ['attributes' => $attributes]
        );

        $column3FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn3Headline',
                '__footer_column_headline__',
                'Services'
            )
        );

        $column3FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn3Sitegroup',
                '__footer_column_sitegroup__',
                'emzFooterThirdColumn'
            )
        );

        $column3FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn3Link',
                '__footer_column_link__',
                'Link',
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $column3FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn3Linktext',
                '__footer_column_linktext__',
                'Mehr entdecken'
            )
        );

        $tab->addElement($column3FieldSet);

        $column4FieldSet = $this->createFieldSet(
            'emzFooterColumn4Field_set',
            '__footer_tab_column4__',
            ['attributes' => $attributes]
        );

        $column4FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn4Headline',
                '__footer_column_headline__',
                'Das Unternehmen'
            )
        );

        $column4FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn4Sitegroup',
                '__footer_column_sitegroup__',
                'emzFooterFourthColumn'
            )
        );

        $column4FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn4Link',
                '__footer_column_link__',
                'Link',
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $column4FieldSet->addElement(
            $this->createTextField(
                'emzFooterColumn4Linktext',
                '__footer_column_linktext__',
                'Mehr entdecken'
            )
        );

        $tab->addElement($column4FieldSet);

        return $tab;
    }

    /**
     * Helper function to create the tab ("Header").
     *
     * @return Form\Container\Tab
     */
    private function createHeaderTab()
    {
        $tab = $this->createTab(
            'header_tab',
            '__header_tab__',
            [
                'attributes' => [
                    'autoScroll' => true,
                ],
            ]
        );

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 120]);

        $column1FieldSet = $this->createFieldSet(
            'header_column_field_set',
            '__header_tab_column__',
            ['attributes' => $attributes]
        );

        $column1FieldSet->addElement(
            $this->createTextField(
                'emz-navigation-line-height-mobile',
                '__header_column_line_height_mobile__',
                '63'
            )
        );

        $column1FieldSet->addElement(
            $this->createTextField(
                'emz-navigation-line-height',
                '__header_column_line_height__',
                '72'
            )
        );

        $column1FieldSet->addElement(
            $this->createTextField(
                'emz-navigation-logo-height',
                '__header_column_logo_height__',
                '50'
            )
        );

        $tab->addElement($column1FieldSet);

        return $tab;
    }


    /**
     * Helper function to create the tab ("Buttons").
     *
     * @return Form\Container\Tab
     */
    private function createButtonsTab()
    {
        $tab = $this->createTab(
            'socialbuttons_tab',
            '__socialbuttons_tab__',
            [
                'attributes' => [
                    'autoScroll' => true,
                ],
            ]
        );

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 150]);

        $fieldSet1 = $this->createFieldSet(
            'socialbutton-column1Field_set',
            '__socialbuttons_tab_column__',
            ['attributes' => $attributes]
        );

        $fieldSet1->addElement(
            $this->createTextField(
                'emzSocialMediaFacebookLink',
                '__social_facebook_link__',
                '',
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $fieldSet1->addElement(
            $this->createTextField(
                'emzSocialMediaInstagramLink',
                '__social_instagram_link__',
                '',
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $fieldSet1->addElement(
            $this->createTextField(
                'emzSocialMediaTwitterLink',
                '__social_twitter_link__',
                '',
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $fieldSet1->addElement(
            $this->createTextField(
                'emzSocialMediaPinterestLink',
                '__social_pinterest_link__',
                '',
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $fieldSet1->addElement(
            $this->createTextField(
                'emzSocialMediaYoutubeLink',
                '__social_youtube_link__',
                '',
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $fieldSet1->addElement(
            $this->createTextField(
                'emzSocialMediaGooglePlusLink',
                '__social_googleplus_link__',
                '',
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $tab->addElement($fieldSet1);

        return $tab;
    }

    /**
     * Helper function to create the tab ("Plugins").
     *
     * @return Form\Container\Tab
     */
     private function createPluginsTab()
     {
         $tab = $this->createTab(
             'plugins_tab',
             '__plugins_tab__',
             [
                 'attributes' => [
                     'autoScroll' => true,
                 ],
             ]
         );

         $attributes = array_merge($this->fieldSetDefaults, ['height' => 80]);

         $fieldSet1 = $this->createFieldSet(
             'emzFancyShoppingCart_set',
             '__fancyShoppingCart_tab_column__',
             ['attributes' => $attributes]
         );

         $fieldSet1->addElement(
             $this->createTextField(
                 'emzFancyShoppingCartText',
                 '__fancyShoppingCartText__',
                 'Hinzugefügt',
                 ['attributes' => ['lessCompatible' => false]]
             )
         );

         $tab->addElement($fieldSet1);

         $fieldSet2 = $this->createFieldSet(
             'emzAboCommerce_set',
             '__aboCommerce_tab_column__',
             ['attributes' => $attributes]
         );

         $fieldSet2->addElement(
             $this->createCheckboxField(
                 'emzAboCommerce',
                 '__aboCommerce__',
                 false,
                 ['attributes' => $attributes]
             )
         );

         $tab->addElement($fieldSet2);

         return $tab;
     }
}

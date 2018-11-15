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
        'src/js/jquery.emz-bianco-theme.js',
        'src/js/jquery.search.js'
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
        // $tabPanel->addTab($this->createButtonsTab());
        // $tabPanel->addTab($this->createFormsTab());
        // $tabPanel->addTab($this->createTablesTab());

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
            'emz-footer-column1-field_set',
            '__footer_tab_column1__',
            ['attributes' => $attributes]
        );

        $column1FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column1-headline',
                '__footer_column_headline__',
                'Spalte 1'
            )
        );

        $column1FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column1-description',
                '__footer_column_description__',
                'Spalte 1'
            )
        );

        $column1FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column1-sitegroup',
                '__footer_column_sitegroup__',
                'Shopseiten Gruppe'
            )
        );

        $column1FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column1-image',
                '__footer_column_image__',
                'Bild'
            )
        );

        $column1FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column1-link',
                '__footer_column_link__',
                'Link'
            )
        );

        $column1FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column1-linktext',
                '__footer_column_linktext__',
                'Linktext'
            )
        );

        $tab->addElement($column1FieldSet);

        $column2FieldSet = $this->createFieldSet(
            'emz-footer-column2-field_set',
            '__footer_tab_column2__',
            ['attributes' => $attributes]
        );

        $column2FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column2-headline',
                '__footer_column_headline__',
                'Spalte 2'
            )
        );

        $column2FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column2-description',
                '__footer_column_description__',
                'Spalte 2'
            )
        );

        $column2FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column2-sitegroup',
                '__footer_column_sitegroup__',
                'Shopseiten Gruppe'
            )
        );

        $column2FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column2-image',
                '__footer_column_image__',
                'Bild'
            )
        );

        $column2FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column2-link',
                '__footer_column_link__',
                'Link'
            )
        );

        $column2FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column2-linktext',
                '__footer_column_linktext__',
                'Linktext'
            )
        );

        $tab->addElement($column2FieldSet);

        $column3FieldSet = $this->createFieldSet(
            'emz-footer-column3-field_set',
            '__footer_tab_column3__',
            ['attributes' => $attributes]
        );

        $column3FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column3-headline',
                '__footer_column_headline__',
                'Spalte 3'
            )
        );

        $column3FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column3-description',
                '__footer_column_description__',
                'Spalte 3'
            )
        );

        $column3FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column3-sitegroup',
                '__footer_column_sitegroup__',
                'Shopseiten Gruppe'
            )
        );

        $column3FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column3-image',
                '__footer_column_image__',
                'Bild'
            )
        );

        $column3FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column3-link',
                '__footer_column_link__',
                'Link'
            )
        );

        $column3FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column3-linktext',
                '__footer_column_linktext__',
                'Linktext'
            )
        );

        $tab->addElement($column3FieldSet);

        $column4FieldSet = $this->createFieldSet(
            'emz-footer-column4-field_set',
            '__footer_tab_column4__',
            ['attributes' => $attributes]
        );

        $column4FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column4-headline',
                '__footer_column_headline__',
                'Spalte 4'
            )
        );

        $column4FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column4-description',
                '__footer_column_description__',
                'Spalte 4'
            )
        );

        $column4FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column4-sitegroup',
                '__footer_column_sitegroup__',
                'Shopseiten Gruppe'
            )
        );

        $column4FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column4-image',
                '__footer_column_image__',
                'Bild'
            )
        );

        $column4FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column4-link',
                '__footer_column_link__',
                'Link'
            )
        );

        $column4FieldSet->addElement(
            $this->createTextField(
                'emz-footer-column4-linktext',
                '__footer_column_linktext__',
                'Linktext'
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

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 130]);

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
            'socialbutton-column1-field_set',
            '__socialbuttons_tab_column__',
            ['attributes' => $attributes]
        );

        $fieldSet1->addElement(
            $this->createTextField(
                'emzSocialMediaFacebookLink',
                '__social_facebook_link__',
                ''
            )
        );

        $fieldSet1->addElement(
            $this->createTextField(
                'emzSocialMediaInstagramLink',
                '__social_instagram_link__',
                ''
            )
        );

        $fieldSet1->addElement(
            $this->createTextField(
                'emzSocialMediaTwitterLink',
                '__social_twitter_link__',
                ''
            )
        );

        $fieldSet1->addElement(
            $this->createTextField(
                'emzSocialMediaPinterestLink',
                '__social_pinterest_link__',
                ''
            )
        );

        $fieldSet1->addElement(
            $this->createTextField(
                'emzSocialMediaYoutubeLink',
                '__social_youtube_link__',
                ''
            )
        );

        $fieldSet1->addElement(
            $this->createTextField(
                'emzSocialMediaGooglePlusLink',
                '__social_googleplus_link__',
                ''
            )
        );


        $tab->addElement($fieldSet1);

        return $tab;
    }
}

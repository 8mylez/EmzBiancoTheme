{extends file='parent:frontend/index/footer.tpl'}

{* Copyright in the footer *}
{block name='frontend_index_footer_copyright'}
  <div class='emz-footer'>
    <div class='emz-footer-social-media'>
      {if $theme.emzSocialMediaInstagramLink}
        <div class='emz-footer-social-media-icon'>
          <a href={$theme.emzSocialMediaInstagramLink} target='_blank'>
            <i class="fa fa-instagram" aria-hidden="true"></i>
          </a>
        </div>
      {/if}
      {if $theme.emzSocialMediaFacebookLink}
        <div class='emz-footer-social-media-icon'>
          <a href={$theme.emzSocialMediaFacebookLink} target='_blank'>
            <i class="fa fa-facebook-official" aria-hidden="true"></i>
          </a>
        </div>
      {/if}
      {if $theme.emzSocialMediaTwitterLink}
        <div class='emz-footer-social-media-icon'>
          <a href={$theme.emzSocialMediaTwitterLink} target='_blank'>
            <i class="fa fa-twitter-square" aria-hidden="true"></i>
          </a>
        </div>
      {/if}
      {if $theme.emzSocialMediaPinterestLink}
        <div class='emz-footer-social-media-icon'>
          <a href={$theme.emzSocialMediaPinterestLink} target='_blank'>
            <i class="fa fa-pinterest-square" aria-hidden="true"></i>
          </a>
        </div>
      {/if}
      {if $theme.emzSocialMediaYoutubeLink}
        <div class='emz-footer-social-media-icon'>
          <a href={$theme.emzSocialMediaYoutubeLink} target='_blank'>
            <i class="fa fa-youtube-square" aria-hidden="true"></i>
          </a>
        </div>
      {/if}
      {if $theme.emzSocialMediaGooglePlusLink}
        <div class='emz-footer-social-media-icon'>
          <a href={$theme.emzSocialMediaGooglePlusLink} target='_blank'>
            <i class="fa fa-google-plus-square" aria-hidden="true"></i>
          </a>
        </div>
      {/if}
    </div>
    <div class='emz-footer-navigation'>
      <ul class="navigation--list" role="menu">
        {foreach $sMenu.emzFooterNavigation as $item}
          <li class="navigation--entry" role="menuitem">
            <a class="navigation--link" href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description|escape}"{if $item.target} target="{$item.target}"{/if}>
              {$item.description}
            </a>

            {* Sub categories *}
            {if $item.childrenCount > 0}
                <ul class="navigation--list is--level1" role="menu">
                    {foreach $item.subPages as $subItem}
                        <li class="navigation--entry" role="menuitem">
                            <a class="navigation--link" href="{if $subItem.link}{$subItem.link}{else}{url controller='custom' sCustom=$subItem.id title=$subItem.description}{/if}" title="{$subItem.description|escape}"{if $subItem.target} target="{$subItem.target}"{/if}>
                                {$subItem.description}
                            </a>
                        </li>
                    {/foreach}
                </ul>
            {/if}
          </li>
        {/foreach}
      </ul>
      {$smarty.block.parent}
    </div>
    <div class='emz-footer-language-switcher'>
      {action module=widgets controller=index action=shopMenu}
    </div>
  </div>
{/block}

{block name='frontend_index_footer_minimal'}{/block}

{block name="frontend_index_shopware_footer_logo"}{/block}

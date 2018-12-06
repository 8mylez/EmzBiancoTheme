<div class="emz-footer-navigation-left">
  <div class="footer--column is--first block">
    <div class="column--headline">
      {s namespace="frontend/index/menu_footer" name="emzFooterFirstColumnHeadline"}{/s}
    </div>
    <div class="column--content">
        {s namespace="frontend/index/menu_footer" name="emzFooterFirstColumnImage"}{/s}
        <p class="column--desc">
          {s namespace="frontend/index/menu_footer" name="emzFooterFirstColumnDescription"}{/s}
        </p>
        <div class='emz-column--link'>
          {s namespace="frontend/index/menu_footer" name="emzFooterFirstColumnLink"}{/s}
        </div>
    </div>
  </div>
  <div class="footer--column block">
    <div class="column--headline">
      {s namespace="frontend/index/menu_footer" name="emzFooterSecondColumnHeadline"}{/s}
    </div>
    <div class="column--content">
        {s namespace="frontend/index/menu_footer" name="emzFooterSecondColumnImage"}{/s}
        <p class="column--desc">
          {s namespace="frontend/index/menu_footer" name="emzFooterSecondColumnDescription"}{/s}
        </p>
        <div class='emz-column--link'>
          {s namespace="frontend/index/menu_footer" name="emzFooterSecondColumnLink"}{/s}
        </div>
    </div>
  </div>
</div>
<div class="emz-footer-navigation-right">
  <div class="footer--column block">
    <div class="column--headline">
      {s namespace="frontend/index/menu_footer" name="emzFooterThirdColumnHeadline"}{/s}
    </div>
    <div class="column--content">
        <ul>
          <li>
            {s namespace="frontend/index/menu_footer" name="emzFooterThirdColumnEntry1"}{/s}
          </li>
          <li>
            {s namespace="frontend/index/menu_footer" name="emzFooterThirdColumnEntry2"}{/s}
          </li>
          <li>
            {s namespace="frontend/index/menu_footer" name="emzFooterThirdColumnEntry3"}{/s}
          </li>
          <li>
            {s namespace="frontend/index/menu_footer" name="emzFooterThirdColumnEntry4"}{/s}
          </li>
        </ul>
        <div class='emz-column--link'>
          {s namespace="frontend/index/menu_footer" name="emzFooterThirdColumnLink"}{/s}
        </div>
    </div>
  </div>
  <div class="footer--column column--menu block">
    <div class="column--headline">
      {s namespace="frontend/index/menu_footer" name="emzFooterFourthColumnHeadline"}{/s}
    </div>
    <nav class="column--navigation column--content">
      <ul class="navigation--list" role="menu">
        {foreach $sMenu.emzFooterFourthColumn as $item}
          <li class="navigation--entry" role="menuitem">
            <a class="navigation--link" href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description|escape}"{if $item.target} target="{$item.target}"{/if}>
              <div class='emz-column--icon'>
                <i class="fa fa-check" aria-hidden="true"></i>
              </div>
              <div class='emz-column--text'>
                {$item.description}
              </div>
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
      <div class='emz-column--link'>
        {s namespace="frontend/index/menu_footer" name="emzFooterFourthColumnLink"}{/s}
      </div>
    </nav>
  </div>
  <div class="footer--column column--menu is--last block">
    <div class="column--headline">
      {s namespace="frontend/index/menu_footer" name="emzFooterFifthColumnHeadline"}{/s}
    </div>
    <nav class="column--navigation column--content">
      <ul class="navigation--list" role="menu">
        {foreach $sMenu.emzFooterFifthColumn as $item}
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
      <div class='emz-column--link'>
        {s namespace="frontend/index/menu_footer" name="emzFooterFifthColumnLink"}{/s}
      </div>
    </nav>
  </div>
</div>

{if $sCategories}
    {$emzCategories = $sCategories}
{elseif $sMainCategories}
    {$emzCategories = $sMainCategories}
{/if}

{if $emzCategories}
    {foreach $emzCategories as $emzCategory}
        {if $emzCategory.flag && $emzCategory.subcategories}
            {foreach $emzCategory.subcategories as $subcategory}
                {if $subcategory.flag}
                    <div class="emz-sub-navigation">
                        <div class="container" data-menu-scroller="true" data-listSelector=".emz-sub-navigation-list" data-viewPortSelector=".container">
                            <ul class="emz-sub-navigation-list">
                                <li>
                                    <a {if $sCategoryCurrent == $subcategory.id}class="is--active"{/if} href="{$subcategory.link}">{$subcategory.name}</a>
                                </li>
                                {if $subcategory.subcategories}
                                    {foreach $subcategory.subcategories as $subsubcategory}
                                        {if !$subsubcategory.hidetop}
                                            <li>
                                                <a {if $subsubcategory.flag}class="is--active"{/if} href="{$subsubcategory.link}">{$subsubcategory.name}</a>
                                            </li>
                                        {/if}
                                    {/foreach}
                                {/if}
                            </ul>
                        </div>
                    </div>
                {/if}
            {/foreach}
        {/if}
    {/foreach}
{/if}
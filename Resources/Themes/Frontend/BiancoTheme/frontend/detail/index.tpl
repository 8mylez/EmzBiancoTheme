{extends file="parent:frontend/detail/index.tpl"}

{block name="frontend_detail_breadcrumb_overview"}
    {if !{config name=disableArticleNavigation}}
        {$breadCrumbBackLink = $sBreadcrumb[count($sBreadcrumb) - 1]['link']}
        <a class="breadcrumb--button breadcrumb--link" href="{if $breadCrumbBackLink}{$breadCrumbBackLink}{else}#{/if}" title="{s name="DetailNavIndex" namespace="frontend/detail/navigation"}{/s}">
            <span class="breadcrumb--title">
                <i class="fa fa-arrow-left" aria-hidden="true"></i>
                {s name='DetailNavIndex' namespace="frontend/detail/navigation"}{/s}
            </span>
        </a>
    {/if}
{/block}

{block name="frontend_index_breadcrumb_prefix"}{/block}

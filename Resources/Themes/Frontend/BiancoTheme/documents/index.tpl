{extends file="parent:documents/index.tpl"}

{block name="document_index_info_dispatch"}
    {if $Order._dispatch.name}
        <p>
            {s name="DocumentIndexSelectedDispatch"}{/s}
            {$Order._dispatch.name}
        </p>
    {/if}
    {if $User.$address.country.countryen == "AUSTRIA"}
    {s name="DocumentIndexAustriaInformation"}Steuerfreie innergemeinschaftliche Lieferung{/s}
    {/if}
{/block}

<div class="sidebar sidebar-dark sidebar-fixed hide" id="sidebar">
    <div class="sidebar-brand d-none d-md-flex">
        <svg class="sidebar-brand-full" width="118" height="46" alt="CoreUI Logo">
            <use xlink:href="vendor/coreui/icons/svg/brand.svg#cib-coreui-c"></use>
        </svg>
        <svg class="sidebar-brand-narrow" width="46" height="46" alt="CoreUI Logo">
            <use xlink:href="vendor/coreui/icons/svg/brand.svg#cib-coreui"></use>
        </svg>
    </div>
    
    <ul class="sidebar-nav" data-coreui="navigation" data-simplebar="init">        
        <div class="simplebar-wrapper" style="margin: 0px;">
            <div class="simplebar-height-auto-observer-wrapper">
                <div class="simplebar-height-auto-observer"></div>
            </div>
            <div class="simplebar-mask">
                <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                    <div class="simplebar-content-wrapper" style="height: 100%; overflow: hidden scroll;">
                        <div class="simplebar-content" style="padding: 0px;">
                            @include('layouts.menu')
                        </div>
                    </div>
                </div>
            </div>
            <div class="simplebar-placeholder" style="width: 256px; height: 1296px;"></div>
        </div>
        <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
            <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
        </div>
        <div class="simplebar-track simplebar-vertical" style="visibility: visible;">
            <div class="simplebar-scrollbar"
                style="height: 44px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
        </div>
    </ul>
    <button class="sidebar-toggler" type="button" data-coreui-toggle="unfoldable"></button>
</div>
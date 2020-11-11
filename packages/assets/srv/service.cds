using com.assets as assets from '../db/data-model';

service CatalogService {
  @update  @delete
  entity Assets              as
    select from assets.Assets {
      AssetID                                          @readonly,
      AssetPortalLink                                  @readonly,
      AssetName                                        @readonly,
      Description                                      @readonly,
      ReadyDate                                        @readonly,
      Theme                                            @readonly,
      Sku                                              @readonly,
      Campaign                                         @readonly,
      Audience                                         @readonly,
      SubAudience                                      @readonly,
      Market                                           @readonly,
      ToProductionStatus                               @update @mandatory,
      ToAssetType                                      @readonly @mandatory,
      ToAssetType.Description as AssetType_Description @readonly @UI.Hidden,
      ToContentManager                                 @readonly @mandatory,
      ToContentManager.Name   as ContentManager_Name   @readonly @UI.Hidden,
    };

  @readonly
  entity VH_ProductionStatus as
    select from assets.ProductionStatus {
      ID,
      case
        when
          ID = 'Confidential'
        then
          1
        when
          ID = 'Ongoing'
        then
          2
        else
          3
      end as Criticality : Integer
    };

  @readonly
  entity VH_AssetType        as projection on assets.AssetType;

  @readonly
  entity VH_ContentManager   as projection on assets.ContentManagers;

}

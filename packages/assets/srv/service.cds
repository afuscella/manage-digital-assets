using com.assets as assets from '../db/data-model';

service CatalogService {
  @update  @delete
  entity Assets              as
    select from assets.Assets {
      AssetID,
      AssetPortalLink,
      AssetName,
      Description,
      ReadyDate                                        @UI.DateField,
      Theme,
      Sku,
      Campaign,
      Audience,
      SubAudience,
      Market,
      ToProductionStatus                               @mandatory @update,
      ToAssetType                                      @mandatory,
      ToAssetType.Description as AssetType_Description @readonly,
      ToContentManager                                 @mandatory,
      ToContentManager.Name   as ContentManager_Name   @readonly,
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

using com.assets as assets from '../db/data-model';

service CatalogService {
  @update  @delete
  entity Assets              as
    select from assets.Assets {
      assetID,
      assetPortalLink,
      assetName,
      description,
      readyDate,
      theme,
      sku,
      campaign,
      audience,
      subAudience,
      market,
      ToProductionStatus                              @mandatory @update,
      ToAssetType                                     @mandatory,
      ToAssetType.description as AssetTypeDescription @readonly,
      ToContentManager                                @mandatory,
      ToContentManager.name   as ContentManagerName   @readonly,
      case
        when
          ToProductionStatus.ID = 'Confidential'
        then
          1
        when
          ToProductionStatus.ID = 'Ongoing'
        then
          2
        else
          3
      end                     as ProductionStatusCriticality : Integer
    };

  @readonly
  entity VH_ProductionStatus as
    select from assets.ProductionStatus {
      ID as Code
    };

  @readonly
  entity VH_AssetType        as
    select from assets.AssetType {
      ID          as Code,
      description as Text
    };

  @readonly
  entity VH_ContentManager   as
    select from assets.ContentManagers {
      ID   as Code,
      name as Text
    }
}

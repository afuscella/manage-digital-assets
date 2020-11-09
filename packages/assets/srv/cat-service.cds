using com.assets as assets from '../db/data-model';

service CatalogService {
  @update  @delete
  entity Assets          as projection on assets.Assets;

  @readonly
  entity ContentManagers as projection on assets.ContentManagers;

  @readonly
  entity AssetType       as projection on assets.AssetType;
}

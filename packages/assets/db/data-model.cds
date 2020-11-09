namespace com.assets;

entity Assets {
    key assetID          : String;
        assetPortalLink  : String;
        assetName        : String;
        description      : String;
        productionStatus : String;
        readyDate        : Date;
        theme            : String;
        sku              : String;
        campaign         : String;
        audience         : String;
        subAudience      : String;
        market           : String;
        critically       : String;
        assetType        : Association to AssetType;
        contentManager   : Association to ContentManagers;
}

entity ContentManagers {
    key ID       : Integer;
        name     : String;
        ToAssets : Composition of many Assets
                       on ToAssets.contentManager = $self;
}

entity AssetType {
    key ID          : Integer;
        description : String;
        ToAssets    : Composition of many Assets
                          on ToAssets.assetType = $self;
}

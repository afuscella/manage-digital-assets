namespace com.assets;

using {managed} from './lib/common';

entity Assets : managed {
    key assetID            : String;
        assetPortalLink    : String @Core.IsUrl;
        assetName          : String;
        description        : String;
        readyDate          : Date;
        theme              : String;
        sku                : String;
        campaign           : String;
        audience           : String;
        subAudience        : String;
        market             : String;
        ToProductionStatus : Association to ProductionStatus;
        ToAssetType        : Association to AssetType;
        ToContentManager   : Association to ContentManagers;
}

entity ProductionStatus {
    key ID : String;
}

entity AssetType {
    key ID          : Integer;
        description : String;
}

entity ContentManagers {
    key ID   : Integer;
        name : String;
}

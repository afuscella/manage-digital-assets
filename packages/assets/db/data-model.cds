namespace com.assets;

using {managed} from './lib/common';

entity Assets : managed {
    key AssetID            : String;
        AssetPortalLink    : String @Core.IsUrl;
        AssetName          : String;
        Description        : String;
        ReadyDate          : Date   @UI.DateField;
        Theme              : String;
        Sku                : String;
        Campaign           : String;
        Audience           : String;
        SubAudience        : String;
        Market             : String;
        ToProductionStatus : Association to ProductionStatus;
        ToAssetType        : Association to AssetType;
        ToContentManager   : Association to ContentManagers;
}

entity ProductionStatus {
    key ID : String;
}

entity AssetType {
    key ID          : Integer;
        Description : String;
}

entity ContentManagers {
    key ID   : Integer;
        Name : String;
}

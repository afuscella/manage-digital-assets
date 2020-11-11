/**
 * Annotations for Assets Entity
 */
annotate CatalogService.Assets with @(UI : {
  Common                      : {Label : '{i18n>Products}'},
  HeaderInfo                  : {
    TypeName       : '{i18n>Catalog.TypeName}',
    TypeNamePlural : '{i18n>Catalog.TypeNamePlural}',
    Description    : {Value : AssetName},
    Title          : {Value : Description},
  },

  // selection fields
  SelectionFields             : [
  ToAssetType_ID,
  ToContentManager_ID,
  ToProductionStatus_ID,
  ReadyDate
  ],

  // line items
  LineItem                    : [
  {Value : AssetID},
  {Value : ToAssetType_ID},
  {Value : ToContentManager_ID},
  {
    Value       : ToProductionStatus_ID,
    Criticality : ToProductionStatus.Criticality
  },
  {Value : ReadyDate}
  ],

  // variant
  PresentationVariant         : {SortOrder : [{
    $Type      : 'Common.SortOrderType',
    Property   : AssetID,
    Descending : false
  }]},

  HeaderFacets                : [
  {
    $Type  : 'UI.ReferenceFacet',
    Target : '@UI.FieldGroup#AssetHeader',
    Label  : '{i18n>Catalog.FacetAssetHeaderData}'
  },
  {
    $Type  : 'UI.ReferenceFacet',
    Target : '@UI.FieldGroup#AssetStatus',
    Label  : '{i18n>Catalog.FacetAssetStatusData}',
  }
  ],

  Facets                      : [{
    $Type  : 'UI.CollectionFacet',
    Label  : '{i18n>Catalog.FacetAssetDetailData}',
    Facets : [
      {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Description',
        Label  : '{i18n>Catalog.FacetSectionDescription}',
      },
      {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Data',
        Label  : '{i18n>Catalog.FacetSectionData}',
      },
      {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Audience',
        Label  : '{i18n>Catalog.FacetSectionAudience}',
      },
      {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#AssetPortalLink',
        Label  : '{i18n>Catalog.FacetSectionAssetPortalLink}',
      }
    ]
  }],

  FieldGroup #AssetHeader     : {Data : [
  {Value : AssetName},
  {Value : ToAssetType_ID},
  {Value : Description}
  ]},
  FieldGroup #AssetAudience   : {Data : [
  {Value : Audience},
  {Value : SubAudience}
  ]},
  FieldGroup #AssetStatus     : {Data : [
  {
    Value       : ToProductionStatus_ID,
    Criticality : ToProductionStatus.Criticality
  },
  {Value : ContentManager_Name},
  {Value : ReadyDate}
  ]},
  FieldGroup #Description     : {Data : [
  {Value : Campaign},
  {Value : Market},
  ]},
  FieldGroup #Data            : {Data : [
  {Value : Sku},
  {Value : Theme}
  ]},
  FieldGroup #Audience        : {Data : [
  {Value : Audience},
  {Value : SubAudience},
  ]},
  FieldGroup #AssetPortalLink : {Data : [{
    $Type : 'UI.DataFieldWithUrl',
    Value : AssetPortalLink
  }]},
}) {
  assetID               @(
    title  : '{i18n>Catalog.AssetID}',
    Common : {Text : {
      $value                  : Description,
      ![@UI.badge.title.type] : #Standard
    }}
  );
  AssetName             @title : '{i18n>Catalog.AssetName}';
  ReadyDate             @title : '{i18n>Catalog.ReadyDate}';
  Campaign              @title : '{i18n>Catalog.Campaing}';
  Market                @title : '{i18n>Catalog.Market}';
  Sku                   @title : '{i18n>Catalog.SKU}';
  Theme                 @title : '{i18n>Catalog.Theme}';
  Audience              @title : '{i18n>Catalog.Audience}';
  SubAudience           @title : '{i18n>Catalog.SubAudience}';
  AssetPortalLink       @title : '{i18n>Catalog.AssetPortalLink}';
  ContentManager_Name   @title : '{i18n>Catalog.ContentManager}';
  ToProductionStatus_ID @title : '{i18n>Catalog.ProductionStatus}';
  ToContentManager_ID   @title : '{i18n>Catalog.ContentManager}';
  ToProductionStatus    @(
    title  : '{i18n>Catalog.ProductionStatus}',
    Common : {
      Text      : {
        $value                 : ToProductionStatus.ID,
        ![@UI.TextArrangement] : #TextOnly
      },
      ValueList : {
        SearchSupported : false,
        CollectionPath  : 'VH_ProductionStatus',
        Parameters      : [{
          $Type             : 'Common.ValueListParameterInOut',
          LocalDataProperty : ToProductionStatus_ID,
          ValueListProperty : 'ID'
        }]
      }
    }
  );
  ToAssetType           @(
    title  : '{i18n>Catalog.AssetType}',
    Common : {
      Text      : {
        $value                 : AssetType_Description,
        ![@UI.TextArrangement] : #TextFirst,
      },
      ValueList : {
        SearchSupported : true,
        CollectionPath  : 'VH_AssetType',
        Parameters      : [
        {
          $Type             : 'Common.ValueListParameterInOut',
          LocalDataProperty : ToAssetType_ID,
          ValueListProperty : 'ID'
        },
        {
          $Type             : 'Common.ValueListParameterInOut',
          LocalDataProperty : AssetType_Description,
          ValueListProperty : 'Description'
        }
        ]
      }
    }
  );
  ToContentManager      @(
    title  : '{i18n>Catalog.ContentManager}',
    Common : {
      Text      : {
        $value                 : ContentManager_Name,
        ![@UI.TextArrangement] : #TextFirst
      },
      ValueList : {
        SearchSupported : true,
        CollectionPath  : 'VH_ContentManager',
        Parameters      : [
        {
          $Type             : 'Common.ValueListParameterInOut',
          LocalDataProperty : ToContentManager_ID,
          ValueListProperty : 'ID'
        },
        {
          $Type             : 'Common.ValueListParameterInOut',
          LocalDataProperty : ContentManager_Name,
          ValueListProperty : 'Name'
        }
        ]
      }
    }
  );
};

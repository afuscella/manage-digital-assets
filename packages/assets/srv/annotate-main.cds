/**
 * Annotations for Assets Entity
 */
annotate CatalogService.Assets with @(UI : {
  Common                      : {Label : '{i18n>Products}'},
  HeaderInfo                  : {
    TypeName       : '{i18n>Catalog.TypeName}',
    TypeNamePlural : '{i18n>Catalog.TypeNamePlural}',
    Description    : {Value : assetName},
    Title          : {Value : description},
  },

  // selection fields
  SelectionFields             : [
    ToAssetType_ID,
    ToContentManager_ID,
    ToProductionStatus_ID,
    readyDate
  ],

  // line items
  LineItem                    : [
    {Value : assetID},
    {Value : description},
    {Value : ToAssetType_ID},
    {Value : ToContentManager_ID},
    {
      Value       : ToProductionStatus_ID,
      Criticality : ProductionStatusCriticality
    },
    {Value : readyDate, }
  ],

  // variant
  PresentationVariant         : {SortOrder : [{
    $Type      : 'Common.SortOrderType',
    Property   : assetID,
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
  }],

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
  {Value : assetName},
  {Value : ToAssetType_ID},
  {Value : description}
  ]},
  FieldGroup #AssetAudience   : {Data : [
  {Value : audience},
  {Value : subAudience}
  ]},
  FieldGroup #AssetStatus     : {Data : [
  {
    Value       : ToProductionStatus_ID,
    Criticality : ProductionStatusCriticality
  },
  {Value : ContentManagerName},
  {Value : readyDate}
  ]},
  FieldGroup #Description     : {Data : [
  {Value : campaign},
  {Value : market},
  ]},
  FieldGroup #Data            : {Data : [
  {Value : sku},
  {Value : theme}
  ]},
  FieldGroup #Audience        : {Data : [
  {Value : audience},
  {Value : subAudience},
  ]},
  FieldGroup #AssetPortalLink : {Data : [{
    $Type : 'UI.DataFieldWithUrl',
    Value : assetPortalLink
  }]},
}) {
  assetID               @title : '{i18n>Catalog.AssetID}';
  assetName             @title : '{i18n>Catalog.AssetName}';
  description           @title : '{i18n>Catalog.Description}';
  readyDate             @title : '{i18n>Catalog.ReadyDate}';
  campaign              @title : '{i18n>Catalog.Campaing}';
  market                @title : '{i18n>Catalog.Market}';
  sku                   @title : '{i18n>Catalog.SKU}';
  theme                 @title : '{i18n>Catalog.Theme}';
  audience              @title : '{i18n>Catalog.Audience}';
  subAudience           @title : '{i18n>Catalog.SubAudience}';
  assetPortalLink       @title : '{i18n>Catalog.AssetPortalLink}';
  ContentManagerName    @title : '{i18n>Catalog.ContentManager}';
  ToProductionStatus_ID @title : '{i18n>Catalog.ProductionStatus}';
  ToContentManager_ID   @title : '{i18n>Catalog.ContentManager}';
  ToProductionStatus    @(
    title  : '{i18n>Catalog.ProductionStatus}',
    Common : {
      Text      : {
        $value                 : ToProductionStatus_ID,
        ![@UI.TextArrangement] : #TextOnly
      },
      ValueList : {
        SearchSupported : false,
        CollectionPath  : 'VH_ProductionStatus',
        Parameters      : [{
          $Type             : 'Common.ValueListParameterInOut',
          LocalDataProperty : ToProductionStatus_ID,
          ValueListProperty : 'Code'
        }]
      }
    }
  );
  ToAssetType           @(
    title  : '{i18n>Catalog.AssetType}',
    Common : {
      Text      : {
        $value                 : AssetTypeDescription,
        ![@UI.TextArrangement] : #TextFirst,
      },
      ValueList : {
        SearchSupported : false,
        CollectionPath  : 'VH_AssetType',
        Parameters      : [{
          $Type             : 'Common.ValueListParameterInOut',
          LocalDataProperty : ToAssetType_ID,
          ValueListProperty : 'Code'
        }, {
          $Type             : 'Common.ValueListParameterInOut',
          LocalDataProperty : AssetTypeDescription,
          ValueListProperty : 'Text'
        }]
      }
    }
  );
  ToContentManager      @(
    title  : '{i18n>Catalog.ContentManager}',
    Common : {
      Text      : {
        $value                 : ContentManagerName,
        ![@UI.TextArrangement] : #TextFirst
      },
      ValueList : {
        SearchSupported : true,
        CollectionPath  : 'VH_ContentManager',
        Parameters      : [{
          $Type             : 'Common.ValueListParameterInOut',
          LocalDataProperty : ToContentManager_ID,
          ValueListProperty : 'Code'
        }, {
          $Type             : 'Common.ValueListParameterInOut',
          LocalDataProperty : ContentManagerName,
          ValueListProperty : 'Text'
        }]
      }
    }
  );
};

annotate CatalogService.Assets with @(UI : {
  Common                      : {Label : '{i18n>Products}'},
  HeaderInfo                  : {
    TypeName       : '{i18n>Catalog.TypeName}',
    TypeNamePlural : '{i18n>Catalog.TypeNamePlural}',
    Description    : {Value : assetName},
    Title          : {Value : description},
  },
  SelectionFields             : [
    assetID,
    assetName,
    // assetType_ID,
    productionStatus,
    readyDate
  ],
  LineItem                    : [
    {Value : assetID, },
    {Value : assetName, },
    // {Value : assetType_ID, },
  {
    Value       : productionStatus,
    Criticality : critically,
  },
    {Value : readyDate, }
  ],
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
      }, {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#Audience',
        Label  : '{i18n>Catalog.FacetSectionAudience}',
      }, {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#AssetPortalLink',
        Label  : '{i18n>Catalog.FacetSectionAssetPortalLink}',
      }
    ]
  }],
  FieldGroup #AssetHeader: {
    Data : [
      // {Value : assetType_ID},
      { Value : description}, 
  ]},
  FieldGroup #AssetAudience: {
    Data : [
      {Value : audience},
      {Value : subAudience}
  ]},
  FieldGroup #AssetStatus: {
    Data : [{
      Value       : productionStatus,
      Criticality : critically
    },
    {Value : readyDate}
  ]},
  FieldGroup #Description: {
    Data : [
      {Value : campaign},
      {
        Value : market,
        Label : '{i18n>Catalog.Market}'
      }, {
        Value : sku,
        Label : '{i18n>Catalog.SKU}'
      }, {
        Value : theme,
        Label : '{i18n>Catalog.Theme}'
      }
  ]},
  FieldGroup #Audience: {
    Data : [{
      Value : audience,
      Label : '{i18n>Catalog.Audience}'
    }, {
      Value : subAudience,
      Label : '{i18n>Catalog.SubAudience}'
    },
  ]},
  FieldGroup #AssetPortalLink : {
    Data : [{
      $Type : 'UI.DataFieldWithUrl',
      Value : assetPortalLink
    }
  ]},
});

annotate CatalogService.Assets with {
  assetID          @(Common.Label : '{i18n>Catalog.AssetID}');
  assetPortalLink  @(Common.Label : '{i18n>Catalog.AssetPortalLink}');
  assetName        @(Common.Label : '{i18n>Catalog.AssetName}');
  // assetType_ID     @(Common.Label : '{i18n>Catalog.AssetType}');
  description      @(Common.Label : '{i18n>Catalog.Description}');
  productionStatus @(Common.Label : '{i18n>Catalog.ProductionStatus}');
  readyDate        @(Common.Label : '{i18n>Catalog.ReadyDate}');
};

/**
 * Annotations for VH_ProductionStatus Entity
 */
annotate CatalogService.VH_ProductionStatus with {
  ID @(
    title  : '{i18n>Code}',
    Common : {Text : {$value : Text}}
  )
};

/**
 * Annotations for VH_AssetType Entity
 */
annotate CatalogService.VH_AssetType with {
  ID @(
    title  : '{i18n>Code}',
    Common : {Text : {$value : Text}}
  );
  Description @(
    title : '{i18n>Description}',
    UI    : {HiddenFilter : false}
  );
};

/**
 * Annotations for VH_ContentManager Entity
 */
annotate CatalogService.VH_ContentManager with {
  ID @(
    title  : '{i18n>Code}',
    Common : {Text : {$value : Text}}
  );
  Name @(
    title : '{i18n>Description}',
    UI    : {HiddenFilter : false}
  );
};

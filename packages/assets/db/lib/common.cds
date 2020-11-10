/**
 * Update aspects for managed
 */
aspect managed {
    CreatedAt  : Timestamp @cds.on.insert : $now;
    CreatedBy  : String    @cds.on.insert : $user;
    ModifiedAt : Timestamp @cds.on.insert : $now  @cds.on.update  : $now;
    ModifiedBy : String    @cds.on.insert : $user  @cds.on.update : $user;
}

/**
 * Annotation for the updated managed
 */
annotate managed with {
    ModifiedAt @readonly  @odata.on.update : #now;
    CreatedAt  @readonly  @odata.on.insert : #now;
    CreatedBy  @readonly  @odata.on.insert : #user;
    ModifiedBy @readonly  @odata.on.update : #user;
}

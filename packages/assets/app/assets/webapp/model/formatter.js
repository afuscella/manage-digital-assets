sap.ui.define([
    "sap/ui/core/MessageType",
], function(MessageType) {
    "use strict";

    return {

        /**
         * Format the icon display based on a asset type
         */
        formatAssetTypeIcon: function(iStatus) {
            if (iStatus === 201 || iStatus === 204) {
                return 'sap-icon://picture';
            } else if (iStatus === 202 || iStatus === 203) {
                return 'sap-icon://video';
            } else {
                return 'sap-icon://sound';
            }
        },

        /**
         * Format the highlight color based on a production status
         */
        formatCritically: function(sStatus) {
            if (sStatus === 'Confidential') {
                return MessageType.Warning;
            } else if (sStatus === 'Ongoing') {
                return MessageType.Information;
            } else {
                return MessageType.Success;
            }
        }
    };

});
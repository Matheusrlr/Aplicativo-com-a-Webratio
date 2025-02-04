/**
 * Service for List view components.
 * 
 * @constructor
 * @extends wrm.core.AbstractCachedViewComponentService
 * @param {string} id
 * @param {!Object} descr
 * @param {!wrm.core.Manager} manager
 */
export default wrm.defineService(wrm.core.AbstractCachedViewComponentService, {

    /** @override */
    initialize: function(descr) {
        var thisService = this;

        /**
         * @private
         * @type {!wrm.data.meta.Entity}
         */
        this._entity; // init'd below

        // TODO cache query instead
        /**
         * @private
         * @type {!Object}
         */
        this._condExpr; // init'd below

        /**
         * @private
         * @type {!boolean}
         */
        this._checkable = descr["checkable"] || false;

        /**
         * @private
         * @type {boolean}
         */
        this._hasPreCondExpr = (descr["preCondExprs"] !== undefined ? true : false);

        // TODO cache query instead
        /**
         * @private
         * @type {!Object}
         */
        this._preCondExpr; // init'd below

        /**
         * @private
         * @type {!number}
         */
        this._maxResults = descr["maxResults"];

        /**
         * @private
         * @type {!boolean}
         */
        this._distinct = descr["distinct"] || false;

        /**
         * @private
         * @type {!Object}
         */
        this._output; // init'd below

        /**
         * @private
         * @type {!Object}
         */
        this._toBind; // init'd below

        /**
         * @private
         * @type {!Array}
         */
        this._order = descr["order"];

        /**
         * @private
         * @type {!wrm.data.DataService}
         */
        this._dataService; // init'd below

        return this.getManager().getDataService().then(function(dataService) {
            thisService._dataService = dataService;
            thisService._entity = dataService.getMetadata().getEntity(descr["entity"]);
            thisService._condExpr = descr["condExprs"];
            var keyAttr = thisService._entity.getKeyAttribute();
            var output = descr["output"];
            thisService._output = {};
            thisService._toBind = {};
            if (output.length !== 0) {
                output.forEach(function(column) {
                    thisService._output[column["viewName"]] = column["ref"];
                    thisService._toBind[column["viewName"]] = column["bindName"];
                });
            }
            if (!thisService._distinct) {
                thisService._output["__key"] = keyAttr.getId(); // for row tracking
            }

            if (thisService._checkable) {
                thisService._output[keyAttr.getName()] = keyAttr.getId();
                thisService._toBind[keyAttr.getName()] = keyAttr.getId();
                thisService._preCondExpr = descr["preCondExprs"];
            }
        });
    },

    /** @override */
    createResult: function(context) {
        var thisService = this;
        var input = context.getInput();

        var options = {
            output: this._output,
            outputConfig: {
                useNames: true
            },
            distinct: this._distinct,
            filter: this._condExpr,
            order: this._order
        };
        var resultsLength = input["maxResults"] || thisService._maxResults;
        if (resultsLength > 0) {
            var limit = {
                count: resultsLength
            };
            options["limit"] = limit;
        }

        var promises = [];

        promises.push(this._retrieveData(input, options));
        if (this._checkable) {
            var keyAttributeId = this._entity.getKeyAttribute().getId();
            if (!this._refreshCheckedObjects(context)) {
                var checkedObj = [];
                var checkedRows = context.getView()["checkedRows"];
                Object.keys(checkedRows).forEach(function(rowKey) {
                    if (checkedRows[rowKey]) {
                        checkedObj.push(rowKey);
                    }
                });
                promises.push(checkedObj);
            } else if (this._hasPreCondExpr) {
                var preCheckOptions = {
                    output: keyAttributeId,
                    outputConfig: {
                        useNames: true
                    },
                    filter: this._preCondExpr
                };
                promises.push(this._retrieveData(input, preCheckOptions));
            }
        }

        return Promise.all(promises).then(function(results) {
            var dataRows = results[0];
            var preChecked = results[1] || [];
            var checkedRows = {};

            thisService._markDataRows(dataRows, context);
            if (thisService._checkable) {
                preChecked.forEach(function(objKey) {
                    checkedRows[objKey] = true;
                });
            }

            return {
                "data": dataRows,
                "checkedRows": checkedRows
            };

        }, function(e) {
            thisService.getLog().error(e);
        });

    },

    /**
     * @private
     * @param {!wrm.nav.Input} input
     * @param {!Object=} options
     * @return {!Promise<!Array<!Object>>}
     */
    _retrieveData: function(input, options) {
        var thisService = this;
        return this._dataService.execute(function(d) {
            return d.select(thisService._entity.getId(), options, input);
        });
    },

    /**
     * @private
     * @param {!Array<!Object>} rows
     * @param {!wrm.core.ViewComponentContext} context
     */
    _markDataRows: function(rows, context) {
        if (!this._distinct) {
            rows.forEach(function(row) {
                context.markForViewTracking(row, row["__key"]);
                delete row["__key"];
            }, this);
        } else {
            rows.forEach(function(row, index) {
                context.markForViewTracking(row, index);
            }, this);
        }
    },

    /** @override */
    isStaleResult: function(context, result) {
        return !result["data"] || result["data"].length === 0;
    },

    /** @override */
    catchEvent: function(context, event) {
        var rowIndex = event.getParameters()["position"];
        var view = context.getView();
        view["current"] = rowIndex;
    },

    /** @override */
    computeOutputFromResult: function(context, result) {
        return this._createOutput(result);
    },

    /** @override */
    submitView: function(context) {
        var view = context.getView();
        return this._createOutput(view);
    },

    /**
     * @param {!Object} view
     * @return {!Object}
     */
    _createOutput: function(view) {
        var output = {};
        var data = view["data"];
        var current = view["current"] || 0;
        var dataSize = data.length;
        if (dataSize > 0) {
            if (current === dataSize) {
                current--;
            }
            if (this._checkable) {
                output["checkedKeys"] = [];
                var checkedRows = view["checkedRows"];
                Object.keys(checkedRows).forEach(function(row) {
                    if (checkedRows[row] == true) {
                        output["checkedKeys"].push(row);
                    }
                });
            }

            var toBind = this._toBind;
            var currentRow = data[current];
            var outputData = {};
            Object.keys(this._output).forEach(function(key) {
                outputData[toBind[key]] = currentRow[key];
            });

            output["data"] = outputData;
        }
        output["dataSize"] = dataSize;
        return output;
    },

    /**
     * @private
     * @param {!wrm.core.ViewComponentContext} context
     * @return {boolean}
     */
    _refreshCheckedObjects: function(context) {
        var RefreshMode = wrm.core.RefreshMode;
        var refreshMode = context.getFormRefreshMode();
        if (refreshMode === RefreshMode.PRESERVE) {
            return false;
        } else {
            return true;
        }
    },

});

/**
* Theme: Ubold Admin Template
* Author: Coderthemes
* JsGrid page
*/


/**
 * JsGrid Controller
 */



var JsDBSource = {
    loadData: function (filter) {
        console.log(filter);
        var d = $.Deferred();
        $.ajax({
            type: "GET",
            url: "data/jsgrid.json",
            data: filter,
            success: function(response) {
                //static filter on frontend side, you should actually filter data on backend side
                var filtered_data = $.grep(response, function (client) {
                    return (!filter.Nombres || client.Nombres.indexOf(filter.Nombres) > -1)
                        && (!filter.Apellidos || client.Apellidos === filter.Apellidos)
                        && (!filter.Año || client.Año.indexOf(filter.Año) > -1)
                        && (!filter.Seccion || client.Seccion === filter.Seccion)
                });
                d.resolve(filtered_data);
            }
        });
        return d.promise();
    },

    insertItem: function (item) {
        return $.ajax({
            type: "POST",
            url: "data/jsgrid.json",
            data: item
        });
    },

    updateItem: function (item) {
        return $.ajax({
            type: "PUT",
            url: "data/jsgrid.json",
            data: item
        });
    },

    deleteItem: function (item) {
        return $.ajax({
            type: "DELETE",
            url: "data/jsgrid.json",
            data: item
        });
    },

    countries: [
        { Name: "", Id: 0 },
        { Name: "A", Id: 1 },
        { Name: "B", Id: 2 },
        { Name: "C", Id: 3 },
        { Name: "D", Id: 4 },
        { Name: "E", Id: 5 },
        { Name: "F", Id: 6 },
        { Name: "G", Id: 7 }
    ]
};



!function($) {
    "use strict";

    var GridApp = function() {
        this.$body = $("body")
    };
    GridApp.prototype.createGrid = function ($element, options) {
        //default options
        var defaults = {
            height: "450",
            width: "100%",
            filtering: true,
            editing: true,
            inserting: true,
            sorting: true,
            paging: true,
            autoload: true,
            pageSize: 10,
            pageButtonCount: 5,
            deleteConfirm: "Do you really want to delete the entry?"
        };

        $element.jsGrid($.extend(defaults, options));
    },
    GridApp.prototype.init = function () {
        var $this = this;

        var options = {
            fields: [
                {name: "Nombres", type: "text", width: 150},
                {name: "Apellidos", type: "text", width: 50},
                {name: "Año", type: "number", width: 200},
                {name: "Seccion", type: "select", items: JsDBSource.countries, valueField: "Id", textField: "Name"},
                {type: "control"}
            ],
            controller: JsDBSource,
        };
        $this.createGrid($("#jsGrid"), options);

    },
    //init ChatApp
    $.GridApp = new GridApp, $.GridApp.Constructor = GridApp

}(window.jQuery),

//initializing main application module
function($) {
    "use strict";
    $.GridApp.init();
}(window.jQuery);
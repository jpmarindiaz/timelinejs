HTMLWidgets.widget({

    name: "timelinejs",

    type: "output",

    initialize: function(el, width, height) {
        return {};
    },

    renderValue: function(el, x, instance) {

        var data = x.data;
        var settings = x.settings;
        console.log(x)
        if (x.debug) {
            console.log("settings", settings)
            console.log("data", data)
            console.log("el.id", el.id)
        }
        
        // https://timeline.knightlab.com/docs/options.html
            // start_at_end: true,
            // default_bg_color: { r: 0, g: 0, b: 0 },
            // timenav_height: 250
            // debug = true
        var settings = {
            debug: x.debug
        }

        timeline = new TL.Timeline(el.id, data, settings);

    },

    resize: function(el, width, height, instance) {

    }
});
define(['mapbox-gl'], function(mapboxgl){

    let mapConfigurator = {
        preConfig: function(map) {
            // This can be used to configure the map as the beginning of the map.on('load') event

            map.addControl(new mapboxgl.ScaleControl({
                maxWidth: 200,
                unit: 'metric'
            }));
        },

        postConfig: function(map) {
            // This can be used to configure the map as the end of the map.on('load') event
        },
    };

    return mapConfigurator;
});

        let pickupMap, destinationMap, pickupMarker, destinationMarker;
        let pickupLocation = null, destinationLocation = null;

        function initMap(mapId, searchInputId, isPickup) {
            const map = L.map(mapId).setView([7.8731, 80.7718], 8);
            L.gridLayer.googleMutant({ type: 'roadmap' }).addTo(map);
            
            const searchInput = new google.maps.places.Autocomplete(document.getElementById(searchInputId));
            searchInput.addListener('place_changed', () => {
                const place = searchInput.getPlace();
                if (!place.geometry) return;

                const location = { lat: place.geometry.location.lat(), lng: place.geometry.location.lng() };
                if (isPickup) {
                    pickupLocation = location;
                    if (pickupMarker) pickupMarker.remove();
                    pickupMarker = L.marker(location).addTo(map).bindPopup(place.name).openPopup();
                    document.getElementById("pickupName").textContent = place.name;
                } else {
                    destinationLocation = location;
                    if (destinationMarker) destinationMarker.remove();
                    destinationMarker = L.marker(location).addTo(map).bindPopup(place.name).openPopup();
                    document.getElementById("destinationName").textContent = place.name;
                }
                map.setView(location, 15);
            });

            map.on('click', async (e) => {
                const location = e.latlng;
                const geocoder = new google.maps.Geocoder();
                geocoder.geocode({ location }, (results, status) => {
                    if (status === "OK" && results[0]) {
                        if (isPickup) {
                            pickupLocation = location;
                            if (pickupMarker) pickupMarker.remove();
                            pickupMarker = L.marker(location).addTo(map).bindPopup(results[0].formatted_address).openPopup();
                            document.getElementById("pickupName").textContent = results[0].formatted_address;
                        } else {
                            destinationLocation = location;
                            if (destinationMarker) destinationMarker.remove();
                            destinationMarker = L.marker(location).addTo(map).bindPopup(results[0].formatted_address).openPopup();
                            document.getElementById("destinationName").textContent = results[0].formatted_address;
                        }
                    }
                });
            });

            return map;
        }

        function calculateFare() {
            if (!pickupLocation || !destinationLocation) {
                alert("Please set both pickup and destination locations.");
                return;
            }

            const distance = haversineDistance(pickupLocation, destinationLocation);
            const fare = distance * 50;
            document.getElementById("result").textContent = `Distance: ${distance.toFixed(2)} km | Fare: Rs. ${fare.toFixed(2)}`;
        }

        function haversineDistance(coord1, coord2) {
            const toRadians = (degrees) => degrees * (Math.PI / 180);
            const R = 6371;
            const dLat = toRadians(coord2.lat - coord1.lat);
            const dLon = toRadians(coord2.lng - coord1.lng);
            const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(toRadians(coord1.lat)) * Math.cos(toRadians(coord2.lat)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
            const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            return R * c;
        }

        window.onload = () => {
            pickupMap = initMap('pickupMap', 'pickupSearch', true);
            destinationMap = initMap('destinationMap', 'destinationSearch', false);
        };
   
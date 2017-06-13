function initMap() {
var marker;
// Styles a map in night mode.
var map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 55.760227, lng: 37.626898},
  zoom: 12,
  scrollwheel: false,
  styles: [
	{elementType: 'geometry', stylers: [{color: '#dfe4da'}]},
	{elementType: 'labels.text.stroke', stylers: [{color: '#dfe4da'}]},
	{elementType: 'labels.text.fill', stylers: [{color: '#e76b71'}]},
	{
	  featureType: 'administrative.locality',
	  elementType: 'labels.text.fill',
	  stylers: [{color: '#393939'}]
	},
	{
	  featureType: 'poi',
	  elementType: 'labels.text.fill',
	  stylers: [{color: '#393939'}]
	},
	{
	  featureType: 'poi.park',
	  elementType: 'geometry',
	  stylers: [{color: '#b7b7b7'}]
	},
	{
	  featureType: 'poi.park',
	  elementType: 'labels.text.fill',
	  stylers: [{color: '#6b9a76'}]
	},
	{
	  featureType: 'road',
	  elementType: 'geometry',
	  stylers: [{color: '#e86a72'}]
	},
	{
	  featureType: 'road',
	  elementType: 'geometry.stroke',
	  stylers: [{color: '#212a37'}]
	},
	{
	  featureType: 'road',
	  elementType: 'labels.text.fill',
	  stylers: [{color: '#4f4f4f'}]
	},
	{
	  featureType: 'road.highway',
	  elementType: 'geometry',
	  stylers: [{color: '#e76b71'}]
	},
	{
	  featureType: 'road.highway',
	  elementType: 'geometry.stroke',
	  stylers: [{color: '#1f2835'}]
	},
	{
	  featureType: 'road.highway',
	  elementType: 'labels.text.fill',
	  stylers: [{color: '#f3d19c'}]
	},
	{
	  featureType: 'transit',
	  elementType: 'geometry',
	  stylers: [{color: '#a3a79f'}]
	},
	{
	  featureType: 'transit.station',
	  elementType: 'labels.text.fill',
	  stylers: [{color: '#393939'}]
	},
	{
	  featureType: 'water',
	  elementType: 'geometry',
	  stylers: [{color: '#f1f4ee'}]
	},
	{
	  featureType: 'water',
	  elementType: 'labels.text.fill',
	  stylers: [{color: '#515c6d'}]
	},
	{
	  featureType: 'water',
	  elementType: 'labels.text.stroke',
	  stylers: [{color: '#f1f4ee'}]
	}
  ]
});


marker = new google.maps.Marker({
  map: map,
  draggable: true,
  position: {lat: 55.760227, lng: 37.626898}
});


}

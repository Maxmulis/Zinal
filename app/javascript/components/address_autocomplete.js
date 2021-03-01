import places from 'places.js';

const addressAutocomplete = () => {
  var $country = document.querySelector('#group_country')

  const placesAutocomplete = places({
    container: document.querySelector('#group_street'),
    templates: {
      value: function(suggestion) {
        return suggestion.name;
      }
    }
  }).configure({
    countries: [$country.value.toLowerCase()],
    type: 'address',
    language: 'de'
  });
  placesAutocomplete.on('change', function resultSelected(e) {
    document.querySelector('#group_town').value = e.suggestion.city || '';
    document.querySelector('#group_zip').value = e.suggestion.postcode || '';
  });

  $country.addEventListener('change', function(e){
    placesAutocomplete.configure({ countries: [e.target.value.toLowerCase()] });
  })

};

export { addressAutocomplete };

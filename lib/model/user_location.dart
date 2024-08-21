class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinate coordinate;
  final LocationTimeZone timezone;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinate,
    required this.timezone,
  });

  factory UserLocation.fromMap(Map<String, dynamic> e) {
    final coordinate = LocationCoordinate.fromMap(e['coordinates']);
    final street = LocationStreet.fromMap(e['street']);
    final timezone = LocationTimeZone.fromMap(e['timezone']);

    return UserLocation(
      city: e['city'],
      state: e['state'],
      country: e['country'], // Fixed 'country' key
      postcode: e['postcode'].toString(),
      street: street,
      coordinate: coordinate,
      timezone: timezone,
    );
  }
}

class LocationStreet {
  final int number;
  final String name;

  LocationStreet({required this.number, required this.name});

  factory LocationStreet.fromMap(Map<String, dynamic> e) {
    return LocationStreet(
      number: e['number'], // Fixed 'number' and 'name' keys
      name: e['name'],
    );
  }
}

class LocationCoordinate {
  final String longitude;
  final String latitude;

  LocationCoordinate({required this.longitude, required this.latitude});

  factory LocationCoordinate.fromMap(Map<String, dynamic> e) {
    return LocationCoordinate(
      longitude: e['longitude'], // Fixed 'coordinate' key
      latitude: e['latitude'],   // Fixed 'coordinate' key
    );
  }
}

class LocationTimeZone {
  final String offset;
  final String description;

  LocationTimeZone({required this.offset, required this.description});

  factory LocationTimeZone.fromMap(Map<String, dynamic> e) {
    return LocationTimeZone(
      offset: e['offset'], // Fixed 'timezone' key
      description: e['description'],
    );
  }
}

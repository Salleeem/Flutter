class CityDb {
  //atributos
  final int id;
  final String cityName;
  final bool favoritesCities;

  CityDb(
      {required this.id,
      required this.cityName,
      required this.favoritesCities});
  
  //toMap
  Map<String,dynamic> toMap() {
    return {
      'cityname': this.cityName,
      'favoritescities': this.favoritesCities
    };
  }
  //fromMap
  factory CityDb.fromMap(Map<String,dynamic> map){
    return CityDb(
      id: map['id'],
      cityName: map['cityname'],
      favoritesCities: map['favoritescities']
    );
  }
}

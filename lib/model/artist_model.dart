class ArtistModel {
  String name;
  String src;
  String subscribers;
  String genre;

  ArtistModel({
    required this.name,
    required this.src,
    required this.subscribers,
    required this.genre,
  });

  Map toJson() => {
    'name': name,
    'src': src,
    'subscribers': subscribers,
    'genre': genre,
  };
}

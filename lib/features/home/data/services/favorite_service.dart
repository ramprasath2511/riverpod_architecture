abstract class FavouritesServiceInterface {
  bool isFavourite(String id);
  void addFavourite(String id);
  void removeFavourite(String id);
  List<String> getFavourites();
}

class FavouritesService implements FavouritesServiceInterface{

  final List<String> favourites = [];

  @override
  void addFavourite(String id) {
   favourites.add(id);
  }

  @override
  bool isFavourite(String id) {
   return favourites.contains(id);
  }

  @override
  void removeFavourite(String id) {
    favourites.remove(id);
  }

  @override
  List<String> getFavourites() => favourites.toList();
  
}  
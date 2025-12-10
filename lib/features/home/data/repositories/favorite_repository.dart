



import '../services/favorite_service.dart';

class FavoritesRepository{

  FavoritesRepository(this.service);

  final FavouritesServiceInterface service;
  bool isFavourite(String id) => service.isFavourite(id);
  void addFavourite(String id) => service.addFavourite(id);
  void removeFavourite(String id) => service.removeFavourite(id);
  List<String> getAllFavourites()=> service.getFavourites();
}
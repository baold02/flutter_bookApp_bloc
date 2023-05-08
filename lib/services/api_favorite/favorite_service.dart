import 'package:book_app/models/favorite_book_model.dart';
import 'package:book_app/services/api_favorite/favorite_book_api.dart';

class FavoriteSevice {
  FavoriteBookApi _favoriteBookApi = FavoriteBookApi();
  Future<List<FavoriteBookModel>> fetchFavorite() async{
    var dataFavorite = await _favoriteBookApi.fetchListFavorite();
    return dataFavorite;
  }
}
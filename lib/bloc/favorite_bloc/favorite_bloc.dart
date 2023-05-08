import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/favorite_book_model.dart';
import '../../services/api_favorite/favorite_book_api.dart';
import '../../services/api_favorite/favorite_service.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<FavoriteBookModel> listFavorite = [];
  final FavoriteBookApi _favoriteBookApi = FavoriteBookApi();
  final FavoriteSevice _favoriteSevice = FavoriteSevice();

  FavoriteBloc() : super(FavoriteInitial()) {
    on<FetchListFavorite>((event, emit) async {
      try {
        listFavorite = await _favoriteSevice.fetchFavorite();
        emit(FavoriteLoadSuccsess(listFavorite));
      } catch (e) {
        emit(LoadFavoriteError("LoadError"));
      }
    });
    on<AddFavoriteEvent>((event, emit) async {

      listFavorite = await _favoriteSevice.fetchFavorite();
      int index = -1;
        bool check = false;
        for (var element in listFavorite) {
          index++;
          if (element.name == event.name) {
            check = true;
            _favoriteBookApi.RemoveFavorite(listFavorite[index].id);
          }
        }

        if(check){

        }else{
          http.Response res = await _favoriteBookApi.AddFavoriteBook(
              event.name, event.image, event.price, event.des);
          if (res.statusCode == 200) {
            print('add favorite success');
          }
        }



      // TODO: implement event handler
    });

    on<RemoveFavorite>((event, emit){

    });
  }
}

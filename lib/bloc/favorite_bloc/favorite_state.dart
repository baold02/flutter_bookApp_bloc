part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
}

class FavoriteInitial extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteLoadSuccsess extends FavoriteState{
  final List<FavoriteBookModel> listFavorite;

  FavoriteLoadSuccsess(this.listFavorite);

  @override
  // TODO: implement props
  List<Object?> get props => [listFavorite];

}

class LoadFavoriteError extends FavoriteState{
  String messError;

  LoadFavoriteError(this.messError);

  @override
  // TODO: implement props
  List<Object?> get props => [messError];

}


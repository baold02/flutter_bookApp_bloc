part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}
class FetchListFavorite extends FavoriteEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}


class RemoveFavorite extends FavoriteEvent{
  final String id;

  RemoveFavorite(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}


class AddFavoriteEvent extends FavoriteEvent{
  final String name,image,price,des;

  AddFavoriteEvent(this.name, this.image, this.price, this.des);

  @override
  // TODO: implement props
  List<Object?> get props => [name,image,price,des];

}

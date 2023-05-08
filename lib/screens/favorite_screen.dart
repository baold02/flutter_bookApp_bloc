import 'package:book_app/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FavoriteBloc>(context).add(FetchListFavorite());
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<FavoriteBloc,FavoriteState>(
          builder: (context, state) {
            if(state is FavoriteLoadSuccsess){
              return Expanded(child:
                ListView.builder(
                  itemCount: state.listFavorite.length,
                  itemBuilder: (context, index) => Image.network(state.listFavorite[index].imgae.toString()))
              );
            }
            if(state is LoadFavoriteError){
              return Text(state.messError);
            }

            return Container();
          },
        )
      ],
    );
  }
}

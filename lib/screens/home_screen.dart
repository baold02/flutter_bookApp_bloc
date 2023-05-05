import 'package:book_app/bloc/book_bloc.dart';
import 'package:book_app/models/Book_model.dart';
import 'package:book_app/utils/app_style.dart';
import 'package:book_app/utils/size_config.dart';
import 'package:book_app/utils/util.dart';
import 'package:book_app/widget/item_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<BookBloc>(context).add(FetchListBook());
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body:ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hello,welcome',
                    style: kEncodeSansRagular.copyWith(
                      color: kDarkGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5
                    ),),

                    Text('Lê Đức Bảo',
                      style: kEncodeSansBold.copyWith(
                          color: kDarkGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4
                      ),)
                  ],
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: kGrey,
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv8lgDc1gGlVqn3UjDqKslOP6HrrUissH8xw&usqp=CAU'),
                )
              ],
            ),
          ),
          const SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPaddingHorizontal
            ),
            child: Row(children: [
              Expanded(
                  child: TextField(
                    style: kEncodeSansRagular.copyWith(
                      color: kDarkGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5
                    ),
                    controller:  TextEditingController(),
                    decoration:  InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 13),
                      prefixIcon: const IconTheme(
                        data: IconThemeData(
                          color: kDarkGrey,
                        ),
                        child: Icon(Icons.search),
                      ),
                      hintText: 'Search book...',
                      border:kInputBoder,
                      errorBorder: kInputBoder,
                      disabledBorder:  kInputBoder,
                      focusedBorder: kInputBoder,
                      focusedErrorBorder: kInputBoder,
                      enabledBorder: kInputBoder,
                      hintStyle: kEncodeSansRagular.copyWith(
                        color: kDarkGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5
                      )
                    ),
                  )
              ),
             const SizedBox( width: 16,),
              Container(
                height: 49,
                width: 49,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(KBoderRadius,),
                  color: Colors.black
                ),
                child: Image.asset('images/setting.png',color: Colors.white),
              )
            ],),
          ),
         const SizedBox(height: 24,),
          SizedBox(
            height: 36,
            width: double.infinity,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: Util.categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: current == index ? kBrown : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: current == index ? null : Border.all(color: kGrey,width: 1)
                      ),
                    child: Row(
                      children: [
                        SvgPicture.asset(current == index? 'images/${Util.Icons[index]}-com.svg':toString()),
                        const SizedBox(width: 4,),
                        Text(Util.categories[index],style: kEncodeSansMedium.copyWith(
                          color: current == index?
                              Colors.white : kDrakBrown,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3
                        ),)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const  SizedBox(height: 32,),
          BlocBuilder<BookBloc,BookState>(
            builder: (context, state) {
              if(state is BookLoading){
                return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              }if(state is BookLoadSuccess){
                return  MasonryGridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 70,
                  mainAxisSpacing: 30,
                  itemCount: state.listBook.length,
                  padding:const EdgeInsets.symmetric(
                    horizontal: kPaddingHorizontal
                  ),
                  itemBuilder: (context, index) {
                     return ItemHomeWidget(listBook: state.listBook, index: index);
                  },

                );
              }
              return Container();
            },
          )

        ],
      )
    );
  }
}


// Column(
// children: [
// const Text('Home screen'),
// BlocBuilder<BookBloc,BookState>(
// builder: (context, state) {
// if(state is BookLoading){
// return const Center(child: CircularProgressIndicator(),);
// }if( state is BookLoadSuccess){
// print(state.listBook.length);
// return Expanded(
// child:  ListView.builder(
// itemCount: state.listBook.length,
// itemBuilder:(context, index) =>  _ItemHome(state.listBook,index,context),));
// }
// return Container();
// }, )
//
// ],
// ),

// Widget _ItemHome(List<BookModel> listBook, int index, BuildContext context) {
//   return GridView.builder(
//     physics: const BouncingScrollPhysics(),
//     itemCount: 4,
//     shrinkWrap: true,
//     itemBuilder: (context, index) {
//       return Container(
//         // color: Colors.amber,
//         child: Row(
//           children: [
//             Image.network(listBook[index].imgae.toString(),
//                 width: 50, height: 50,),
//             const SizedBox(
//               width: 14,
//             ),
//             Expanded(
//               child: SizedBox(
//                 width: 110,
//                 child: Text(
//                   listBook[index].name.toString(),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   // style: CustomText.title(15, colorLabalTextFiled),
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     },
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         childAspectRatio: 2.4,
//         crossAxisSpacing: 14,
//         mainAxisSpacing: 0.75,
//         crossAxisCount: 2),
//   );
// }

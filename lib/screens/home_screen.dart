import 'package:book_app/bloc/book_bloc.dart';
import 'package:book_app/models/banner_model.dart';
import 'package:book_app/screens/search_screen.dart';
import 'package:book_app/utils/app_style.dart';
import 'package:book_app/utils/size_config.dart';
import 'package:book_app/widget/item_home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import '../widget/widget_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  final controller = CarouselController();
  var _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
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
                    Text(
                      'Hello,welcome',
                      style: kEncodeSansRagular.copyWith(
                          color: kDarkGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                    ),
                    Text(
                      'Lê Đức Bảo',
                      style: kEncodeSansBold.copyWith(
                          color: kDarkGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4),
                    )
                  ],
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: kGrey,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv8lgDc1gGlVqn3UjDqKslOP6HrrUissH8xw&usqp=CAU'),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const IndicatorWidget(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  // onChanged: (value) => ,
                  style: kEncodeSansRagular.copyWith(
                      color: kDarkGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 13),
                      prefixIcon: const IconTheme(
                        data: IconThemeData(
                          color: kDarkGrey,
                        ),
                        child: Icon(Icons.search),
                      ),
                      hintText: 'Search book...',
                      border: kInputBoder,
                      errorBorder: kInputBoder,
                      disabledBorder: kInputBoder,
                      focusedBorder: kInputBoder,
                      focusedErrorBorder: kInputBoder,
                      enabledBorder: kInputBoder,
                      hintStyle: kEncodeSansRagular.copyWith(
                          color: kDarkGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5)),
                )),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 49,
                  width: 49,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        KBoderRadius,
                      ),
                      color: Colors.black),
                  child: Image.asset('images/setting.png', color: Colors.white),
                )
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 200,
                  child: LottieBuilder.network(
                      'https://assets10.lottiefiles.com/packages/lf20_fxvz0c.json')),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                height: 160,
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        _selectedIndex = value;
                      });
                    },
                    controller: PageController(viewportFraction: 0.7),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      var banner = list[index];
                      var _scale = _selectedIndex == index ? 1.0 : 0.8;
                      return TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 350),
                        tween: Tween(begin: _scale, end: _scale),
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: value,
                            child: child,
                          );
                        },
                        curve: Curves.ease,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(list[index].thumbnailUrl),
                                  fit: BoxFit.cover)),
                          child: DefaultTextStyle(
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20.0),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(0, 0, 0, 0.3),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Center(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Chủ đề'.toUpperCase()),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          list[index].title.toUpperCase(),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Divider(
            thickness: 1,
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
              child: Text(
                'Tất cả sách',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              )),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<BookBloc, BookState>(
            builder: (context, state) {
              if (state is BookLoading) {
                return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              }
              if (state is BookLoadSuccess) {
                return MasonryGridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 70,
                  mainAxisSpacing: 30,
                  itemCount: state.listBook.length,
                  padding: const EdgeInsets.symmetric(
                      horizontal: kPaddingHorizontal),
                  itemBuilder: (context, index) {
                    return ItemHomeWidget(
                        listBook: state.listBook, index: index);
                  },
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}

// class Inicator extends StatelessWidget {
//   final bool isActive;
//
//   const Inicator({Key? key, required this.isActive}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 350),
//       child: Container(
//         width: isActive ? 22.0 : 8.0,
//         height: 8.0,
//         decoration: BoxDecoration(
//             color: isActive ? Colors.orange : Colors.grey,
//             borderRadius: BorderRadius.circular(8.0)),
//       ),
//     );
//   }
// }

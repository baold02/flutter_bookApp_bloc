import 'package:book_app/bloc/counter/counter.dart';
import 'package:book_app/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:book_app/bloc/oder_bloc/order_bloc.dart';
import 'package:book_app/models/Book_model.dart';
import 'package:book_app/utils/app_style.dart';
import 'package:book_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

class DetailBook extends StatefulWidget {
  final String idBook;
  final String rate;
  final String athur;
  final String name;
  final String description;
  final String image;
  final String price;
  const DetailBook({Key? key, required this.name, required this.description, required this.image, required this.price, required this.athur, required this.rate, required this.idBook }) : super(key: key);

  @override
  State<DetailBook> createState() => _DetailBookState();
}

class _DetailBookState extends State<DetailBook> {
  final Counter _counter =  Counter();

  void _incrementCounter(){
    setState(() {
      _counter.increment();
    });
  }

  void _decrementCounter(){
    setState(() {
      _counter.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizdeVetical!*50,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius:BorderRadius.circular(24),
                      child:    Image.network(widget.image,
                      height: SizeConfig.blockSizdeVetical!*50,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child:Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: SizeConfig.blockSizdeVetical!*4,
                                width: SizeConfig.blockSizdeVetical!*4,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: kBrown.withOpacity(0.11),
                                      spreadRadius: 0.0,
                                      blurRadius: 12,
                                      offset: const Offset(0,5)
                                    )
                                  ]
                                ),
                                padding: const EdgeInsets.all(8),
                                child:const Icon(Icons.arrow_back),
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                BlocProvider.of<FavoriteBloc>(context).add(AddFavoriteEvent(widget.name,widget.image, widget.price, widget.athur));
                              },
                              child: Container(
                                height: SizeConfig.blockSizdeVetical!*4,
                                width: SizeConfig.blockSizdeVetical!*4,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: kBrown.withOpacity(0.11),
                                          spreadRadius: 0.0,
                                          blurRadius: 12,
                                          offset: const Offset(0,5)
                                      )
                                    ]
                                ),
                                padding: const EdgeInsets.all(8),
                                child:const Icon(Icons.favorite_border),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
             const SizedBox(height: 24,),
              Row(
                children: [
                  Expanded(child:  Text(widget.name,overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: kEncodeSansSemiBold.copyWith(
                    color: kDrakBrown,
                    fontSize: SizeConfig.blockSizeHorizontal! * 7
                  ),
                  )),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => _decrementCounter(),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black54,
                              width: 1
                            ),
                            shape: BoxShape.circle,
                            color: Colors.white
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                     SizedBox(
                       width: SizeConfig.blockSizeHorizontal!*3,
                     ),
                     Text(_counter.value.toString(),
                     style: kEncodeSansSemiBold.copyWith(
                       fontSize: SizeConfig.blockSizeHorizontal!*5,
                       color: kDrakBrown
                     ),
                     ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal!*3,
                      ),
                      InkWell(
                        onTap: () => _incrementCounter(),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black54,
                                  width: 1
                              ),
                              shape: BoxShape.circle,
                              color: Colors.white
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),

              const SizedBox(height: 8,),
              Row(
                children: [
                  RatingBar.builder(
                    itemSize: 18,
                    initialRating: 3.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.all(2),
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    onRatingUpdate: (value) {
                      debugPrint(value.toString());
                    },
                    unratedColor: Colors.grey,
                  ),

                  const SizedBox(width: 8,),
                  RichText(text: TextSpan(
                    text: '5.0',
                    style: kEncodeSansRagular.copyWith(
                      color: Colors.grey,
                      fontSize: SizeConfig.blockSizeHorizontal!*3
                    ),
                    children: [
                      TextSpan(
                        text: '(7.901 reviews)',
                          style: kEncodeSansRagular.copyWith(
                              color: Colors.blueAccent,
                              fontSize: SizeConfig.blockSizeHorizontal!*3
                          )
                      )
                    ]
                  ))
                ],
              ),
              const SizedBox(height: 8,),
              
              ReadMoreText(
                 widget.description,
                trimLines: 2,
                trimMode: TrimMode.Line,
                delimiter: '',
                trimCollapsedText: 'Read More...',
                trimExpandedText: 'Show less',
                style: kEncodeSansRagular.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal!*3
                ),
                moreStyle: kEncodeSansBold.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal!*3
                ),
                lessStyle: kEncodeSansBold.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal!*3
                ),
              )


            ],
          ),
        )
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 60,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.black
        ),
        child: InkWell(
          onTap: () {
            BlocProvider.of<OrderBloc>(context).add(OrderBookEvent(widget.idBook,widget.name, widget.image, widget.price, widget.description,widget.athur,widget.rate,1));
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Đã thêm vào giỏ hàng"),
                    duration: Duration(milliseconds: 500),
                  ));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_shopping_cart,color: Colors.white,),
              SizedBox(width: SizeConfig.blockSizeHorizontal!*1,),
              RichText(text: TextSpan(
                  text: 'Add to cart|',
                  style: kEncodeSansRagular.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockSizeHorizontal!*3
                  ),
                  children: [
                    TextSpan(
                        text: widget.price,
                        style: kEncodeSansRagular.copyWith(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal!*3
                        )
                    )
                  ]
              ))
            ],
          ),
        ),
      ),
    );
  }
}

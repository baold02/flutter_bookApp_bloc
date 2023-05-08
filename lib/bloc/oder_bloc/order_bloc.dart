import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../../models/book_order_model.dart';
import '../../services/order_api_service/api_reponesitory.dart';
import '../../services/order_api_service/order_book_api.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  List<BookOrderModel> listOrder = [];
  final ApiRepository _apiRepository = ApiRepository();
  final OrderBookApi _orderBookApi = OrderBookApi();

  OrderBloc() : super(OrderInitial()) {
    on<FetchListOrder>((event, emit) async {
      try {
        emit(BookLoading());
        listOrder = await _apiRepository.fetchListBookOrder();
        emit(OderBookLoaded(listOrder));
      } catch (e) {
        emit(BookOdrerLoadError("Error"));
      }
      // TODO: implement event handler
    });
    on<OrderBookEvent>((event, emit) async {
      listOrder = await _apiRepository.fetchListBookOrder();
      int index = -1;
      try {
        bool check = false;
        for (var element in listOrder) {
          index++;
          if (element.name == event.name) {
            print('+1');
            print(element.name);
            print(event.name);
            // element.quantity! + 1;
            num quan = element.quantity! + event.quantity;
            listOrder[index] = element.copyWith(quantity: quan);
            print(quan);
            check = true;
          }
        }

        if (check) {
        } else {
          http.Response res = await _orderBookApi.addOrderBook(
              event.idBook,
              event.name,
              event.price,
              event.image,
              event.des,
              event.quantity += 1,
              event.athur);
          if (res.statusCode == 200) {
            print('add order success');
            listOrder = await _apiRepository.fetchListBookOrder();
            emit(OderBookLoaded(listOrder));
          } else {
            emit(BookOdrerLoadError("LoadError"));
            print('error');
          }
        }
      } catch (e) {
        // emit(OderError("error"));
      }

      // TODO: implement event handler
    });

    on<OrderDelete>((event, emit) async {
      OrderBookApi().deleteDta(event.id);
      try {
        emit(BookLoading());
        final list = await _apiRepository.fetchListBookOrder();
        emit(OderBookLoaded(list));
      } catch (e) {
        emit(BookOdrerLoadError("Error"));
      }
      // TODO: implement event handler
    });
  }
}

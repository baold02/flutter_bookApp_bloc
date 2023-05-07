import 'package:equatable/equatable.dart';

class Counter extends Equatable{
  int value;

  Counter({this.value = 0});
  increment() => value++;
  decrement() => value--;


  @override
  // TODO: implement props
  List<Object?> get props => [value];

}
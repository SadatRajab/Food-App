import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/descrip_Page_food/Count_Cupit/count_state.dart';

class CountCupit extends Cubit <Counter_States>{
  CountCupit():super(CounterINTState());

  static CountCupit get(BuildContext context){
    return BlocProvider.of(context);
  }
    int num = 0;

  void increasNumber(){
    num++;
    emit(CounterIncreaseNumber());
  }
  void decreasNumber(){
    num--;
    if(num<0){
      num=0;
    }
    emit(CounterDencreaseNumber());
  }
  void ZeroNumber(){
    num=0;
    emit(CounterINTState());
  }
}
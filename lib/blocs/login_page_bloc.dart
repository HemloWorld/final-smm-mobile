import 'package:final_project/blocs/bloc_event.dart';
import 'package:final_project/blocs/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  LoginPageBloc extends Bloc<BlocEvent, BlocState>{
  @override
  BlocState get initialState => Waiting();

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if(event is Login){
      yield Loading();
      try{
//        final result = await UserService().login(event.email);
//        yield Success(result);
      }
      catch(e){
        yield Error(e);
      }
    }
  }

}
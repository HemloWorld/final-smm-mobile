import 'package:final_project/blocs/bloc_event.dart';
import 'package:final_project/blocs/bloc_state.dart';
import 'package:final_project/services/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanNfcPageBloc extends Bloc<BlocEvent, BlocState> {
  @override
  BlocState get initialState => Waiting();

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is SearchUserById) {
      yield Loading();
      try {
        final result = await UserService().fetchById(event.id, event.type);
        print(result==404);
        print(result=="404");
        print(result);
        if (result == 404) {
          print('errorrr');
          yield Error(result);
        }else {
          yield Success(result);
        }
      } catch (e) {
        yield Error(e);
      }
    }
    else if (event is SubmitAttendance) {
      yield Loading();
      try {
        final result = await UserService().postAttendance(event.userId, event.date, event.time);
        yield Success(result);
      } catch (e) {
        if (e.response.statusCode == 404){
          yield Error(e);
        }else{
          print(e.message);
          print(e.request);
        }
      }
    }
  }
}
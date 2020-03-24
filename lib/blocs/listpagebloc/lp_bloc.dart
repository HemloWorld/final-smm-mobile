import 'package:final_project/blocs/listpagebloc/lp_event.dart';
import 'package:final_project/blocs/listpagebloc/lp_state.dart';
import 'package:final_project/services/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPageBloc extends Bloc<ListPageEvent, ListPageState> {
  @override
  ListPageState get initialState => Waiting();

  @override
  Stream<ListPageState> mapEventToState(ListPageEvent event) async* {
    if (event is SearchByName) {
      yield Loading();
      try {
        final result =
            await DioService().fetchById((event as SearchByName).name, 'name');
        yield Success(result);
      } catch (e) {
        yield Error(e);
      }
    } else if (event is SearchByQrId) {
      yield Loading();
      try {
        final result =
            [await DioService().fetchById((event as SearchByQrId).id, 'qr')];
        yield Success(result);
      } catch (e) {
        yield Error(e);
      }
    } else if (event is SearchByNfcId) {
      yield Loading();
      try {
        final result =
            [await DioService().fetchById((event as SearchByNfcId).id, 'nfc')];
        yield Success(result);
      } catch (e) {
        yield Error(e);
      }
    }
  }
}

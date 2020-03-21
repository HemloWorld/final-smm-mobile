import 'package:final_project/pages/report_page.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:final_project/services/dio_service.dart';

class ListPageBloc {
  final _subject = BehaviorSubject();

  Stream get subject$ => _subject.stream;
  Sink get newSubject => _subject.sink;

  ListPageBloc._internal();

  static final ListPageBloc _bloc = ListPageBloc._internal();

  factory ListPageBloc() {
    return _bloc;
  }

  findByName(name) async {
    // ini maksudnya buat nandain kalau tombol udah dipencet dan perlu loading.
    newSubject.add('loading');

    // jalanin service, gaperlu array karena search by name return otomatis array
    var result = await DioService().fetchById(name, 'name');

    // kirim data ke bloc buat ditampilin
    newSubject.add(result);
  }

  // ini nyari data berdasarkan id, bisa nama, qr, id, nfc, tergantung kebutuhan.
  findById(id, type, context) async {
    // ini maksudnya buat nandain kalau tombol udah dipencet dan perlu loading.
    newSubject.add('loading');

    // jalanin service, dan harus dibuat array karena widget UserList
    // buatan kalian itu cuma terima Array dan fetchById selain by Name itu ga ngereturn array.
    var result = [await DioService().fetchById(id, type)];

    // kalau misal ga ditemukan, DioService cuma ngereturn 404
    // jadi ngechecknya pasti begini ga akan berubah
    if (result[0] == 404) {
      newSubject.add(404);
      return;
    }
    
    // scan qr sama id setelah scan harus munculin profilenya langsung kan
    // ini pasti kenal lah, wong ini nyomot dari punya kalian
    Navigator.push(
      context,
      MaterialPageRoute(
        // reportPage disuntikin data user yang di search supaya bisa dipake disana
        builder: (context) => ReportPage(result),
      ),
    );

    // kirim data ke bloc buat ditampilin
    newSubject.add(result);
  }

  dispose() {
    _subject?.close();
  }
}

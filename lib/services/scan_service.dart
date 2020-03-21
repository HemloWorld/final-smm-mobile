import 'package:qrscan/qrscan.dart' as scanner;

// Pake ini kalau perlu ngambil data pake qr/nfc.
class ScanService {
  nfc() async {
    //TODO : Add nfc functionality
  }

  qr() async {
    String result = await scanner.scan();
    return result;
  }
}

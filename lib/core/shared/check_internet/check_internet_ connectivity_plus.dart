import 'package:connectivity_plus/connectivity_plus.dart';

class CheckInternetConnectivity{




  Future<bool>  checkInternetConnection() async {

bool c=false;
  Connectivity().onConnectivityChanged.listen(( connectivityResult) {
      if (connectivityResult .contains( ConnectivityResult.mobile) ||
          connectivityResult .contains(ConnectivityResult.wifi)) {
        c= true;
      }
        c= false;
    }
    );
  print(c);
return c;



    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult .contains( ConnectivityResult.mobile) || connectivityResult .contains(ConnectivityResult.wifi)) {
    //   return true;
    // }
    //   return false;
  }
}

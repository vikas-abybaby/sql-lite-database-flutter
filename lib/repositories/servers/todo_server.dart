import 'dart:developer';

class TodoServer {
  static Future getData({bool? showLoader}) async {
    log("message  :- getData showLoader: $showLoader");
  }

  static Future addData({bool? showLoader}) async {
    log("message  :- addData \n showLoader: $showLoader ");
  }

  static Future editData({bool? showLoader}) async {
    log("message  :- editData  \n showLoader: $showLoader");
  }

  static Future deleteData({bool? showLoader}) async {
    log("message  :- deleteData  \n showLoader: $showLoader");
  }
}

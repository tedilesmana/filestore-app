import 'dart:convert';
import 'package:filestore/config.dart';
import 'package:filestore/core/widgets/custom_dialog.widget.dart';
import 'package:filestore/domain/models/global_response/global_response.model.dart';
import 'package:get/get.dart';

class FilterRepository {
  final env = ConfigEnvironments.getEnvironments()['env'];
  late GlobalResponse response;

  Future<GlobalResponse> foldResponse(result) async {
    result.fold(
      (l) {
        if (env != Environments.PRODUCTION) {
          Get.dialog(
            CustomDialogBox(
              descriptions: l,
              title: 'Info',
              text: 'OK',
            ),
          );
        }
        var failResponse = {
          "success": false,
          "message": "Terjadi Kesalahan",
          "data": json.decode(l.toString()),
        };

        response = GlobalResponse.fromJson(failResponse);
      },
      (r) {
        response = GlobalResponse.fromJson(json.decode(r.toString()));
      },
    );

    if (response.data is Map) {
      if (response.data.containsKey("original")) {
        var failResponse = {
          "success": false,
          "message": response.data["original"],
          "data": null
        };
        return GlobalResponse.fromJson(failResponse);
      } else {
        return response;
      }
    } else {
      return response;
    }
  }
}

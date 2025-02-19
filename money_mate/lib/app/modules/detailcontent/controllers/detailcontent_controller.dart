import 'package:get/get.dart';

class DetailcontentController extends GetxController {
  //TODO: Implement DetailcontentController

  var isExpandedList = <RxBool>[].obs;

  ExpandableListController(int itemCount) {
    isExpandedList.assignAll(List.generate(itemCount, (_) => false.obs));
  }

  void toggleExpand(int index) {
    isExpandedList[index].toggle();
  }
}

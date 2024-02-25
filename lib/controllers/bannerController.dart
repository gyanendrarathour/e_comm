import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BannerController extends GetxController{
  RxList<String> bannerUrls = RxList<String>([]);

  @override
  void onInit(){
    super.onInit();
    fetchBannerUrls();
  }

  //Fatch Banners
  Future<void> fetchBannerUrls() async{
    try{
      QuerySnapshot bannerSnapshot = await FirebaseFirestore.instance.collection('banners').get();
      if(bannerSnapshot.docs.isNotEmpty){
        bannerUrls.value = bannerSnapshot.docs.map((doc) => doc['imageUrl'] as String).toList();
      }
    }
    catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
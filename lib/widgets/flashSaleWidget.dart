import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/models/productModel.dart';
import 'package:e_comm/utils/appConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_card/image_card.dart';

class FlashSaleWidget extends StatelessWidget {
  const FlashSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('products')
            .where('isSale', isEqualTo: true)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error in syncing...'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                height: Get.height / 5,
                child: const Center(
                  child: CupertinoActivityIndicator(),
                ));
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('Data not found...'),
            );
          }
          if (snapshot.data != null) {
            return Container(
              height: Get.height / 5,
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    ProductModel productModel = ProductModel(
                        productId: snapshot.data!.docs[index]['productId'],
                        categoryId: snapshot.data!.docs[index]['categoryId'],
                        productName: snapshot.data!.docs[index]['productName'],
                        categoryName: snapshot.data!.docs[index]
                            ['categoryName'],
                        salePrice: snapshot.data!.docs[index]['salePrice'],
                        fullPrice: snapshot.data!.docs[index]['fullPrice'],
                        productImages: snapshot.data!.docs[index]
                            ['productImages'],
                        deliveryTime: snapshot.data!.docs[index]
                            ['deliveryTime'],
                        isSale: snapshot.data!.docs[index]['isSale'],
                        productDescription: snapshot.data!.docs[index]
                            ['productDescription'],
                        createdAt: snapshot.data!.docs[index]['createdAt'],
                        updatedAt: snapshot.data!.docs[index]['updatedAt']);
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            child: FillImageCard(
                              borderRadius: 20.0,
                              width: Get.width / 3.5,
                              heightImage: Get.height / 12.0,
                              imageProvider: CachedNetworkImageProvider(
                                  productModel.productImages[0]),
                              title: Center(
                                child: Text(
                                  productModel.productName,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              footer: Row(
                                children: [
                                  Text("Rs ${productModel.salePrice}"),
                                  const SizedBox(width: 2,),
                                  Text(
                                    productModel.fullPrice,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppConstant.appSecondaryColor,
                                        decoration: TextDecoration.lineThrough
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            );
          }
          return Container();
        });
  }
}

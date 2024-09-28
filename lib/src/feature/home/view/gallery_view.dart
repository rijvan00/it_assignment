import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/home/controller/image_controller.dart';
import 'package:flutter_riverpod_base/src/feature/home/view/widget/image_card.dart';
import 'package:get/get.dart';

class GalleryView extends StatelessWidget {
  GalleryView({Key? key}) : super(key: key);
  static const routePath = "/home";

  final ImageController imageController = Get.put(ImageController());
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      log(_scrollController.position.pixels.toString());
      log(_scrollController.position.maxScrollExtent.toString());
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !imageController.isLoading.value) {
        imageController.loadMoreImages();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gapopa.dev'),
      ),
      body: Obx(() {
        if (imageController.isLoading.value && imageController.images.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          shrinkWrap: true,
          controller: _scrollController,
          padding: const EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width ~/ 300,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: imageController.images.length,
          itemBuilder: (context, index) {
            return ImageItem(image: imageController.images[index]);
          },
        );
      }),
    );
  }
}

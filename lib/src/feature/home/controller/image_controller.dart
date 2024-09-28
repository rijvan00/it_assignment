import 'package:flutter_riverpod_base/src/feature/home/repository/image_repo.dart';
import 'package:flutter_riverpod_base/src/models/image.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  final ApiService _apiService = ApiService();
  var images = <ImageModel>[].obs;
  var page = 1;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  Future<void> fetchImages() async {
    if (isLoading.value) return;
    isLoading.value = true;
    try {
      List<ImageModel> newImages = await _apiService.fetchImages(page);
      images.addAll(newImages);
      page++;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void loadMoreImages() {
    fetchImages();
  }
}

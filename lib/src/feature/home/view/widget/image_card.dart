import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/models/image.dart';
import 'package:flutter_riverpod_base/src/utils/count_helper.dart';
import 'package:icons_plus/icons_plus.dart';

class ImageItem extends StatelessWidget {
  final ImageModel image;

  const ImageItem({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    bool isDesktop = width > 600;
    final imageUrl = isDesktop ? image.largeImageUrl : image.userImageUrl;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      '${formatNumber(image.views)} views',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      BoxIcons.bxs_heart_circle,
                      size: 40,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${image.likes}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

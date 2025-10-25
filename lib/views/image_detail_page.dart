import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:photo_view/photo_view.dart';
import '../models/image_item.dart';

class ImageDetailPage extends StatefulWidget {
  final List<ImageItem> images;
  final int initialIndex;
  const ImageDetailPage({super.key, required this.images, required this.initialIndex});

  @override
  State<ImageDetailPage> createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  late final PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.images;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(images[currentIndex].author),
      ),
      body: PhotoViewGallery.builder(
        pageController: _pageController,
        itemCount: images.length,
        builder: (context, index) {
          final img = images[index];
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(img.downloadUrl),
            heroAttributes: PhotoViewHeroAttributes(tag: img.id),
            minScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.covered * 3,
          );
        },
        onPageChanged: (index) => setState(() => currentIndex = index),
        scrollPhysics: const BouncingScrollPhysics(),
        backgroundDecoration: const BoxDecoration(color: Colors.black),
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

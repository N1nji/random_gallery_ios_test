import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../viewmodels/gallery_view_model.dart';
import '../views/image_detail_page.dart';
import '../widgets/shimmer_grid_item.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<GalleryViewModel>(context, listen: false).fetchImages(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GalleryViewModel>(context);
    final images = viewModel.images;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final gradient =
        isDark
            ? const LinearGradient(
              colors: [Color(0xFF0F172A), Color(0xFF1F2A44)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
            : const LinearGradient(
              colors: [Color(0xFFF7F9FC), Color(0xFFEAF0FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria Aleatória'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: viewModel.refresh,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child:
                  viewModel.isLoading
                      ? GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,  
                              childAspectRatio: 0.8,
                            ),
                        itemCount: 6,
                        itemBuilder: (_, __) => const ShimmerGridItem(),
                      )
                      : viewModel.error != null
                      ? ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          const SizedBox(height: 40),
                          Center(
                            child: Text(
                              viewModel.error!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: viewModel.fetchImages,
                              child: const Text('Tentar novamente'),
                            ),
                          ),
                        ],
                      )
                      : GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.8,
                            ),
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          final image = images[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => ImageDetailPage(
                                        images: images,
                                        initialIndex: index,
                                      ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: image.id,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: image.downloadUrl,
                                      fit: BoxFit.cover,
                                      placeholder:
                                          (_, __) => const ShimmerGridItem(
                                            borderRadius: 16,
                                          ),
                                      errorWidget:
                                          (_, __, ___) => Container(
                                            color: Colors.grey,
                                            child: const Icon(Icons.error),
                                          ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Colors.black.withOpacity(0.6),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                        child: const Text(''),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Colors.black.withOpacity(0.6),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                        child: Text(
                                          image.author,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageItem {
  final String id;
  final String author;
  final String downloadUrl;
  final int width;
  final int height;

  ImageItem({
    required this.id, 
    required this.author, 
    required this.downloadUrl,
    required this.width,
    required this.height,
    });

  factory ImageItem.fromJson(Map<String, dynamic> json) {
    return ImageItem(
      id: json['id'] as String,
      author: json['author'] as String,
      downloadUrl: json['download_url'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
    );
  }
}
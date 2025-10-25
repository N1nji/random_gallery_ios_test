import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/image_item.dart';

class GalleryViewModel extends ChangeNotifier {
  List<ImageItem> images = [];
  bool isLoading = false;
  bool isRefreshing = false;
  String? error;

  final String _endpoint = 'https://picsum.photos/v2/list?limit=10';

  Future<void> fetchImages() async {
  isLoading = true;
  error = null;
  notifyListeners();

  try {
  final response = await http.get(Uri.parse(_endpoint));
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body) as List<dynamic>;
    images = data.map((j) => ImageItem.fromJson(j as Map<String, dynamic>)).toList();
  } else {
    error = 'Erro ao buscar imagens (${response.statusCode})';
  }
} catch (e) {
    error = 'Erro de rede: $e';
}

  isLoading = false;
  notifyListeners();
  }

  Future<void> refresh() async {
    isRefreshing = true;
    notifyListeners();
    await fetchImages();
    isRefreshing = false;
    notifyListeners();
  }
}
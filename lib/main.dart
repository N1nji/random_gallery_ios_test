import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/gallery_view_model.dart';
import 'views/gallery_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GalleryViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Galeria Random',
        themeMode: ThemeMode.system,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF2563EB),
            secondary: Color(0xFF7C3AED),
            background: Color(0xFFF7F7FC),
            surface: Color(0xFFFFFFFF),
            onSurface: Colors.black,
            surfaceVariant: Color(0xFFE6E9F2),
            onSurfaceVariant: Colors.black54,
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF60A5FA),
            secondary: Color(0xFF9F7AEA),
            background: Color(0xFF0B1220),
            surface: Color(0xFF101826),
            onSurface: Colors.white,
            surfaceVariant: Color(0xFF1B2432),
            onSurfaceVariant: Colors.white70,
          ),
        ),
        home: const GalleryPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGridItem extends StatelessWidget {
  final double borderRadius;
  const ShimmerGridItem({super.key, this.borderRadius = 16});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceVariant,
      highlightColor: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.2),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}



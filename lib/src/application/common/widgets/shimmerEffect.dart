import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final int itemCount;
  final double height;

  const ShimmerEffect({Key? key, this.itemCount = 5,  this.height = 120}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

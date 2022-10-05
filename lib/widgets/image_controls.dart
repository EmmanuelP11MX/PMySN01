import 'package:flutter/material.dart';

class ImageControls extends StatelessWidget {
  final Widget child;
  const ImageControls({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    //const edgeInsets = EdgeInsets.only(240.0, 0.0, 90.0, 0.0);
    const edgeInsets = EdgeInsets.fromLTRB(300, 5, 30, 0);
    //const edgeInsets = EdgeInsets.symmetric(horizontal: 100);
    return Padding(
      padding: edgeInsets,
      child: Container(
        width: double.infinity,
        decoration: _createImageShape(),
        child: child,
      ),
    );
  }

  BoxDecoration _createImageShape() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 15, offset: Offset(0, 5))
          ]);
}

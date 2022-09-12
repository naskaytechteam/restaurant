import 'package:flutter/material.dart';

class ShadowIcon extends StatelessWidget {
  final VoidCallback iconClick;
  final IconData? icon;
  final bool isImage;
  final String? imageUrl;

  const ShadowIcon({
    required this.iconClick,
      this.imageUrl,
      this.isImage = false,
      this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return InkWell(
      onTap: iconClick,
      child: Container(
        height: height * 0.06,
        width: width * 0.13,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
        ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        child: isImage
            ? Image.asset(
                imageUrl!,
                fit: BoxFit.cover,
              )
            : Icon(
                icon,
                size: 20,
                color: Colors.black,
              ),
      ),
    );
  }
}

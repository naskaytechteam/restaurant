import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageDialog extends StatelessWidget {
  final Function selectImageFrom;

  const SelectImageDialog({required this.selectImageFrom, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text('Choose Image from :'),
      content: Material(
        child: SizedBox(
          height: height * 0.15,
          width: width * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              iconWidget(Icons.camera_alt_outlined, ImageSource.camera),
              iconWidget( Icons.photo, ImageSource.gallery),

            ],
          ),
        ),
      ),
    );
  }
  Widget iconWidget(IconData iconData,ImageSource imageSource){
    return  InkWell(
        onTap: () =>selectImageFrom(imageSource),
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.black26,
          child: Icon(
            iconData,
            size: 50,
            color: Colors.white,
          ),
        ));
  }

}

import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '/models/customer.dart';
import '/providers/authentication.dart';
import '/widgets/custom_app_bar.dart';
import '/widgets/select_image_dialog.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _profileImage;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();



  @override
  void initState() {
    super.initState();
    addCostumerData();
  }
  @override
  void dispose() {
    _name.dispose();
    _lastName.dispose();
    _location.dispose();
    _phone.dispose();
    _email.dispose();
    log('edit Profile all controller dispose ');
    super.dispose();
  }

  Future<void> addCostumerData() async {
    Authentication authentication =
        Provider.of<Authentication>(context, listen: false);
    Customer customer = await authentication.getCurrentUserData();
    setState(() {
      _name.text = customer.name;
      _email.text = customer.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            CustomAppBar(
                firstIcon: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
                centerText: 'Edit Profile',
                secondIcon: const Icon(
                  Icons.check,
                  size: 20,
                  color: Colors.black,
                ),
                firstIconClick: () {
                  Navigator.of(context).pop();
                },
                secondIconClick: () {}),

            SizedBox(
              height: height * 0.01,
            ),
            profilePicture(height, width),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              'PUBLIC INFORMATION',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            textField('First Name', height, width, controller: _name),
            SizedBox(
              height: height * 0.03,
            ),
            textField('Last Name', height, width, controller: _lastName),
            SizedBox(
              height: height * 0.03,
            ),
            textField('Location', height, width, controller: _location),
            SizedBox(
              height: height * 0.03,
            ),
            textField('Phone', height, width, controller: _phone),
            SizedBox(
              height: height * 0.03,
            ),
            textField('Email', height, width, controller: _email),
          ],
        ),
      ),
    ));
  }

  Widget textField(String label, double height, double width,
      {TextEditingController? controller}) {
    return SizedBox(
      width: width,
      height: height * 0.08,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            label: Text(label),
            focusColor: Colors.black,
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.black)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.black))),
      ),
    );
  }

  Widget profilePicture(double height, double width) {
    return Container(
      height: height * 0.15,
      width: width,
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          showSelectImageDialog(height, width);
        },
        child: CircleAvatar(
          backgroundImage:
              _profileImage != null ? FileImage(_profileImage!) : null,
          radius: 55,
          child: _profileImage != null
              ? null
              : const Icon(
                  Icons.person,
                  size: 50,
                ),
        ),
      ),
    );
  }

  void showSelectImageDialog(double height, double width) {
    showDialog(
        context: context,
        builder: (_) {
          return SelectImageDialog(selectImageFrom: selectImageFrom);
        });
  }

  void selectImageFrom(ImageSource imageSource) async {
    Navigator.pop(context);
    XFile? xFile = await ImagePicker().pickImage(source: imageSource);
    if (xFile != null) {
      setState(() {
        _profileImage = File(xFile.path);
      });
    }
  }
}

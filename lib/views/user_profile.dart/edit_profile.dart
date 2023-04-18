import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tagumpai/services/storage.dart';
import 'package:tagumpai/widgets/button_widget.dart';
import 'package:tagumpai/widgets/form_widget.dart';

import '../../constants/global_variables.dart';
import '../../widgets/text_widget.dart';

class EditProfile extends StatefulWidget {
  static String route = "editProfile";
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
  }

  void selectImage() async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (_file != null) {
      Uint8List im = await _file.readAsBytes();
      setState(() {
        _image = im;
      });
    }
    print("No image selected");
  }

  void updateProfile() async {
    await StorageServices().uploadImagetoStorage("profilePics", _image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tBlueColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 200,
              ),
              Container(
                height: 130,
                decoration: BoxDecoration(
                  color: tBlueColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              Positioned.fill(
                child: GestureDetector(
                  onTap: selectImage,
                  child: _image != null
                      ? Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: MemoryImage(_image!),
                            ),
                          ),
                        )
                      : Image.asset(tUserBanner),
                ),
                // child:  _image != null
                //     ? Container(
                //         decoration: BoxDecoration(
                //           image: DecorationImage(
                //             image: MemoryImage(_image!),
                //           ),
                //         ),
                //       )
                //     : Image.asset(tUserBanner),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FormWidget(
                            prompText: "Edit Name",
                            controller: _firstNameController,
                            hintText: "First Name",
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: FormWidget(
                            controller: _lastNameController,
                            hintText: "Last Name",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FormWidget(
                      controller: _emailController,
                      hintText: "youremail@email.com",
                      prompText: "Edit Email Address",
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    ButtonWidget(
                      label: "Update Profile",
                      onPressed: updateProfile,
                      backgroundColor: tBlueColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

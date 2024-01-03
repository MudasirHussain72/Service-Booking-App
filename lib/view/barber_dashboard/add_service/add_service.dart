import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fyp/res/color.dart';
import 'package:fyp/res/component/input_text_field.dart';
import 'package:fyp/res/component/round_button.dart';
import 'package:fyp/utils/utils.dart';
import 'package:fyp/view_model/barber_dashboard/add_service/add_service_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddServicesScreen extends StatefulWidget {
  const AddServicesScreen({super.key});

  @override
  State<AddServicesScreen> createState() => _AddServicesScreenState();
}

class _AddServicesScreenState extends State<AddServicesScreen> {
  final _formkey = GlobalKey<FormState>();
  final serviceNameController = TextEditingController();
  final priceController = TextEditingController();
  final serviceNameFocusNode = FocusNode();
  final priceFocusNode = FocusNode();
  File? imageFile;
  getImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 20);
    if (pickedFile != null) {
      log(pickedFile.path);
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size * 1;
    return Scaffold(
      appBar: AppBar(title: const Text('Add service')),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 10),
              child: Form(
                  key: _formkey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: size.height / 3.5,
                                width: size.width / 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.otpHintColor),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    clipBehavior: Clip.antiAlias,
                                    child: imageFile == null
                                        ? const Center(
                                            child: Text('Pick an image'))
                                        : Image.file(imageFile!,
                                            width: 170,
                                            height: 170,
                                            fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                  width: size.width / 2.5,
                                  child: RoundButton(
                                      title: 'Pick Image',
                                      onPress: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                  content: SizedBox(
                                                      height: 120,
                                                      child: Column(children: [
                                                        ListTile(
                                                            onTap: () {
                                                              getImage(
                                                                  context,
                                                                  ImageSource
                                                                      .camera);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            leading: const Icon(
                                                                Icons.camera,
                                                                color: AppColors
                                                                    .primaryIconColor),
                                                            title: const Text(
                                                                'Camera')),
                                                        ListTile(
                                                            onTap: () {
                                                              getImage(
                                                                  context,
                                                                  ImageSource
                                                                      .gallery);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            leading: const Icon(
                                                                Icons.image,
                                                                color: AppColors
                                                                    .primaryIconColor),
                                                            title: const Text(
                                                                'Gallery'))
                                                      ])));
                                            });
                                      }))
                            ]),
                        SizedBox(height: size.height * .025),
                        InputTextField(
                            myController: serviceNameController,
                            focusNode: serviceNameFocusNode,
                            onFiledSubmittedValue: (newValue) =>
                                Utils.fieldFocus(context, serviceNameFocusNode,
                                    priceFocusNode),
                            onValidator: (value) =>
                                value.isEmpty ? "Enter service name" : null,
                            keyBoardType: TextInputType.name,
                            hint: 'Service Name',
                            obscureText: false),
                        InputTextField(
                            myController: priceController,
                            focusNode: priceFocusNode,
                            onFiledSubmittedValue: (newValue) {},
                            onValidator: (value) =>
                                value.isEmpty ? "Enter price" : null,
                            keyBoardType: TextInputType.number,
                            hint: 'Price',
                            obscureText: false),
                        ChangeNotifierProvider(
                          create: (context) => AddServiceController(),
                          child: Consumer<AddServiceController>(
                              builder: (context, provider, child) =>
                                  RoundButton(
                                      loading: provider.loading,
                                      title: 'Confirm',
                                      onPress: () {
                                        if (imageFile != null &&
                                            _formkey.currentState!.validate()) {
                                          AddServiceController().postService(
                                              context,
                                              serviceNameController.text
                                                  .trim()
                                                  .toString(),
                                              priceController.text
                                                  .trim()
                                                  .toString(),
                                              imageFile);
                                        } else {
                                          Utils.toastMessage(
                                              'Please pick an Image or Data incorrect');
                                        }
                                      })),
                        )
                      ])))),
    );
  }
}

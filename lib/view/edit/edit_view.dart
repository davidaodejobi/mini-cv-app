// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cv_app/controller/home_controller.dart';
import 'package:cv_app/utils/extensions.dart';
import 'package:cv_app/view/edit/widget/txf_w_header.dart';
import 'package:flutter/material.dart';

class EditView extends StatefulWidget {
  const EditView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  late TextEditingController _bioController;
  late TextEditingController _nameController;
  late TextEditingController _slackUserNameController;
  late TextEditingController _imageUrlController;

  @override
  void initState() {
    _bioController = TextEditingController(text: widget.controller.user.bio);
    _nameController = TextEditingController(text: widget.controller.user.name);
    _slackUserNameController =
        TextEditingController(text: widget.controller.user.slackUserName);
    _imageUrlController =
        TextEditingController(text: widget.controller.user.imageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _bioController.dispose();
    _nameController.dispose();
    _slackUserNameController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            TextFormInputWithHeader(
              header: 'Bio',
              minLines: 3,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              controller: _bioController,
              textInputAction: TextInputAction.done,
              onChanged: (value) => widget.controller.editDetails(
                bio: value,
                name: _nameController.text,
                slackUserName: _slackUserNameController.text,
                imageUrl: _imageUrlController.text,
              ),
            ),
            20.h,
            TextFormInputWithHeader(
              header: 'Name',
              controller: _nameController,
              textInputAction: TextInputAction.done,
              onChanged: (value) => widget.controller.editDetails(
                bio: _bioController.text,
                name: value,
                slackUserName: _slackUserNameController.text,
                imageUrl: _imageUrlController.text,
              ),
            ),
            20.h,
            TextFormInputWithHeader(
              header: 'Slack Username',
              controller: _slackUserNameController,
              textInputAction: TextInputAction.done,
              onChanged: (value) => widget.controller.editDetails(
                bio: _bioController.text,
                name: _nameController.text,
                slackUserName: value,
                imageUrl: _imageUrlController.text,
              ),
            ),
            20.h,
            TextFormInputWithHeader(
              header: 'Image URL',
              controller: _imageUrlController,
              textInputAction: TextInputAction.done,
              onChanged: (value) => widget.controller.editDetails(
                bio: _bioController.text,
                name: _nameController.text,
                slackUserName: _slackUserNameController.text,
                imageUrl: value,
              ),
            )
          ],
        ),
      ),
    );
  }
}

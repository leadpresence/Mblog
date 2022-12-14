import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mlog/app/view/login/login_view.dart';
import 'package:mlog/app/view/register/register_view_mode.dart';

import '../../common/utils/utils.dart';
import '../components/custom_l_button.dart';
import '../components/custom_text_field.dart';

class RegisterView extends GetView<RegisterViewModel> {
  /// Registers new user to the blog platform

  @override
  final RegisterViewModel viewModel = Get.put(RegisterViewModel());

  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        key: viewModel.registerFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Register",
                  style: TextStyle(fontSize: 25.0, color: Colors.black),
                )
              ],
            ),
            const Gap(20),
            const Divider(
              height: 2.0,
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 4),
              child: CustomTextField(
                hintText: "Name",
                keyboardType: TextInputType.text,
                textController: viewModel.nameCtrl,
                onChanged: (v) {
                  if (v.isNotEmpty) viewModel.errorName();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    viewModel.errorName.value,
                    style: errorTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
              child: CustomTextField(
                hintText: "Email",
                keyboardType: TextInputType.text,
                textController: viewModel.emailCtrl,
                onChanged: (v) {
                  if (v.isNotEmpty) viewModel.errorEmail();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    viewModel.errorEmail.value,
                    style: errorTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 28, 4),
              child: CustomTextField(
                isPasswordField: true,
                hintText: "Password",
                textController: viewModel.passwordCtrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    viewModel.errorPassword.value,
                    style: errorTextStyle,
                  ),
                ],
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: CustomButton(    buttonColor: const Color(0xFFE1BEE7),
                  buttonTextColor: Colors.black,
                  isLoading: viewModel.isLoading.value,
                  buttonText: "Submit",
                  onPressed: () {
                    viewModel.registrationFormValidator(key);

                  },
                ),
              ),
            ),
            const Gap(14),

            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.mulish(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xff12121D).withOpacity(.6),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(() =>  LoginView());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mulish(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xff262254),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    ))));
  }
}

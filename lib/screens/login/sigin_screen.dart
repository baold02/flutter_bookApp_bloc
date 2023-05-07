import 'package:another_flushbar/flushbar.dart';
import 'package:book_app/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/button.dart';
import '../../widget/text_input_widget.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({Key? key}) : super(key: key);

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  late TextEditingController textEditingControllerName;
  late TextEditingController textEditingControllerphone;
  late TextEditingController textEditingControllerAdress;
  late TextEditingController textEditingControllerImage;
  late TextEditingController textEditingControllerPass;

  @override
  void initState() {
    textEditingControllerName = TextEditingController();
    textEditingControllerphone = TextEditingController();
    textEditingControllerAdress = TextEditingController();
    textEditingControllerImage = TextEditingController();
    textEditingControllerPass = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sign in',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          InputText(
              title: 'Tên đăng nhập',
              textEditingController: textEditingControllerName,
              hintText: 'Nhập tên đăng nhập'),
          const SizedBox(
            height: 15,
          ),
          InputText(
              title: 'pass',
              textEditingController: textEditingControllerPass,
              hintText: 'Nhập gmail của bạn'),
          const SizedBox(
            height: 15,
          ),
          InputText(
              title: 'phone',
              textEditingController: textEditingControllerphone,
              hintText: 'Nhập mật khẩu của bạn'),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 15,
          ),
          InputText(
              title: 'Image link',
              textEditingController: textEditingControllerImage,
              hintText: 'Nhập mật khẩu của bạn'),
          const SizedBox(
            height: 15,
          ),
          InputText(
              title: 'Địa chỉ',
              textEditingController: textEditingControllerAdress,
              hintText: 'Nhập mật khẩu của bạn'),
          const SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                if (textEditingControllerAdress.text.isEmpty ||
                    textEditingControllerName.text.isEmpty ||
                    textEditingControllerPass.text.isEmpty ||
                    textEditingControllerphone.text.isEmpty||
                    textEditingControllerImage.text.isEmpty) {
                  Flushbar(
                    margin: const EdgeInsets.all(10),
                    icon: Image.asset(
                      'images/cancel.png',
                      width: 40,
                      height: 48,
                    ),
                    mainButton: Image.asset(
                      'images/close.png',
                      width: 30,
                      height: 30,
                    ),
                    flushbarPosition: FlushbarPosition.TOP,
                    borderRadius: BorderRadius.circular(10),
                    borderColor: Colors.orangeAccent,
                    titleText: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: const Text('Thất bại',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
                    messageText: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: const Text(
                          'Không có dữ liệu',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.white54,
                  ).show(context);
                }
                BlocProvider.of<UserBloc>(context).add(AddUser(textEditingControllerName.text.trim(), textEditingControllerPass.text.trim(),textEditingControllerphone.text.trim(), textEditingControllerImage.text.trim(), textEditingControllerAdress.text.trim()));

                // FirebaseAuth.instance
                //     .createUserWithEmailAndPassword(
                //     email: textEditingControllerGmail.text,
                //     password: textEditingControllerPass.text)
                //     .then((value) {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const LoginScreen(),
                //       ));
                // }).onError((error, stackTrace) {
                //   print('error');
                // });
              },
              child: const CustomButton(text: 'Sign up'))
        ],
      ),
    );
  }
}
import 'package:another_flushbar/flushbar.dart';
import 'package:book_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:book_app/screens/home_screen.dart';
import 'package:book_app/screens/login/sigin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/button.dart';
import '../../widget/text_input_widget.dart';
import '../navigator_tab.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthBloc authBloc =   AuthBloc(AuthInitial());

  String? _selected;
  final List<Map> _myJson = [
    {'id': '1', 'image': 'images/vietnam.png', 'name': 'Việt nam'},
    {'id': '2', 'image': 'images/laos.png', 'name': 'Laos'},
    {'id': '3', 'image': 'images/english.png', 'name': 'English'}
  ];

  late TextEditingController textEditingControllerMk;
  late TextEditingController textEditingControllerTk;

  @override
  void initState() {
    // TODO: implement initState
    textEditingControllerMk = TextEditingController();
    textEditingControllerTk = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/user.png'),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: const Text("Laos",
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.bold)),
                              ),
                              const Text("Edu",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold))
                            ],
                          ),
                        ],
                      ),
                      Container(
                          height: 35,
                          padding: const EdgeInsets.all(5),
                          width: 140,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Center(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  hint: Container(
                                    margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'images/vietnam.png',
                                          width: 15,
                                          height: 15,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        const Text('Việt nam',
                                            style: TextStyle(fontSize: 11))
                                      ],
                                    ),
                                  ),
                                  value: _selected,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selected = newValue;
                                    });
                                  },
                                  items: _myJson.map((Item) {
                                    return DropdownMenuItem(
                                        value: Item['id'].toString(),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              Item['image'],
                                              width: 15,
                                              height: 15,
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              Item['name'],
                                              style: const TextStyle(fontSize: 11),
                                            )
                                          ],
                                        ));
                                  }).toList(),
                                ),
                              )))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Center(
                  child: Text(
                    'ĐĂNG NHẬP',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                InputText(
                  hintText: 'Nhập tên đăng nhập',
                  title: 'Tên đăng nhập',
                  textEditingController: textEditingControllerTk,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputText(
                  hintText: 'Nhập mật khẩu',
                  title: 'Mật khẩu',
                  textEditingController: textEditingControllerMk,
                  checkIcon: true,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    // onTap: () {
                    //   showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return const DialogForgetPass();
                    //     },
                    //   );
                    // },
                    child: const Text(
                      'Quên mật khẩu?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if (textEditingControllerTk.text.isEmpty ||
                        textEditingControllerMk.text.isEmpty) {
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
                    } else {

                      authBloc.add(LoginEvent(textEditingControllerTk.text, textEditingControllerMk.text));
                      // FirebaseAuth.instance
                      //     .signInWithEmailAndPassword(
                      //     email: textEditingControllerTk.text,
                      //     password: textEditingControllerMk.text)
                      //     .then((value) {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => const NavivatorTabCustom(),
                      //       ));
                      // }).onError((error, stackTrace) {
                      //   Flushbar(
                      //     margin: const EdgeInsets.all(10),
                      //     icon: Image.asset(
                      //       'images/cancel.png',
                      //       width: 40,
                      //       height: 48,
                      //     ),
                      //     mainButton: Image.asset(
                      //       'images/close.png',
                      //       width: 30,
                      //       height: 30,
                      //     ),
                      //     flushbarPosition: FlushbarPosition.TOP,
                      //     borderRadius: BorderRadius.circular(10),
                      //     borderColor: Colors.orangeAccent,
                      //     titleText: Container(
                      //         margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      //         child: const Text('Thất bại',
                      //             style: TextStyle(
                      //                 color: Colors.black,
                      //                 fontSize: 18,
                      //                 fontWeight: FontWeight.bold))),
                      //     messageText: Container(
                      //         margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      //         child: const Text(
                      //           'Tài khoản hoặc mật khẩu không đúng',
                      //           style: TextStyle(color: Colors.grey, fontSize: 12),
                      //         )),
                      //     duration: const Duration(seconds: 3),
                      //     backgroundColor: Colors.orangeAccent,
                      //   ).show(context);
                      // });
                    }
                  },

                  child: Row(
                  children: [
                    const CustomButton(
                      text: 'Đăng nhập',
                    ),
                    BlocConsumer(
                        bloc: authBloc,
                        listener: (context, state) {
                          if(state is LoginState){
                            if(state.res.statusCode == 200){
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                            }else{
                              print('error');
                            }
                          }
                        },
                        builder: (context, state) {
                          return Row(
                            children: [

                            ],
                          );
                        },)
                  ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 140,
                      child: Divider(
                        height: 4,
                        thickness: 1,
                      ),
                    ),
                    Center(child: Text('Hoặc')),
                    SizedBox(
                      width: 140,
                      child: Divider(
                        thickness: 1,
                        height: 4,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  // child: InkWell(
                  //   onTap: () async {
                  //     await sigInWithGoogle();
                  //     if (mounted) {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => HomeScreen(),
                  //           ));
                  //     }
                  //   },
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Image.asset('images/google.png'),
                  //       const SizedBox(
                  //         width: 8,
                  //       ),
                  //       const Text('Đăng nhập với google')
                  //     ],
                  //   ),
                  // ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(60, 130, 20, 0),
                  child: Row(
                    children: [
                      const Text('Chưa có tài khoản Ulearn?'),
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                          child: const Text(
                            'Đăng ký tài khoản',
                            style: TextStyle(color: Colors.orangeAccent),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignScreen(),
                                ));
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

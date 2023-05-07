import 'package:flutter/material.dart';
class InputText extends StatefulWidget {
  const InputText(
      {Key? key,
        required this.title,
        required this.textEditingController,
        required this.hintText, this.checkIcon,  this.required,})
      : super(key: key);
  final bool? required;
  final String title;
  final TextEditingController textEditingController;
  final String hintText;
  final bool? checkIcon;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool _showPass = false;


  showRequiredInput(){
    if(widget.required != null && widget.required == true){
      return const Text('*',
        style: TextStyle(
            color: Colors.red
        ),
      );
    }
    return Container();

  }

  showIcon(){
    if(widget.checkIcon == true){
      return IconButton(onPressed:() {
        showPass();
      }, icon: _showPass ? const Icon(Icons.remove_red_eye) : const Icon(Icons.remove_red_eye_outlined),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20,0,20,0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  )),
              const SizedBox(width: 4,),
              showRequiredInput()
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: TextField(
              obscureText: _showPass,
              controller: widget.textEditingController,
              decoration: InputDecoration(
                  suffixIcon: showIcon(),
                  suffixIconColor: Colors.grey,
                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  hintText: widget.hintText,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder:  const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orangeAccent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
            ),
          )
        ],
      ),
    );
  }

  void showPass(){
    setState(() {
      _showPass = !_showPass;
    });
  }
}

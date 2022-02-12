import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iphone_memo/data/memo_class.dart';

import '../color.dart';


class AddPage extends StatefulWidget {
  Memo memoList;
   AddPage({Key? key, required this.memoList}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController memoController = TextEditingController();
  Memo get memo => widget.memoList;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: DoryColors.primaryMeterialColor,
        appBar: AppBar(
          backgroundColor: DoryColors.primaryColor,
          actions: [
            IconButton(
              onPressed: (){},
              icon: const Icon(CupertinoIcons.camera_fill,color: Color(DoryColors.textColor),),
            ),
            TextButton(
              onPressed: () {
                if(titleController.text.isEmpty){
                  return;
                }
                if(memoController.text.isEmpty){
                  return;
                }
                memo.title = titleController.text;
                memo.memo = memoController.text;
                Navigator.of(context).pop(memo);
              },
              child: const Text("완료",
                style: TextStyle(
                  color: Color(DoryColors.textColor),
                  fontSize: 18,
                ),),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                TextFormField(
                  minLines: 2,
                  controller: titleController,
                  autofocus: true,
                  style: const TextStyle(
                    height: 2,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                  maxLines: 10,
                  cursorColor: Color(DoryColors.textColor),
                  decoration:  InputDecoration(
                    hintText: "${memo.date}",
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    focusColor: Colors.white,
                    border: UnderlineInputBorder(
                    ),
                  ),
                ),
                TextFormField(
                  maxLength: 10,
                  controller: memoController,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  maxLines: 5,
                  cursorColor: Color(DoryColors.textColor),
                  decoration:  const InputDecoration(
                    focusColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

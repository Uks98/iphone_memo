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
        appBar: CupertinoNavigationBar(
          automaticallyImplyMiddle: true,
          backgroundColor: DoryColors.primaryMeterialColor,
          trailing: TextButton(
              onPressed: () {
                if(titleController.text.isEmpty){
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
          leading: const Padding(
            padding: EdgeInsets.only(top: 7.0),
            child: Text(
              "메모",
              style: TextStyle(
                color: Color(DoryColors.textColor),
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
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
                    fontSize: 20,
                  ),
                  maxLines: 10,
                  cursorColor: Color(DoryColors.textColor),
                  decoration:  InputDecoration(
                    hintText: "${memo.date}일",
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
                  maxLines: 10,
                  cursorColor: Color(DoryColors.textColor),
                  decoration:  InputDecoration(
                    focusColor: Colors.white,
                    border: UnderlineInputBorder(
                    ),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iphone_memo/component/constant.dart';
import 'package:iphone_memo/data/memo_class.dart';
import 'package:iphone_memo/data/utils.dart';
import 'package:iphone_memo/pages/add_page.dart';

import '../color.dart';

class MemoMain extends StatefulWidget {
  MemoMain({Key? key}) : super(key: key);

  @override
  State<MemoMain> createState() => _MemoMainState();
}

class _MemoMainState extends State<MemoMain> {
  List<Memo> memoList = [];

  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: DoryColors.primaryMeterialColor,
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Opacity(opacity: 0.0,child: Text("        "),),
               Text("${memoList.length}개",style:TextStyle(color: DoryColors.textColor2,)),
              IconButton(onPressed: ()async{
                String formatDate = DateFormat('yyyy년 MM월 dd일 HH:mm분').format(dateTime);
               final m = await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddPage(
                  memoList: Memo(
                    title: "",
                    memo: "",
                    image: "",
                    id: 0,
                    date: formatDate,
                  ),
                )));
               setState(() {
                 memoList.add(m);
               });
              }, icon: const Icon(CupertinoIcons.pencil_outline,color:DoryColors.textColor2,))
            ],
          ),
        ),
      ),
      backgroundColor: DoryColors.primaryMeterialColor,
      appBar: const CupertinoNavigationBar(
        automaticallyImplyMiddle: true,
        backgroundColor: DoryColors.primaryMeterialColor,
        middle: Text(
          "메모",
          style: TextStyle(
            color: DoryColors.textColor2,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
              child: Text(
                "메모",
                style: TextStyle(color: DoryColors.textColor2, fontSize: 35),
              ),
            ),
            SizedBox(
              height: 520,
              child: memoList.isEmpty? Container():ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onLongPress: (){
                          print("아이템 제거");
                          memoList.remove(memoList[index]);
                          setState(() {
                          });
                        },
                        child: Container(height: 60, width: 300, child: memoCard(memoList[index])));
                  },
                  itemCount: memoList.length,
                  separatorBuilder: (ctx, idx) {
                    return Divider(
                      thickness: 1,
                      color: Colors.grey[700],
                      indent: 30,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget memoCard(Memo memo) {
    return Container(
      margin: cardPadding,
      child: Stack(
        children: [
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    "${memo.title}",
                    style: TextStyle(color: DoryColors.textColor2),
                  ),
                  SizedBox(
                    height: smallSpace,
                  ),
                  Text("${memo.date}",
                      style: TextStyle(color: DoryColors.textColor2)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 300.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  width: 50,
                  height: 50,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

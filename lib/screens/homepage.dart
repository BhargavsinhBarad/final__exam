import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../globals.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Global.formkey.currentState!.save();
              },
              icon: Icon(CupertinoIcons.check_mark)),
          IconButton(
            onPressed: () {
              Global.task.isEmpty;
            },
            icon: Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      floatingActionButton: CircleAvatar(
        child: IconButton(
          onPressed: () {
            setState(() {
              Global.Textcontrollers1.add(TextEditingController());
            });
          },
          icon: Icon(Icons.add),
        ),
      ),
      body: Form(
        key: Global.formkey,
        child: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.all(10),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  "Enter your today's task ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                ...List.generate(
                  Global.Textcontrollers1.length,
                  (index) => getTextfild(i: index),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('viewpage');
                  },
                  child: Container(
                    height: 40,
                    width: 130,
                    padding: EdgeInsets.all(8),
                    child: Center(child: Text("VIEW")),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }

  Widget getTextfild({required int i}) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: TextFormField(
            onSaved: (val) {
              Global.task.add(val);
            },
            controller: Global.Textcontrollers1[i],
            decoration: InputDecoration(
              hintText: "Enter your task ",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              Global.Textcontrollers1.removeAt(i);
            });
          },
          icon: Icon(Icons.remove_circle),
        ),
      ],
    );
  }
}

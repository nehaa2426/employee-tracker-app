// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ib_cs_hl_ia3/screens/home_screen.dart';
import 'package:ib_cs_hl_ia3/screens/student_details_displayed.dart';
import 'package:ib_cs_hl_ia3/screens/student_information.dart';

StudentInformation studentToDisplay = new StudentInformation();
List allStudentsForSearch = [];
final TextEditingController searchController = TextEditingController();

class SearchStudents extends StatefulWidget {
  const SearchStudents({Key? key}) : super(key: key);

  @override
  _SearchStudentsState createState() => _SearchStudentsState();
}

class _SearchStudentsState extends State<SearchStudents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
              Text("Type in Student Name", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,)),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Enter Student Name");
                      }
                    },
                    onSaved: (value) {
                      searchController.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: "Search Student")),
              ),
              SizedBox(height: 300),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Material(
                    color: Colors.blueGrey,
                    elevation: 10,
                    borderRadius: BorderRadius.circular(50),
                    child: MaterialButton (
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () {
                          studentToDisplay = new StudentInformation();
                          allStudentsForSearch = [];
                          searchForStudent(searchController.text);
                          searchController.text = "";
                          // call the search function
                        },
                        child: Text("Search Student", style: TextStyle(color: Colors.white))
                    )
                ),
              )
            ],
          ),
        )
      // drawer: Drawer(),
    );
  }
  void initializeNonDBList() async {

  }
  void searchForStudent(String name) async {
    bool found = false;
    await FirebaseFirestore.instance.collection('students').get().then((querySnapshot) {
      for(var val in querySnapshot.docs) {
        allStudentsForSearch.add(val);
      }
    });
    for (int i = 0; i < allStudentsForSearch.length; i ++) {
      if(allStudentsForSearch[i]['Name'] == name) {
        studentToDisplay = StudentInformation.fromMap(allStudentsForSearch[i].data());
        found = true;
      }
    }
    if(found) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDetailsDisplayed())); // gotta update route
    }
  }
}



// class DataSearch extends SearchDelegate<String>{
//   // final students = ["Pavan", "Ansh", "Anjali", "Tia", "Sammy"];
//   // final students2 = ["Neha", "Srihari", "Rhea"];
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // actions for app bar
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = "";
//         }
//       )
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     // leading icon on the left of app bar
//     return IconButton(
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress:transitionAnimation,
//       ),
//       onPressed: (){
//         close(context, "");
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // show some result based on selection
//     throw UnimplementedError();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // show when someone suggests something
//     final suggestionList = query.isEmpty
//         ? students2
//         : students.where((p) => p.startsWith(query)).toList();
//     return ListView.builder(
//         itemBuilder: (context, index) => ListTile(
//           leading: Icon(Icons.person),
//           title: RichText(
//               text: TextSpan(
//                   text: suggestionList[index].substring(0, query.length),
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold
//                   ),
//                   children: [
//                     TextSpan(
//                         text: students2[index].substring(query.length),
//                         style: TextStyle(color: Colors.grey))
//                   ]
//               ),
//           )
//         ),
//     );
//   }

// }

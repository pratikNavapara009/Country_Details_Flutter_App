import 'package:country_detail_app/globals/globals.dart';
import 'package:country_detail_app/helpers/api_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    APIHelper.apiHelper.getData();
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Countries"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0XFF6A62B7).withAlpha(50),
            ),
            child: TextField(
              controller: searchController,
              onChanged: (val) {
                setState(() {
                  Global.search = val;
                });
              },
              cursorColor: const Color(0XFF6A62B7),
              decoration: InputDecoration(
                  icon: const Icon(
                    Icons.flag_circle,
                    size: 40,
                    color: Color(0XFF6A62B7),
                  ),
                  hintText: 'Search Country...',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  border: InputBorder.none),
            ),
          ),
          Expanded(
            flex: 9,
            child: FutureBuilder(
              future: APIHelper.apiHelper.getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                } else if (snapshot.hasData) {
                  List data = snapshot.data;
                  return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, i) {
                      return Card(
                        color: Colors.primaries[i % 18].shade300,
                        child: ListTile(
                          leading: Text(
                            "${i + 1}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                'detail',
                                arguments: data![i],
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.primaries[i % 18].shade900,
                            ),
                          ),
                          title: Text(
                            data![i]!.countries.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: data.length,
                    shrinkWrap: true,
                  );
                } else {
                  return const Center(
                    child: CupertinoActivityIndicator(
                      radius: 25,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

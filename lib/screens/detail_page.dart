import 'package:flutter/material.dart';
import '../models/api_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Info data = ModalRoute.of(context)!.settings.arguments as Info;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.countries),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 5,
          ),
          CircleAvatar(radius: 70, backgroundImage: NetworkImage(data.flags!)),
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Capital : ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                ...data.capital
                    .map(
                      (e) => Text("$e"),
                    )
                    .toList()
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 5,
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Continents : ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                ...data.continents
                    .map(
                      (e) => Text("$e"),
                    )
                    .toList()
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 5,
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Time : ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                ...data.time
                    .map(
                      (e) => Text("$e"),
                    )
                    .toList()
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 5,
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Language : ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                ...data.lang.values.map(
                  (e) => Row(
                    children: [
                      Text(
                        e.toString(),
                      ),
                    ],
                  ),
                ),
                const Text(" , ")
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 5,
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Populations : ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.grey,
                        )),
                  ),
                ),
                Text(
                  "${data.population} ",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 5,
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Area : ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.grey,
                        )),
                  ),
                ),
                Text(
                  "${data.area} ",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 5,
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Subregion : ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.grey,
                        )),
                  ),
                ),
                Text(data.subregion!),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 5,
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Region : ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.grey,
                        )),
                  ),
                ),
                Text(data.region!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

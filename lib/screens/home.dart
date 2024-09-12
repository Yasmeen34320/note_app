import 'package:flutter/material.dart';
import 'package:note_app/main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 114, 88, 71),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
                onPressed: () {
                  sharedPrefe.clear();
                  Navigator.pushNamedAndRemoveUntil(
                      context, "login", (route) => false);
                },
                icon: Icon(Icons.exit_to_app))
          ],
          title: Text(
            "Home",
            //  style: TextStyle(color: Colors.white),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Image.asset(
                      "lib/images/Notebook And Pen Vector Hd PNG Images, Cartoon Exercise Book Notebook Pen, Book Clipart, Jobs, Recording PNG Image For Free Download.jpg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    )),
                Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Title Note"),
                      ),
                      subtitle: Text("Content note"),
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}

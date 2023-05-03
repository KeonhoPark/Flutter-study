import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class Bucket {
  String job;
  bool isDone;

  Bucket(this.job, this.isDone);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Bucket> bucketList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bucket List"),
      ),
      body: bucketList.isEmpty
          ? Center(child: Text("버킷 리스트를 작성해 주세요."))
          : ListView.builder(
              itemCount: bucketList.length,
              itemBuilder: (context, index) {
                Bucket bucket = bucketList[index];
                return ListTile(
                  title: Text(
                    bucket.job,
                    style: TextStyle(
                      fontSize: 24,
                      color: bucket.isDone ? Colors.grey : Colors.black,
                      decoration: bucket.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(CupertinoIcons.delete),
                    onPressed: () {
                      showDeleteDialog(context, index);
                    },
                  ),
                  onTap: () {
                    setState(() {
                      bucket.isDone = !bucket.isDone;
                    });
                  },
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? job = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CreatePage()),
          );
          if (job != null) {
            setState(() {
              bucketList.add(Bucket(job, false));
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("정말로 삭제하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("취소"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  bucketList.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text(
                "확인",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        );
      },
    );
  }
}

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController textController = TextEditingController();
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("버킷리스트 작성"),
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: textController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "하고 싶은 일을 입력하세요.",
                errorText: error,
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                  onPressed: () {
                    String job = textController.text;
                    if (job.isEmpty) {
                      setState(() {
                        error = '할 일을 입력해주세요.';
                      });
                    } else {
                      setState(() {
                        error = null;
                      });
                      Navigator.pop(context, job);
                    }
                  },
                  child: Text(
                    "추가하기",
                    style: TextStyle(fontSize: 18),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

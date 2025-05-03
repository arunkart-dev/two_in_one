import 'package:flutter/material.dart';

class Taskmanager extends StatefulWidget {
  const Taskmanager({super.key});

  @override
  State<Taskmanager> createState() => _TaskmanagerState();
}

class _TaskmanagerState extends State<Taskmanager> {
  final List<String> _tasks = [];
  final TextEditingController _taskcontroller = TextEditingController();
  final TextEditingController _searchcontroller = TextEditingController();
  String _searchquery = '';

  void _addtasks() {
    String task = _taskcontroller.text.trim();
    setState(() {
      _tasks.add(task);
      _taskcontroller.clear();
    });
  }

  void _deletetasks(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredtasks =
        _tasks
            .where((search) => search.toLowerCase().contains(_searchquery))
            .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Task Manager'),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Stack(
        children: [
           Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _searchcontroller,
                    onChanged: (value) {
                     setState(() {
                        _searchquery = value;
                     });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: '   Search tasks ..',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child:
                      filteredtasks.isEmpty
                          ? Center(
                            child: Image.network(
                              'https://img.freepik.com/premium-vector/no-task-available-illustration_585024-46.jpg',
                            ),
                          )
                          : ListView.builder(
                            itemCount: filteredtasks.length,
                            itemBuilder: (context, index) {
                              final task = filteredtasks[index];
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      offset: Offset(0, 0),
                                      spreadRadius: 0
                                    )
                                  ],
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0
                                  )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    title: Text(task),
                                    trailing: IconButton(
                                      onPressed: () {
                                          int realindex = _tasks.indexOf(task);
                                          _deletetasks(realindex);
                                      },
                                      style: IconButton.styleFrom(
                                        backgroundColor: Colors.black
                                      ),
                                      icon: Icon(Icons.delete, color: Colors.white),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                ),
              ],
              
            ),
            
          
          SizedBox(height: 80),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      bottom: 20,
                      right: 20,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset(0, 0),
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _taskcontroller,
                        decoration: InputDecoration(
                          hintText: 'Write your task here',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addtasks();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      minimumSize: Size(60, 60),
                    ),
                    child: Text('+', style: TextStyle(fontSize: 40)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

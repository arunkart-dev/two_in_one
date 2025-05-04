import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List<Map<String,String>> _notescontainer = [];
  final TextEditingController _notescontroller = TextEditingController();
  final TextEditingController _descriptioncontroller = TextEditingController();
  final TextEditingController _searchcontroller = TextEditingController();
  String _searchquery = '';
  void _addnotes() {
  String title = _notescontroller.text.trim();
  String description = _descriptioncontroller.text.trim();

  if (title.isNotEmpty || description.isNotEmpty) {
    setState(() {
      _notescontainer.add({
        'title': title,
        'description': description,
      });
      _notescontroller.clear();
      _descriptioncontroller.clear();
    });
  }

  Navigator.pop(context); // Close dialog after adding
}


  void _deletenotes(int index) {
  setState(() {
    _notescontainer.removeAt(index);
  });
}


  @override

  Widget build(BuildContext context) {
   
List<Map<String, String>> _searchtasks = _notescontainer.where((note) {
  return note['title']!.toLowerCase().contains(_searchquery.toLowerCase()) ||
         note['description']!.toLowerCase().contains(_searchquery.toLowerCase());
}).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('NotesApp'),
        foregroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: TextField(
                      controller: _notescontroller,
                      decoration: InputDecoration(
                        hintText: 'New note...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    content: TextField(
                      controller: _descriptioncontroller,
                      decoration: InputDecoration(
                        hintText: 'Write here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          _addnotes();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Add'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Cancel'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              '+',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
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
                hintText: 'Search your notes..',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 70),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  childAspectRatio: 1,
),
itemCount: _searchtasks.length,
itemBuilder: (context, index) {
  final note = _searchtasks[index];
  return Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.yellow[200],
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2)),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          note['title'] ?? '',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        Text(note['description'] ?? ''),
        Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            onPressed: () => _deletenotes(index),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white
            ),
            child: Text('Delete'),
          ),
        ),
      ],
    ),
  );
},

            ),
          ),
        ],
      ),
    );
  }
}

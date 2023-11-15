import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Name',
                labelText: 'Full Name',
                icon: Icon(Icons.people)
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                icon: Icon(Icons.email)
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Validasi input
                if (nameController.text.isEmpty ||
                    emailController.text.isEmpty ) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Please fill in all fields.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Navigasi ke halaman berisi data dummy jika input valid
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DummyDataPage(),
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class DummyDataPage extends StatefulWidget {
  @override
  _DummyDataPageState createState() => _DummyDataPageState();
}

class _DummyDataPageState extends State<DummyDataPage> {
  List<String> dummyData = [
    'Diadora Hundred Womens Casual Shoes', 
    'New Balance CT302 Unnisex Sneakers', 
    'Airwalk Athena Womens Slip on Sneakers',
    'Airwalk Tarina Womens Sneakers',
    'Converse Cucks 70 OX Unisex Sneakers',
    'Skechers Vapor Lite Womens Sneakers',
    'Airwalk Taria Womens Sneakers',
    'Converse CTAS LIFT HI Womens Sneakers',
    'Diadora Hitori Mens Running Shoes',
    'Airwalk Ariko Mens Sneakers White/Blue'
    ];
  TextEditingController newItemController = TextEditingController();

  void addDummyData(String newItem) {
    setState(() {
      dummyData.add(newItem);
    });
  }

  void deleteDummyData(int index) {
    setState(() {
      dummyData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Produk'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dummyData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(dummyData[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deleteDummyData(index);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: newItemController,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan Produk',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    addDummyData(newItemController.text);
                    newItemController.clear();
                  },
                  child: const Text('Tambah Produk'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:my_dice/dice_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Dice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 115, 0, 238),
          // primary: const Color.fromARGB(255, 238, 52, 0),
          secondary: const Color(0xFF03DAC6),
        ),
        useMaterial3: true,
      ),
      // home: const HomeScreen(),
      home: const DiceScreen(),
    );
  }
}

//create global form key
final _formKey = GlobalKey<FormState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _dice = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Dice'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          await doOpenForm(context);
          // await Future<void>.delayed(const Duration(seconds: 1));
        },
        child: SizedBox(
          height: double.infinity,
          child: _dice.isEmpty
              ? ListView(
                  padding: const EdgeInsets.all(8.0),
                  shrinkWrap: true,
                  children: const [
                    Icon(Icons.add_circle_outline, size: 55.0),
                    Center(child: Text('Pull to Add New')),
                  ],
                )
              : ListView.builder(
                  itemCount: _dice.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(_dice[index]),
                        onTap: () {
                          setState(() {
                            _dice.removeAt(index);
                          });
                        },
                        trailing: InkWell(
                            onTap: () {
                              setState(() {
                                _dice.removeAt(index);
                              });
                            },
                            child: const Icon(Icons.delete)),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  Future<void> doOpenForm(BuildContext context) async {
    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (dcontext) {
        return AlertDialog(
          title: const Text('Add New'),
          actions: [
            createFormInput(dcontext),
            Wrap(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(dcontext).pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(dcontext).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  createFormInput(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        autofocus: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a value';
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Enter a value',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        onFieldSubmitted: (value) {
          _formKey.currentState!.validate();
          setState(() {
            _dice.add(value);
          });
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

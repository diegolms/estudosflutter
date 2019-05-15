import 'package:flutter/material.dart';
import 'package:hello_world/fragments/dashboard.dart';
import 'package:hello_world/fragments/categorias.dart';
import 'package:hello_world/fragments/lancamentos.dart';
import 'package:hello_world/fragments/relatorios.dart';
import 'package:hello_world/fragments/condominos.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  static String tag = 'login-page';

  final drawerItems = [
    new DrawerItem("Dashboard", Icons.dashboard),
    new DrawerItem("Condôminos", Icons.people),
    new DrawerItem("Categorias", Icons.category),
    new DrawerItem("Lançamentos", Icons.attach_money),
    new DrawerItem("Sair", Icons.exit_to_app)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Dashboard();
      case 1:
        return new Condominos();
      case 2:
        return new Categorias();
      case 3:
        return new Lancamentos();
      case 4:
        return new Lancamentos();

      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        //title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Diego Lopes"), 
                accountEmail: new Text("lmsilva.diego@gmail.com"),
                decoration: new BoxDecoration(
                  
                    color: Color.fromRGBO(58, 66, 86, 1.0),
                ),
                
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/alucard.jpg'),
                  
                  ),
                ),

            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

// class DrawerItem {
//   String title;
//   IconData icon;
//   DrawerItem(this.title, this.icon);
// }

// class HomePage extends StatelessWidget {
//   static String tag = 'home-page';

//   @override
//   Widget build(BuildContext context) {
//     final alucard = Hero(
//       tag: 'hero',
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: CircleAvatar(
//           radius: 72.0,
//           backgroundColor: Colors.transparent,
//           backgroundImage: AssetImage('assets/alucard.jpg'),
//         ),
//       ),
//     );

//     final welcome = Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Text(
//         'Welcome Alucard',
//         style: TextStyle(fontSize: 28.0, color: Colors.white),
//       ),
//     );

//     final lorem = Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Text(
//         'LLLLLLLLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.',
//         style: TextStyle(fontSize: 16.0, color: Colors.white),
//       ),
//     );

//     final body = Container(
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.all(28.0),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(colors: [
//           Colors.blue,
//           Colors.lightBlueAccent,
//         ]),
//       ),
//       child: Column(
//         children: <Widget>[alucard, welcome, lorem],
//       ),
//     );

//     return Scaffold(
//       body: body,
//     );
//   }
// }

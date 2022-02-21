import 'package:custom_painter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../routes/routes.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.blue,),
      itemCount: pageRoutes.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          leading: FaIcon(pageRoutes[index].icon, color: Colors.blue,),
          title: Text(pageRoutes[index].titulo),
          trailing: Icon(Icons.chevron_right, color: Colors.blue,),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => pageRoutes[index].page));
          },
        );
      },
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 200.0,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('JM', style: TextStyle(fontSize: 50.0),),
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones(),
            ),

            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: Colors.blue,),
              title: Text('Dark mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: Colors.blue,
                onChanged: (value){
                  appTheme.darkTheme = value;
                }
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: Colors.blue,),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: Colors.blue,
                  onChanged: (value){
                    appTheme.customTheme = value;
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
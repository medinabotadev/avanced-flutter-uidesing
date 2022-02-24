import 'package:custom_painter/src/labs/slideshow_page.dart';
import 'package:custom_painter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../models/layout_model.dart';
import '../routes/routes.dart';

class LauncherTabletPage extends StatelessWidget {
  const LauncherTabletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter - Tablet'),
        backgroundColor: appTheme.currentTheme.colorScheme.secondary,
      ),
      drawer: _MenuPrincipal(),
      body: Row(
        children: [
          Container(
            width: 300,
            height: double.infinity,
            child: _ListaOpciones(),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: (appTheme.darkTheme) ? Colors.grey : appTheme.currentTheme.colorScheme.secondary,
          ),
          Expanded(
            child: layoutModel.currentPage
          )
        ],
      ),
      // body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => Divider(color: appTheme.primaryColorLight,),
      itemCount: pageRoutes.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          leading: FaIcon(pageRoutes[index].icon, color: appTheme.colorScheme.secondary,),
          title: Text(pageRoutes[index].titulo),
          trailing: Icon(Icons.chevron_right, color: appTheme.colorScheme.secondary,),
          onTap: (){
            final layoutModel = Provider.of<LayoutModel>(context, listen: false);
            layoutModel.currentPage = pageRoutes[index].page;
            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => pageRoutes[index].page));
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
    final accentColor = appTheme.currentTheme.colorScheme.secondary;
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 200.0,
                child: CircleAvatar(
                  backgroundColor: appTheme.currentTheme.colorScheme.secondary,
                  child: Text('JM', style: TextStyle(fontSize: 50.0),),
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones(),
            ),

            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: accentColor,),
              title: Text('Dark mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: accentColor,
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
                leading: Icon(Icons.add_to_home_screen, color: accentColor,),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: accentColor,
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
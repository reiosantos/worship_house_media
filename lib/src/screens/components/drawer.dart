import 'package:whm/src/blocs/menu.dart';
import 'package:whm/src/index.dart';
import 'package:whm/src/theme/whm_colors.dart';

class WhmDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    menuBloc.fetchMenuList();

    return Drawer(
        elevation: 10.0,
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[
                      WhmColors.kWhmPrimary,
                      WhmColors.kWhmPrimaryDark
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: const <double>[0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: const DrawerHeader(child: CircleAvatar()),
            ),
            Container(
              child: StreamBuilder<List<String>>(
                  stream: menuBloc.menuStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<String>> snapshot) {
                    if (snapshot.hasData) {
                      return buildList(snapshot);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ));
  }

  Widget buildList(AsyncSnapshot<List<String>> snapshot) {
    final List<String> results = snapshot.data;

    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(color: Colors.white, height: 1),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: ListTile(
            leading: const Icon(Icons.info, color: WhmColors.kWhmWhite),
            title: Text(
              results[index],
              style: const TextStyle(
                  inherit: true,
                  color: WhmColors.kWhmWhite,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            ),
            onTap: () {
              print('Idiot');
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:final_630710380/models/football_item.dart';
import 'package:final_630710380/servies/api_football_Team.dart';

//import '../../servies/api_football_Team.dart';


class TeamListPage extends StatefulWidget {
  const TeamListPage({Key? key}) : super(key: key);

  @override
  _TeamListPageState createState() => _TeamListPageState();
}

class _TeamListPageState extends State<TeamListPage> {

  List<TeamItem>? _TeamList;
  var _isLoading = false;
  String? _errMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:<Widget> [
          Container(
            decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage('bg.png'))
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                if (_TeamList != null)
                  ListView.builder(
                    itemBuilder: _buildListItem,
                    itemCount: _TeamList!.length,
                  ),
                if (_isLoading)
                  const Center(child: CircularProgressIndicator()),
                if (_errMessage != null && !_isLoading)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(_errMessage!),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _fetchTeamData();
                          },
                          child: const Text('RETRY'),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
         ),
    );
  }


  void _fetchTeamData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var data = await Api().fetch('GET');
      setState(() {
        _TeamList = data
            .map<TeamItem>((item) => TeamItem.fromJson(item))
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errMessage = e.toString();
        _isLoading = false;
      });
    }
  }
  Widget _buildListItem(BuildContext context, int index) {
    var TeamItem = _TeamList![index];

    return Card(
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Image.network(
              TeamItem.flagimage,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8.0),
            Text(TeamItem.nameTeam),
          ],
        ),
      ),
    );
  }

}
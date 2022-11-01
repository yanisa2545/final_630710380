class TeamItem {
  final String id;
  final String nameTeam;
  final String group;
  final String flagimage;

  int Votecount =0 ;
  TeamItem({
    required this.id,
    required this.nameTeam,
    required this.group,
    required this.flagimage,
    required this.Votecount
  });

  factory TeamItem.fromJson(Map<String, dynamic> json) {
    return TeamItem(
        id: json['id'],
        nameTeam: json['nameTeam'],
        group: json['group'],
        flagimage: json['flagimage'],
        Votecount: json['Votecount']
    );
  }

  // namedconstructor
  TeamItem.fromJson2(Map<String, dynamic> json)
      : id = json['id'],
        nameTeam = json['nameTeam'],
        group = json['group'],
        flagimage = json['flagimage'],
        Votecount = json['Votecount'];
}

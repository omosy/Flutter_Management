class TableInfo {
  final DateTime enteredAt;
  final int tableNum;
  final int numberOfPeople;
  final int yukhoe;
  final int jeyuk;
  final int sundae;
  final int corncheese;
  final int nacho;
  final int hwangdo;
  final int eomooktang;
  final int moneysum;

  TableInfo({
    required this.enteredAt,
    required this.tableNum,
    required this.numberOfPeople,
    required this.yukhoe,
    required this.jeyuk,
    required this.sundae,
    required this.corncheese,
    required this.nacho,
    required this.eomooktang,
    required this.hwangdo,
    required this.moneysum,
  });

  factory TableInfo.fromMap(Map<String, dynamic> map) =>
      TableInfo(
        enteredAt: map["enteredAt"]!,
        tableNum: map["tableNum"]!,
        numberOfPeople: map["numberOfPeople"]!,
        yukhoe: map["yukhoe"]!,
        jeyuk: map["jeyuk"]!,
        sundae: map["sundae"]!,
        corncheese: map["corncheese"]!,
        nacho: map["nacho"]!,
        eomooktang: map["eomooktang"]!,
        hwangdo: map["hwangdo"]!,
        moneysum: map["maneysum"]!,
      );

  Map<String, dynamic> toMap() => {
    "enteredAt": enteredAt,
    "tableNum": tableNum,
    "numberOfPeople": numberOfPeople,
    "yukhoe": yukhoe,
    "jeyuk": jeyuk,
    "sundae": sundae,
    "corncheese": corncheese,
    "nacho": nacho,
    "eomooktang": eomooktang,
    "hwangdo": hwangdo,
    "moneysum" : moneysum,
  };
}

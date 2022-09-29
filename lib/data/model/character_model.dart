class CharacterModel {
   int? charId;
   String? name;
   String? nickName;
   String? image;
   String? birthDay;
   List<dynamic>? jobs;
   String? statusIfDeadOrAlive;
   List<dynamic>? appearanceOfSeasons;
   String? acotrName;
   String? categoryForTwoSeries;
   List<dynamic>? betterCallSaulAppearance;

   CharacterModel(
      {this.charId,
      this.name,
      this.nickName,
      this.image,
      this.jobs,
      this.statusIfDeadOrAlive,
      this.appearanceOfSeasons,
      this.acotrName,
      this.categoryForTwoSeries,
      this.betterCallSaulAppearance,
      this.birthDay
      });

   factory CharacterModel.fromJson(Map<String, dynamic> json){
     return CharacterModel(
       name: json["name"],
       image: json["img"],
       acotrName: json["portrayed"],
       appearanceOfSeasons:  json["appearance"],
       betterCallSaulAppearance: json["better_call_saul_appearance"],
       birthDay: json['birthday'],
       categoryForTwoSeries:  json["category"],
       charId: json["char_id"],
       jobs: json["occupation"],
       nickName: json["nickname"],
       statusIfDeadOrAlive: json["status"],
     );
   }


  Map<String, dynamic> toJson() =>
       {
         "char_id": charId,
         "name": name,
         "birthday": birthDay,
         "occupation": jobs ,
         "img": image,
         "status": statusIfDeadOrAlive ,
         "nickname": nickName,
         "appearance": appearanceOfSeasons ,
         "portrayed": acotrName,
         "category": categoryForTwoSeries ,
         "better_call_saul_appearance": betterCallSaulAppearance ,
       };
}


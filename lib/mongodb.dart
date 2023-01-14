import 'package:mongo_dart/mongo_dart.dart';
import 'package:mongoflutter/const.dart';
import 'dart:developer';

class MongoDatabase{
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    var collection = db.collection(COLLECTION_NAME);

    //insertion of document/data


    // await collection.insertOne({
    //   "username":"np",
    //   "name":"nhi pata",
    //   "email":"sasia@gmail.com"
    // });
    await collection.insertMany([{
      "username":"n1p",
      "name":"nhi1 pata1",
      "email":"sasia1@gmail.com"
    },
      {
        "username":"n2p",
        "name":"nhi2 pata2",
        "email":"sasia2@gmail.com"
      },
    ]);
    print(await collection.find().toList());

    //end of insertion

    // update one

    await collection.update(where.eq('username','np'), modify.set('name','pata hai' ));

    print(await collection.find().toList());//print for checking

    //updated one

    // update many
    // pata nhi kyu ye work nhi karta...
    await collection.updateMany(where.eq('username',['np','n1p']), modify.set('name','pata hai' ));

    print(await collection.find().toList());
    //updated all pata hai kya

    // delete
    await collection.deleteOne({"username":"np"});

    await collection.deleteMany({"username":"n1p"});

    //bkam toh karta hai
  }
}
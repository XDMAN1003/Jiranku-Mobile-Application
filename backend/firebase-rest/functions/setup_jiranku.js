const db = require("./database");

async function setupDatabase(req, res, next) {
  // To delete all the collections
  //const collections = ["user", "news", "product"];
  const collections = (await db.firestore.listCollections()).map(col=> col.id);
  console.log(collections);
  collections.forEach(async (collection) => {
    console.log("In Collection: "+collection);
    await deleteCollection(collection);
  });
  const collections1 = (await db.firestore.listCollections()).map(col=> col.id);
  // Add documents to the todos collection
  // addDocuments("todos", [
  //   { title: "Prepare proposal for the new project", completed: true },
  //   { title: "Replace light bulb", completed: true },
  // ]);
  addDocuments("user", [
    {
      address: "Taman Jasmin",
      email: "xying1023@gmail.com",
      fullName: "Xiao Ying",
      gender: "Female",
      identity: "Admin",
      invitationCode: "6263cdd8-33a8-4a74-a9ac-fea307da387d",
      password: "123456",
      preference: "TTTTTTTT",
      races: "Chinese",
      username: "Ying💕",
      id: "98bfd227-18d8-4f18-bcef-dae6f94ffc95",
    },
    {
      address: "Cinta Sayang Resort Villa",
      email: "anya-forger@gmail.com",
      fullName: "Anya Forger",
      gender: "Female",
      identity: "SP Resident",
      invitationCode: "6263cdd8-33a8-4a74-a9ac-fea307da387d",
      password: "123456",
      preference: "TFTFTFTF",
      races: "Others",
      username: "Anya💕",
      id: "94eb65c1-1fd7-4e2d-aae5-ce5432681a9e",
    },
    {
      address: "Cinta Sayang Resort Home",
      email: "just-in@gmail.com",
      fullName: "Justin Lee",
      gender: "Male",
      identity: "SP Resident",
      invitationCode: "6263cdd8-33a8-4a74-a9ac-fea307da387d",
      password: "123456",
      preference: "TTTTFFFF",
      races: "Malay",
      username: "Just-In",
      id: "6263cdd8-33a8-4a74-a9ac-fea307da387d",
    },
    {
      address: "Lagenda Height",
      email: "xdman1221@gmail.com",
      fullName: "Bao Ren",
      gender: "Male",
      identity: "Admin",
      invitationCode: "6263cdd8-33a8-4a74-a9ac-fea307da387d",
      password: "123456",
      preference: "",
      races: "Malay",
      username: "XDMAN",
      id: "3a82ac64-340b-4a2d-8c39-4957f0d401cf",
    },
  ]);
  addDocuments("news", [
    {
      id: "b590e929-fcb0-41fb-b291-e69c9b7496d3",
      postAuthorID: "94eb65c1-1fd7-4e2d-aae5-ce5432681a9e",
      location: "Taman Intan",
      description:
        "I can always talk about your best qualities with my friends but remain quiet when you’re around.",
      status: "Fake News!!!",
      photos: "Secret.png",
      reference: "Sinchew Daily",
      publishDateTime: "2022-02-24 15:27:00",
    },
    {
      id: "cf8f40b0-df37-11ec-ab03-3be23501e599",
      postAuthorID: "3a82ac64-340b-4a2d-8c39-4957f0d401cf",
      location: "Cinta Sayang",
      description: "XD",
      status: "Fake News!!!",
      photos: "sample2.png",
      reference: "Metro Harian",
      publishDateTime: "2022-05-29 10:12:00",
    },
    {
      id: "cfe24d40-df38-11ec-858f-1ba0188e96a9",
      postAuthorID: "3a82ac64-340b-4a2d-8c39-4957f0d401cf",
      location: "Cinta Sayang",
      description: "gghh",
      status: "Fake News!!!",
      photos: "sample6.jpg",
      reference: "Berita Harian",
      publishDateTime: "2022-05-29 10:19:24",
    },
  ]);
  addDocuments("product", [
    {
      id: "0192d84a-af70-4626-b65b-8e4445c38805",
      postAuthorID: "3a82ac64-340b-4a2d-8c39-4957f0d401cf",
      location: "Taman Intan",
      description:
        "Ready Stock Nike Sandal Men Fashion/Nike Slipper/Selipar Adidas Lelaki Perempuan Men Women Sandals",
      photos: "sample (6).jpg",
      contactNo: "011-123456789",
      price: "10.50",
      stock: "200",
      publishDateTime: "2022-05-20 10:30:00",
    },
    {
      id: "5dc6b327-7765-437a-bf06-1c7586af36e4",
      postAuthorID: "3a82ac64-340b-4a2d-8c39-4957f0d401cf",
      location: "Bandar Laguna Merbok",
      description:
        "Minimalist Lab GRACE Rolling Stones Sterling Silver Necklace, Bracelet",
      photos: "sample (7).jpg",
      contactNo: "011-0231003",
      price: "99.99",
      stock: "10",
      publishDateTime: "2022-05-10 10:20:00",
    },
    {
      id: "0192d84a-af70-4626-b65b-8e4445c38805",
      postAuthorID: "3a82ac64-340b-4a2d-8c39-4957f0d401cf",
      location: "Bukit Bayan",
      description: "Nestle Milo Activ-Go Chocolate Malt Powder Softpack 2kg",
      photos: "sample (8).jpg",
      contactNo: "012-6081619",
      price: "30.50",
      stock: "200",
      publishDateTime: "2022-04-27 15:27:00",
    },
  ]);

  
  res.send("Old Database: "+collections+"\n Clear Database: "+ collections1);
}

async function deleteCollection(collection) {
  const cref = db.firestore.collection(collection);
  console.log(collection);
  const docs = await cref.listDocuments();
  docs.forEach((doc) => doc.delete());
}

function addDocuments(collection, docs) {
  docs.forEach((doc) => db.create(collection, doc));
}

module.exports = setupDatabase;

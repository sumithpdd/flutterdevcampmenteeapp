const admin = require('firebase-admin');
const fs = require('fs-extra');
const yaml = require('yamljs');


admin.initializeApp({
    credential: admin.credential.cert(require('./credentials.json')),
});
const db = admin.firestore();
const toFile = async(folder) => {

    const ref = db.collection(folder);
    //const ref = db.collection('event_categories').doc(id);
    //const ref = db.collection('events').doc(id);

    const snapshot = await ref.get();
    if (snapshot.empty) {
        console.log('No matching documents.');
        return;
    }

    snapshot.forEach(async(doc) => {
        console.log(doc.id, '=>', doc.data());
        const str = yaml.stringify(doc.data(), 8);
        await fs.outputFile(`${folder}/${doc.id}.yaml`, str);
    });
    // await fs.outputFile(`event_categories/${id}.yaml`, str);
    // await fs.outputFile(`events/${id}.yaml`, str);

    console.log('DONE')
}

toFile("courses");
 
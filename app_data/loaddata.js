const admin = require('firebase-admin')
const path = require('path')
const fs = require('fs-extra')
const yaml = require('yamljs')

admin.initializeApp({
  credential: admin.credential.cert(require('./credentials.json')),
})
const db = admin.firestore()
function localPath() {
  return process.cwd()
}
const update = async (folder, name) => {
  const json = yaml.load(`${folder}/${name}`)
  const ref = db.collection(folder)

  var docid = name.replace('.yaml','');

  //  const snapshot = await ref.where('uuid', '==', docid).get()
  const snapshot = await ref.doc(docid).get()
  if (snapshot.empty) {
    const id = JSON.stringify(json['id'])
    await ref.doc(id.replace(/['"]+/g, '')).set(json, { merge: true })
    console.log('added ', json['id'], '=>', JSON.stringify(json))
    return
  }

  // snapshot.forEach(async (doc) => {
    await ref.doc(docid).set(json)
    console.log('updated ', docid)
  // })
}
fs.readdirSync('courses').forEach((file) => {
  console.log(file)
  update("courses", file);
})



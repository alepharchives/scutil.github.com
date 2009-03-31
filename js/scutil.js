
// $Revision$

function AddClassIfMissing(Tag, tclass) {

  switch (Tag.className) {
    case ''        : Tag.className = tclass; break;
    case undefined : Tag.className = tclass; break;
    default :
      var Classes = Tag.className.split(' ');
      for (i in Classes) { if (Classes[i] == tclass) { return; } }
      Tag.className += (' ' + tclass);
  }
}





// only removes the first instance of the class if repeated

function RemoveClassOnceIfPresent(Tag, tclass) {
  var Classes = Tag.className.split(' ');
  for (i in Classes) {
    if (Classes[i] == tclass) {
      Classes.splice(i, 1);
      Tag.className = Classes.join(' ');
      return;
    }
  }
}
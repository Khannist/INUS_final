function loadFile(input) {
  var file = input.files[0];
  $('#imgTag').html(" <img src='"+URL.createObjectURL(file)+"' style='max-height:512px; max-width:512px; margin-left: 44px;'/> ");
}
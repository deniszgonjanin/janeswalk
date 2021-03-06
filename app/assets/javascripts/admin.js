// Use this to customize the wymeditor boot process
// Just mirror the options specified in boot_wym.js with the new options here.
// This will completely override anything specified in boot_wym.js for that key.
// e.g. skin: 'something_else'
if (typeof(custom_wymeditor_boot_options) == "undefined") { 
  custom_wymeditor_boot_options = {
    containersItems: [
      {'name': 'h1', 'title':'Heading_1', 'css':'wym_containers_h1'}
      , {'name': 'h2', 'title':'Heading_2', 'css':'wym_containers_h2'}
      , {'name': 'h3', 'title':'Heading_3', 'css':'wym_containers_h3'}
      , {'name': 'h4', 'title':'Heading_4', 'css':'wym_containers_h4'}
      , {'name': 'p', 'title':'Paragraph', 'css':'wym_containers_p'}
    ],
    classesItems: [
		{name: 'text-align', rules:[{name: 'left', title: '{Left}'}, {name: 'center', title: '{Center}'}, {name: 'right', title: '{Right}'}, {name: 'justify', title: '{Justify}'}], join: '-', title: '{Text_Align}'}
		, {name: 'image-align', rules:[{name: 'left', title: '{Left}'}, {name: 'right', title: '{Right}'}], join: '-', title: '{Image_Align}'}
		, {name: 'font-size', rules:[{name: 'small', title: '{Small}'}, {name: 'normal', title: '{Normal}'}, {name: 'large', title: '{Large}'}], join: '-', title: '{Font_Size}'}
		, {name: 'image', rules:[{name: 'outline', title: 'Outline'}, {name: 'caption', title: 'Caption'}], join: '-', title: 'Image Options'}
		]

  }; 
}


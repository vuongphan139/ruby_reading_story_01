CKEDITOR.editorConfig = function(config) {
  config.toolbar = [
    {name: 'document', items: ['Source', '-' ]},
    {name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo', '-', 'Image', 'Maximize', 'SpecialChar']}, '/',
    {name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', 'RemoveFormat']}
  ];
};

module.exports = {
  default: function(context) {
    return {
      plugin: require('markdown-it-admonition'),
      assets: function() {
        return [
          { name: 'markdownit-admonition.css' }
        ];
      },
    }
  }
}

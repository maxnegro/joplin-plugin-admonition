import joplin from 'api';
import { ContentScriptType } from 'api/types';


joplin.plugins.register({
	onStart: async function() {
		// Here we register new Markdown plugin
		await joplin.contentScripts.register(
			ContentScriptType.MarkdownItPlugin,
			'admonition',
			'./markdownItAdmonition.js'
		);
		// console.log("my object: %o", joplin.contentScripts);
		// var plugObj = require('markdown-it-container');
		// console.log("my object %o", plugObj);
		// console.info('Hello world. Custom containers plugin started!!!');
	},
});

import joplin from 'api';

joplin.plugins.register({
	onStart: async function() {
		console.info('Hello world. Custom containers plugin started!');
		// Here we register new Markdown plugin
		await joplin.contentScripts.register(
			ContentScriptType.MarkdownItPlugin,
			'Custom containers',
			'./custom-containers.js'
		);
	},
});

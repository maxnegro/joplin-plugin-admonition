# Joplin Admonition Markdown plugin

This plugin adds admonition tag capability as in markdownIt plugin [Admonition plug-in](https://github.com/docarys/markdown-it-admonition).

## Usage

This plugin adds admonition blocks, using "!!!" as fences. See the following example.

``` markdown
!!! note This is the admonition title
This is the admonition body
!!!
```

After the starting fence you should specify admonition type (changes color of rendered block) and optionally a title to be displayed. If title is not provided, admonition type name is used instead.

## Appearance

CSS used for rendering is taken from [mkdocs-material](https://squidfunk.github.io/mkdocs-material/reference/admonitions/#admonition), bar the icons, at the moment.

Block is rendered in a single *DIV*, as follows:

``` html
<div class="admonition note">
<p class="admonition-title">This is the admonition title</p>
<p>This is the admonition body</p>
</div>
```

## Admonition types

The following admonition types, supported by Docarys, are recognized by this plugin:

|Type|
|---|
|note|
|abstract|
|info|
|tip|
|success|
|question|
|warning|
|failure|
|danger|
|bug|
|example|
|quote|

## Development (containerized)

If you prefer not to rely on local global npm tools, you can run install/update/build in Docker.

```bash
./tools/docker-run.sh npm ci
./tools/docker-run.sh npm run update
./tools/docker-run.sh npm run dist
```

The repository is mounted inside the container, so generated files are written directly to this project directory.

Note: the Joplin generator may overwrite scripts in package.json during updates. For this reason, `./tools/docker-run.sh npm run update` is intentionally hardened and internally uses an `npx yo+generator-joplin` command without global installs.

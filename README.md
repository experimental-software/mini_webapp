# Mini Webapp

This is a template project for building tiny HTML pages with some JavaScript attached to it for performing utility calculations.

## Test

Run this command to check the generated website during development:

```bash
docker run --rm -it -v $PWD:/app -p 8080:8080 -w /app experimentalsoftware/dart-webdev webdev-serve
```

## Build

Run those command to generate the website:

```bash
dart pub get
webdev build -o web:docs
```

## Deploy

Run this command to deploy the generated website to your webserver:

```bash
rsync -r docs/* root@${HOST}:${DIRECTORY}
```

## License

MIT

# Error Format as HTML

Initial implementation for https://github.com/Witiko/expltools/issues/32.

## Roadmap

- [ ] Analyze whole TeXLive distribution (https://github.com/koppor/errorformat-to-html/issues/3)
- [ ] Offer detailed file view (https://github.com/koppor/errorformat-to-html/issues/2)

## Development

- Served files: <https://github.com/koppor/errorformat-to-html/tree/gh-pages>
- Rendered output: <https://koppor.github.io/errorformat-to-html>

### Required Development Setup on Windows

- Enable symlinks with git (<https://stackoverflow.com/a/59761201/873282>):
  Press <kbd>Win</kbd> + <kbd>R</kbd>, type `gpedit.msc`, hit OK. Then navigate to Local Comp Policy > Computer Configuration > Windows Settings > Security Settings > Local Policies > User Rights Assignment > Create symbolic links

Install `errorformat`:

```bash
go install github.com/reviewdog/errorformat/cmd/errorformat@latest
```

### Server HTML

Run simple HTTP server (useful when running a checkout of `gh-pages` branch):

```bash
npx http-server
```

This also works inside `pages/file`.

### Create `errors.txt` and `errors.json`

Local run:

```bash
docker run ghcr.io/witiko/expltools/explcheck -v "...":/workdir --porcelain --error-format='%f:%l:%c:%e:%k: %t%n %m' /workdir/expltools/explcheck/testfiles/e102.tex > errors.txt
errorformat -w jsonl "%f:%l:%c:%e:%k: %t%n %m" < errors.txt | jq -s > errors.json
```

On Windows cmd, one needs to enquote the `--error-format` with double quotes.

```cmd
docker run --rm -v "c:\\git-repositories\\koppor\\errorformat-to-html:/workspace" ghcr.io/witiko/expltools/explcheck --porcelain --error-format="%f:%l:%c:%e:%k: %t%n %m" "/workspace/expltools/explcheck/testfiles/e102.lua"
```

### Scripts

#### `create-dirs-for-files.sh`

- Execute in root of repository.
- Ensure that `errors.json` exists here. Use `pages/main/errors.json`.
- Ensure that `errors.txt` exists here. Use any (e.g., <https://koppor.github.io/errorformat-to-html/expltools/explcheck/testfiles/e102-01.tex/errors.txt>)

## Acknowledgements

This project makes use of [errorformat](https://github.com/reviewdog/errorformat) and [jq](https://jqlang.github.io/jq/).

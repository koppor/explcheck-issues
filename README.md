# Error Format as HTML

Initial implementation for https://github.com/Witiko/expltools/issues/32.

## Roadmap

- [ ] Analyze whole TeXLive distribution (https://github.com/koppor/errorformat-to-html/issues/3)
- [ ] Offer detailed file view (https://github.com/koppor/errorformat-to-html/issues/2)

## Development

```bash
npx http-server
```

Install `errorformat`:

```bash
go install github.com/reviewdog/errorformat/cmd/errorformat@latest
```

Local run:

```bash
docker run ghcr.io/witiko/expltools/explcheck -v "...":/workdir --porcelain --error-format='%f:%l:%c:%e:%k: %t%n %m' /workdir/expltools/explcheck/testfiles/e102.tex > errors.txt
errorformat -w jsonl "%f:%l:%c:%e:%k: %t%n %m" < errors.txt | jq -s > errors.json
```

On Windows cmd, one needs to enquote the `--error-format` with double quotes.

```cmd
docker run --rm -v "c:\\git-repositories\\koppor\\errorformat-to-html:/workspace" ghcr.io/witiko/expltools/explcheck --porcelain --error-format="%f:%l:%c:%e:%k: %t%n %m" "/workspace/expltools/explcheck/testfiles/e102.lua"
```

## Acknowledgements

This project makes use of [errorformat](https://github.com/reviewdog/errorformat) and [jq](https://jqlang.github.io/jq/).

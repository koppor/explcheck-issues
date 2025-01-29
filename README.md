# Error Format as HTML

Initial implementation for https://github.com/Witiko/expltools/issues/32.

## Roadmap

- [ ] Analyze whole TeXLive distribution
- [ ] Offer detailed file view

## Development

```bash
npx http-server
```

Install errorformat:

```bash
go install github.com/reviewdog/errorformat/cmd/errorformat@latest
```

Local run:

```bash
docker run ghcr.io/witiko/expltools/explcheck -v "...":/workdir /workdir/expltools/explcheck/testfiles/e102.tex > errors.txt
errorformat -w jsonl "%f:%l:%c: %m" < errors.txt | jq -s > errors.json
```

## Acknowledgements

This project makes use of [errorformat](https://github.com/reviewdog/errorformat) and [jq](https://jqlang.github.io/jq/).

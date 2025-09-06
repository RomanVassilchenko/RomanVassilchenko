.PHONY: format

# Format files using Prettier
format:
	npx prettier --write "**/*.{md,yaml,yml,json}" --ignore-path .prettierignore

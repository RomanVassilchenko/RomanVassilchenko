.PHONY: format run

# Format files using Prettier
format:
	npx prettier --write "**/*.{md,yaml,yml,json}" --ignore-path .prettierignore

run:
	hugo server --bind 0.0.0.0 --port 1313 -D

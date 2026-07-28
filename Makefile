.PHONY: all generate clean en ru dev build preview install lint format help

RESUME_DIR = romanv.dev/resume
PUBLIC_DIR = romanv.dev/public/documents
SITE_DIR = romanv.dev
SHOW_MASTERS ?= false

# Default target
all: help

#--------------------------
# Resume targets (HTML/CSS + Playwright)
#--------------------------

# Generate both English and Russian PDFs
generate: en ru
	@echo "✓ Generated resume_en.pdf and resume_ru.pdf"

# Generate English PDF
en: $(PUBLIC_DIR)/resume_en.pdf

# Generate Russian PDF
ru: $(PUBLIC_DIR)/resume_ru.pdf

# Build English resume
$(PUBLIC_DIR)/resume_en.pdf: $(RESUME_DIR)/generate.mjs $(RESUME_DIR)/data.mjs $(RESUME_DIR)/resume.css
	@mkdir -p $(PUBLIC_DIR)
	@echo "Building English resume..."
	@cd $(SITE_DIR) && node resume/generate.mjs en ../public/documents/resume_en.pdf $(SHOW_MASTERS)

# Build Russian resume
$(PUBLIC_DIR)/resume_ru.pdf: $(RESUME_DIR)/generate.mjs $(RESUME_DIR)/data.mjs $(RESUME_DIR)/resume.css
	@mkdir -p $(PUBLIC_DIR)
	@echo "Building Russian resume..."
	@cd $(SITE_DIR) && node resume/generate.mjs ru ../public/documents/resume_ru.pdf $(SHOW_MASTERS)

#--------------------------
# Website targets
#--------------------------

# Install dependencies
install:
	@echo "Installing dependencies..."
	@cd $(SITE_DIR) && env -u NPM_CONFIG_TMP npm ci
	@if [ -z "$$PLAYWRIGHT_BROWSERS_PATH" ]; then \
		echo "Installing Chromium for resume generation..."; \
		cd $(SITE_DIR) && npx playwright install chromium; \
	else \
		echo "Using Chromium provided by the Nix development environment."; \
	fi

# Run development server
dev:
	@cd $(SITE_DIR) && env -u NPM_CONFIG_TMP VITE_SHOW_MASTERS_EDUCATION=$(SHOW_MASTERS) npm run dev

# Build for production
build: generate
	@echo "Building website..."
	@cd $(SITE_DIR) && env -u NPM_CONFIG_TMP VITE_SHOW_MASTERS_EDUCATION=$(SHOW_MASTERS) npm run build

# Preview production build
preview:
	@cd $(SITE_DIR) && env -u NPM_CONFIG_TMP VITE_SHOW_MASTERS_EDUCATION=$(SHOW_MASTERS) npm run preview

# Lint code
lint:
	@cd $(SITE_DIR) && env -u NPM_CONFIG_TMP npm run lint

# Format code
format:
	@cd $(SITE_DIR) && env -u NPM_CONFIG_TMP npm run format
	@cd $(SITE_DIR) && npx prettier --write ../\*.md
	@nixfmt flake.nix

#--------------------------
# Clean targets
#--------------------------

# Clean generated PDFs
clean:
	@rm -f $(PUBLIC_DIR)/resume_*.pdf
	@echo "✓ Cleaned resume PDFs"

# Clean everything including dist and node_modules
distclean: clean
	@rm -rf $(SITE_DIR)/dist $(SITE_DIR)/node_modules
	@echo "✓ Cleaned all generated files"

#--------------------------
# Help
#--------------------------

help:
	@echo "Usage: make [target]"
	@echo "       nix run .#[dev|build|preview|lint|format|resume|install]"
	@echo ""
	@echo "Flags:"
	@echo "  SHOW_MASTERS=false  Toggle master's education in generated PDFs and site builds"
	@echo ""
	@echo "Resume (HTML/CSS + Playwright):"
	@echo "  generate    Build both EN/RU resumes to public/documents"
	@echo "  en          Build English resume only"
	@echo "  ru          Build Russian resume only"
	@echo ""
	@echo "Website:"
	@echo "  install     Install npm dependencies"
	@echo "  dev         Run development server"
	@echo "  build       Build for production (includes resume generation)"
	@echo "  preview     Preview production build"
	@echo "  lint        Run type checker"
	@echo "  format      Format website and resume frontend sources with Prettier"
	@echo ""
	@echo "Clean:"
	@echo "  clean       Remove generated resume PDFs"
	@echo "  distclean   Remove all generated files (PDFs, dist, node_modules)"

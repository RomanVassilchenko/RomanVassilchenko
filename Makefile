.PHONY: all generate clean en ru dev build preview install lint format help

RESUME_DIR = romanv.dev/resume
PUBLIC_DIR = romanv.dev/public/documents
SITE_DIR = romanv.dev

# Default target
all: help

#--------------------------
# Resume targets (Typst)
#--------------------------

# Generate both English and Russian PDFs
generate: en ru
	@echo "✓ Generated resume_en.pdf and resume_ru.pdf"

# Generate English PDF
en: $(PUBLIC_DIR)/resume_en.pdf

# Generate Russian PDF
ru: $(PUBLIC_DIR)/resume_ru.pdf

# Build English resume
$(PUBLIC_DIR)/resume_en.pdf: $(RESUME_DIR)/resume.typ $(RESUME_DIR)/i18n.typ
	@mkdir -p $(PUBLIC_DIR)
	@echo "Building English resume..."
	@cd $(RESUME_DIR) && typst compile resume.typ --input lang=en ../public/documents/resume_en.pdf

# Build Russian resume
$(PUBLIC_DIR)/resume_ru.pdf: $(RESUME_DIR)/resume.typ $(RESUME_DIR)/i18n.typ
	@mkdir -p $(PUBLIC_DIR)
	@echo "Building Russian resume..."
	@cd $(RESUME_DIR) && typst compile resume.typ --input lang=ru ../public/documents/resume_ru.pdf

#--------------------------
# Website targets
#--------------------------

# Install dependencies
install:
	@echo "Installing dependencies..."
	@cd $(SITE_DIR) && npm install

# Run development server
dev:
	@cd $(SITE_DIR) && npm run dev

# Build for production
build: generate
	@echo "Building website..."
	@cd $(SITE_DIR) && npm run build

# Preview production build
preview:
	@cd $(SITE_DIR) && npm run preview

# Lint code
lint:
	@cd $(SITE_DIR) && npm run lint

# Format code
format:
	@cd $(SITE_DIR) && npm run format
	@prettier --write "*.md" 2>/dev/null || true
	@typstfmt $(RESUME_DIR)/*.typ 2>/dev/null || true

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
	@echo ""
	@echo "Resume (Typst):"
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
	@echo "  format      Format code (Prettier + typstfmt)"
	@echo ""
	@echo "Clean:"
	@echo "  clean       Remove generated resume PDFs"
	@echo "  distclean   Remove all generated files (PDFs, dist, node_modules)"

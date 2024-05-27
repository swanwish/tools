help:
	@echo "Available targets:"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

tar_audio_converter: ## Make convert_audio.tar.gz
	@echo "Buld audio_convert.tar.gz"
	@(cd mac/convert_audio && \
    tar czf ../convert_audio.tar.gz convert_audio.sh ffmpeg)
	@echo "The file was generated"

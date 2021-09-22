
.PHONY: bundle-openapi

bundle-openapi:
	@docker run --rm \
		--volume ${PWD}/api:/project/input:ro \
		--volume ${PWD}/static:/project/output:rw \
		wework/speccy resolve /project/input/openapi.yaml -o /project/output/openapi.bundle.yaml
TOPTARGETS = build push

IMAGES = premake linux-clang6 linux-clang8 linux-clang10 android emscripten

$(TOPTARGETS): $(IMAGES)
$(IMAGES):
	@$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: $(TOPTAGETS) $(IMAGES)

TOPTARGETS = build push

IMAGES = premake linux-clang6 android web

$(TOPTARGETS): $(IMAGES)
$(IMAGES):
	@$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: $(TOPTAGETS) $(IMAGES)

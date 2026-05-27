EXERCISES     := hello_world
CLEAN_TARGETS := $(addprefix clean-,$(EXERCISES))

all: $(EXERCISES)

$(EXERCISES):
	"$(MAKE)" -C $@

$(CLEAN_TARGETS):
	"$(MAKE)" -C $(patsubst clean-%,%,$@) clean

clean: $(CLEAN_TARGETS)

.PHONY: all clean $(EXERCISES) $(CLEAN_TARGETS)

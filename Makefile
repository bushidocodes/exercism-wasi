EXERCISES := hello_world

all: $(EXERCISES)

$(EXERCISES):
	$(MAKE) -C $@

clean:
	for e in $(EXERCISES); do $(MAKE) -C $$e clean; done

.PHONY: all clean $(EXERCISES)

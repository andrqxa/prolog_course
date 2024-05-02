include ../Make.options

.PHONY: default rebuild install clean 

default:
	$(MMC) --make $(PROGRAM_NAME)

rebuild:
	$(MMC) --rebuild $(PROGRAM_NAME)

install: default
	if [ ! -d $(INSTALL_PREFIX) ]; then mkdir $(INSTALL_PREFIX); fi
	cp $(PROGRAM_NAME)$(PROGRAM_EXT) $(INSTALL_PREFIX)  # Windows: copy 
	$(MAKE) clean

clean:
	$(MMC) --make $(PROGRAM_NAME).realclean
	if [ -d $(MERC_FOLDER) ]; then rm -rf $(MERC_FOLDER); fi
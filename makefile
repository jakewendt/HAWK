
BASE_DIR     = ${HOME}/.local
BASE_BIN_DIR = ${BASE_DIR}/bin

#	All scripts will be installed in this subdir
#	and linked from the parent. This will allow 
#	for the uninstallation of everything!
APPS_SUBDIR  = jakewendt_hawk

#	mkdir will raise error if dir exists
#	mkdir -p will not and would create full path
MKDIR        = mkdir -p


all:
	g++ hawk.cpp cpp/src/*.cpp -lm -lpthread -o hawk
	g++ bonf_fasta.cpp -o bonf_fasta
	g++ kmersearch.cpp -o kmersearch
	g++ kmersummary.cpp -o kmersummary
	g++ preProcess.cpp -o preProcess
	g++ convertToFasta.cpp -o convertToFasta
	g++ hawkgz.cpp cpp/src/*.cpp -lm -lpthread -lz -lboost_iostreams -o hawkgz
	g++ preProcess.cpp -o hawk_preProcess
	g++ convertToFasta.cpp -o hawk_convertToFasta

clean:
	rm -f hawk bonf_fasta kmersearch kmersummary preProcess convertToFasta hawkgz hawk_preProcess hawk_convertToFasta

uninstall:
	@printf "\nUNINSTALLING\n\n"
	cd $(BASE_BIN_DIR); \
		find . -lname $(APPS_SUBDIR)/\* -exec rm {} \;
	rm -rf $(BASE_BIN_DIR)/$(APPS_SUBDIR)
	@printf "\nDONE UNINSTALLING\n\n"

#	Remove old stuff.  Need -f or get an error.
install: uninstall
	$(MKDIR) $(BASE_BIN_DIR)/$(APPS_SUBDIR)
	@printf "\nINSTALLING\n\n"

	#	As the scripts dir contains other dirs which won't copy,
	#	we need to suppress the error by returning true or make will quit.
	#cp scripts/* $(BASE_BIN_DIR)/$(APPS_SUBDIR)/ || :
	#	then can remove all of the hawkDir and jellyfishDir in the references
	cp hawk hawkgz $(BASE_BIN_DIR)/$(APPS_SUBDIR)
	cp hawk_* $(BASE_BIN_DIR)/$(APPS_SUBDIR)
	cp countTotalKmer.awk $(BASE_BIN_DIR)/$(APPS_SUBDIR)/hawk_countTotalKmer.awk
	cp scripts/hawk_*bash $(BASE_BIN_DIR)/$(APPS_SUBDIR)
	cp scripts/hawk_*R $(BASE_BIN_DIR)/$(APPS_SUBDIR)
	cp supplements/jellyfish-Hawk/bin/jellyfish $(BASE_BIN_DIR)/$(APPS_SUBDIR)/hawk_jellyfish
	cp supplements/EIG6.0.1-Hawk/bin/smartpca $(BASE_BIN_DIR)/$(APPS_SUBDIR)/hawk_smartpca
	cp supplements/EIG6.0.1-Hawk/bin/evec2pca.perl $(BASE_BIN_DIR)/$(APPS_SUBDIR)/hawk_evec2pca.perl


	cd $(BASE_BIN_DIR); \
	for file in `find $(APPS_SUBDIR) -type f` ; do \
		echo $$file; \
		ln -s $$file; \
	done

	@printf "\nDONE INSTALLING\n\n"

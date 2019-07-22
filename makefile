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


install:
#	add an install
#	then can remove all of the hawkDir and jellyfishDir in the references
#	cp hawk hawkg ${INSTALL}
#	cp hawk_* ${INSTALL}/
#	cp scripts/hawk_*bash ${INSTALL}/
#	cp scripts/hawk_*R ${INSTALL}/
#	cp supplements/jellyfish-Hawk/bin/jellyfish $INSTALL/hawk_jellyfish
#	cp supplements/EIG6.0.1-Hawk/bin/smartpca $INSTALL/hawk_smartpca
#	cp supplements/EIG6.0.1-Hawk/bin/evec2pca.perl $INSTALL/hawk_evec2pca.perl


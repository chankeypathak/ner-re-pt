#!/bin/bash

printf "\n** training cutoff **\n"
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	for i in 0 {3..7} 10
	do
		FOLDER=../outputs/repeat-$r/joined
		MODEL=models/repeat-$r/experiences/cutoff/$i
		PARAMS=params/cutoff/$i.txt
		printf "\n** cutoff value: "$i" **\n"
		printf "\n** training categories **\n"
		time bin/opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data $FOLDER/cat_train_sent_doc.xml -params $PARAMS -model $MODEL/pt-ner-cat.bin
		printf "\n** training types **\n"
		time bin/opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data $FOLDER/types_train_sent_doc.xml -params $PARAMS -model $MODEL/pt-ner-types.bin
		printf "\n** training subtypes **\n"
		time bin/opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data $FOLDER/subtypes_train_sent_doc.xml -params $PARAMS -model $MODEL/pt-ner-subtypes.bin
		printf "\n** training filtered **\n"
		time bin/opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data $FOLDER/filtered_train_sent_doc.xml -params $PARAMS -model $MODEL/pt-ner-filtered.bin
	done
done


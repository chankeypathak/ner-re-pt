#!/bin/bash

java -d64 -Xms6g -Xmx14g -cp ../stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../../props/types.prop"
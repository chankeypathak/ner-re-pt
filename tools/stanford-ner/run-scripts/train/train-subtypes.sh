#!/bin/bash

java -d64 -Xmx14g -cp ../stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../../props/subtypes.prop"
#!/bin/bash
# Gather output files from an experiment into a single directory.

# parse command-line arguments
if [[ $# != 1 ]]; then
        echo "usage: $0 <output-dir>"
        exit -1
fi

OUTPUT_DIR="$1"

# move output files to a directory
mkdir $OUTPUT_DIR

mv .nextflow.log $OUTPUT_DIR/nextflow.log
mv report.html timeline.html trace.txt $OUTPUT_DIR

for SAMPLE_ID in [DES]RX*; do
	mkdir $OUTPUT_DIR/$SAMPLE_ID

	mv $SAMPLE_ID/*_fastqc.* $OUTPUT_DIR/$SAMPLE_ID
	mv $SAMPLE_ID/*.log      $OUTPUT_DIR/$SAMPLE_ID
	mv $SAMPLE_ID/*.bam      $OUTPUT_DIR/$SAMPLE_ID
	mv $SAMPLE_ID/*.fpkm     $OUTPUT_DIR/$SAMPLE_ID
	mv $SAMPLE_ID/*.tpm      $OUTPUT_DIR/$SAMPLE_ID
done

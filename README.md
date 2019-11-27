# Batcher

Copies directory of individual JSON objects into batched arrays of JSON objects in another directory.

## Usage

./run.rb [directory of single items][destination dir for batches] [batch size]

- Batch size defaults to 100

## Requirements

- Ruby

e.g.:

`./run.rb ./items ./batches 100`

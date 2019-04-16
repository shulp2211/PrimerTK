#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: "primer3 input file generator"

baseCommand: python3.6

inputs:
  genome_iterator:
    type: File
    inputBinding:
      position: 1
    default:
      class: File
      location: ../../../src/genome_iterator.py

  ref_genome:
    type: File
    inputBinding:
      position: 2
      prefix: -ref
  regions_file:
    type: File
    inputBinding:
      position: 3
      prefix: -in
  primer_opt_size:
    type: int
    default: 22
    inputBinding:
      position: 4
      prefix: -opt_size
  primer_min_size:
    type: int
    default: 18
    inputBinding:
      position: 5
      prefix: -min_size
  primer_max_size:
    type: int
    default: 25
    inputBinding:
      position: 6
      prefix: -max_size
  primer_opt_gc:
    type: int
    default: 50
    inputBinding:
      position: 7
      prefix: -opt_gc
  primer_min_gc:
    type: int
    default: 20
    inputBinding:
      position: 8
      prefix: -min_gc
  primer_max_gc:
    type: int
    default: 80
    inputBinding:
      position: 8
      prefix: -max_gc
  primer_opt_tm:
    type: int
    default: 60
    inputBinding:
      position: 9
      prefix: -opt_tm
  primer_min_tm:
    type: int
    default: 57
    inputBinding:
      position: 10
      prefix: -min_tm
  primer_max_tm:
    type: int
    default: 63
    inputBinding:
      position: 11
      prefix: -max_tm
  product_size_range:
    type: string
    default: '200-400'
    inputBinding:
      position: 12
      prefix: -sr
  flanking_region_size:
    type: int
    default: 200
    inputBinding:
      position: 13
      prefix: -flank
  sequence_target:
    type: string
    default: '199,1'
    inputBinding:
      position: 14
      prefix: -st
  mispriming_library:
    type: string
    inputBinding:
      position: 15
      prefix: -mp
  thermodynamics_path:
    type: string
    inputBinding:
      position: 16
      prefix: -tp

outputs:
  flanking_regions_file:
    type: File
    outputBinding:
      glob: '*.fasta'
  primer3_input_file:
    type: File
    outputBinding:
      glob: '*.txt'


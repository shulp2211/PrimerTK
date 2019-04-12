#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
id: "post pcr analysis"

baseCommand: python3.6

inputs:
  post_pcr:
    type: File
    inputBinding:
      position: 1
    default:
      class: File
      location: ../../../src/main_post_pcr.py

  pcr_output:
    type: File
    inputBinding:
      position: 2
      prefix: -i
  total_primers:
    type: File
    inputBinding:
      position: 3
      prefix: -tp

outputs:
  all_product_info:
    type: File
    outputBinding:
      glob: 'pcr_product_info.csv'
  filtered_good_primers:
    type: File
    outputBinding:
      glob: 'all_final_primers.csv'
  top_ranked_primers:
    type: File
    outputBinding:
      glob: 'top_final_primers.csv'
  idt_plate_fwd:
    type: File
    outputBinding:
      glob: 'plate_forward_primers.csv'
  idt_plate_rvs:
    type: File
    outputBinding:
      glob: 'plate_reverse_primers.csv'

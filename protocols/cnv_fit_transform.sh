#MOLGENIS walltime=02:00:00 mem=2gb ppn=1

#string pythonVersion
#string pythonEnvironment
#string bpmFile
#string pgxGenesBed37
#string cnvBedFile
#string pipelineRoot
#string arrayStagedIntensities
#string sampleListPrefix

set -e
set -u

# Now load the python version and activate the python environment
# to perform cnv calling
module load "${pythonVersion}"
module list

mkdir -p "${cnvOutDir}"

source ${pythonEnvironment}/bin/activate

python -u ${asterixRoot}/src/main/python/cnvcaller/core.py fit \
  --bead-pool-manifest "${bpmFile}" \
  --sample-list "${sampleListPrefix}.samples.txt" \
  --variants-prefix "${correctiveVariantsOutputDir}" \
  --out "${cnvOutDir}" \
  --input "${arrayStagedIntensities[@]}" \
  --config "${cnvConfig}"

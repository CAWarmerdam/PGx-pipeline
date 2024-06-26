#MOLGENIS walltime=23:59:00 mem=500mb nodes=1 ppn=8

#string chromosomeNumber
#string genotypesPlinkPrefix
#string plink2Version
#string pgxGenesBed37Flanked
#string genotypesPgxFilteredOutputDir

set -e
set -u

module load "${plink2Version}"
module list

mkdir -p ${genotypesPgxFilteredOutputDir}

plink2 --bfile ${genotypesPlinkPrefix} \
--extract bed1 ${pgxGenesBed37Flanked} \
--make-bed \
--out ${genotypesPgxFilteredOutputDir}/chr_${chromosomeNumber}
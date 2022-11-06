####################################################################
# Source
####################################################################
# python -m Experiments.Adaptive_Source_SAC --n-contr-samples=100000 --n-rl-itr=20001 --log-dir=boed_results/source  --bound-type=lower --id=1 --budget=30 --discount=0.9 --buffer-capacity=1000000 --tau=0.001 --pi-lr=0.0001 --qf-lr=0.0003 --ens-size=2
####################################################################
# CES
####################################################################
#CUDA_VISIBLE_DEVICES=0 python -m Experiments.Adaptive_CES_SAC --n-contr-samples=100000 --n-rl-itr=20001 --log-dir=boed_results/ces  --bound-type=lower --id=1 --budget=10 --discount=0.9 --buffer-capacity=1000000 | tee prey_ces.txt
####################################################################
# Prey
####################################################################
#mkdir boed_results
#PROBLEMS=( "Prey" )
#ALGOS=( "SAC" "CES" "REM" )
#for problem in "${PROBLEMS[@]}"
#do
#	for algo in "${ALGOS[@]}"
#	do
#		CUDA_VISIBLE_DEVICES=0 python -m Experiments.Adaptive_${problem}_${algo} --n-contr-samples=10000 --n-rl-itr=40001 --log-dir=boed_results/${problem}_${algo}  --bound-type=lower --id=1 --budget=10 --tau=0.01 --pi-lr=0.0001 --qf-lr=0.001 --discount=0.95 --buffer-capacity=1000000 --temp=1 --target-entropy=2.85189124 --ens-size=10 2>&1 | tee boed_results/${problem}_${algo}.txt
#	done
#done

mkdir boed_results
####################################################################
algo="SAC"
problem="Prey"
CUDA_VISIBLE_DEVICES=0 python -m Experiments.Adaptive_${problem}_${algo} --n-contr-samples=10000 --n-rl-itr=40001 --log-dir=boed_results/${problem}_${algo}  --bound-type=lower --id=1 --budget=10 --tau=0.01 --pi-lr=0.0001 --qf-lr=0.001 --discount=0.95 --buffer-capacity=1000000 --temp=1 --target-entropy=2.85189124 --ens-size=10 2>&1 | tee boed_results/${problem}_${algo}.txt
####################################################################
# Source
####################################################################
algo="SAC"
problem="Source"
CUDA_VISIBLE_DEVICES=0 python -m Experiments.Adaptive_${problem}_${algo} --n-contr-samples=100000 --n-rl-itr=20001 --log-dir=boed_results/${problem}_${algo}  --bound-type=lower --id=1 --budget=30 --discount=0.9 --buffer-capacity=1000000 --tau=0.001 --pi-lr=0.0001 --qf-lr=0.0003 --ens-size=2 | tee boed_results/${problem}_${algo}.txt
####################################################################
# CES
####################################################################
algo="SAC"
problem="CES"
CUDA_VISIBLE_DEVICES=0 python -m Experiments.Adaptive_${problem}_${algo} --n-contr-samples=100000 --n-rl-itr=20001 --log-dir=boed_results/${problem}_${algo}  --bound-type=lower --id=1 --budget=10 --discount=0.9 --buffer-capacity=1000000  | tee boed_results/${problem}_${algo}.txt
####################################################################



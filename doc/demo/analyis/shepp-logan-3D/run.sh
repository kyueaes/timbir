module load devel
#module load valgrind
cd $PBS_O_WORKDIR
export PARALLEL=1
export OMP_NUM_THREADS=32
uniq < $PBS_NODEFILE > nodefile

# THE REGULARIZATION PARAMETERS USED IN THIS EXAMPLE ARE NOT OPTIMAL. IT IS JUST A WORKING CASE.
mpiexec -n 1 -machinefile nodefile ../../Source_Code/reconstruct/basic/XT_Main --proj_rows 16 --proj_cols 256 --proj_num 256 --recon_num 1 --vox_wid 1 --rot_center 128 --sig_s 0.01 --sig_t 1 --c_s 0.00001 --c_t 0.00001 --convg_thresh 1 --remove_rings 0 --quad_convex 
#mpiexec -n 1 -machinefile nodefile valgrind --tool=memcheck --leak-check=full --show-reachable=yes --track-origins=yes ../../Source_Code/reconstruct/basic/XT_Main --proj_rows 4 --proj_cols 256 --proj_num 256 --recon_num 1 --vox_wid 1 --rot_center 128 --sig_s 0.01 --sig_t 1 --c_s 0.00001 --c_t 0.00001 --convg_thresh 5 --remove_rings 0 --quad_convex
#mpiexec -n 1 -machinefile nodefile valgrind --tool=memcheck --leak-check=full --track-origins=yes ../../Source_Code/reconstruct/basic/XT_Main --proj_rows 4 --proj_cols 256 --proj_num 256 --recon_num 1 --vox_wid 1 --rot_center 128 --sig_s 0.01 --sig_t 1 --c_s 0.00001 --c_t 0.00001 --convg_thresh 5 --remove_rings 0 --quad_convex

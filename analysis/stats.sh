/well/ludwig/users/lay823/larvae_nsc
[lay823@cluster1 larvae_nsc]$ squeue -u lay823
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
          16396733      long scaleple   lay823 PD       0:00      1 (Priority)
          16394765     short     bash   lay823 PD       0:00      1 (Priority)
[lay823@cluster1 larvae_nsc]$ du -sh *
1.1T	data
16G	reference
512	scaleplex_master.sh
7.2G	ScaleRna
9.5M	test
679M	test_inst
698M	work
[lay823@cluster1 larvae_nsc]$ 

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCC4ECE;
	Sun, 28 Jan 2024 00:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706402178; cv=none; b=mXwIbFvt9EHdWJ5utTQforvkYx76u9f1KQOBTB6lmp5KXEahdj8zcJeDEhct2ZTw31RtxG6bJW7Q3MzyGH5+av2K9gQedGpMD4j/bhh76mxNKepdHTqG5ffl187mfkQN5H/1B7D06LQYwAiBNAbaxk7aktioD0ONNgSAqlLc5hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706402178; c=relaxed/simple;
	bh=1clQCqDjTcdSWqY6ti18A4Sy/4mdgvg4BIB/nexxO4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kfkpLnlucLiUPBlBTdmVhOpEstC1iftdg+xAfakJFx/92tVcSaIpls/QYyJasjgijknaGivpoM3EKQJMhv+eZNreCbqoT2mz/wQ8w9oYR2eRIRiI1TJ0fFLIGvUQ7JUB8sfBENnQeGbttdgHgaDdujNcAojNihHxbnXL2DSsQbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdwoSzEt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdwoSzEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706402176; x=1737938176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1clQCqDjTcdSWqY6ti18A4Sy/4mdgvg4BIB/nexxO4E=;
  b=GdwoSzEtYiM0NpOJq3UY1YE19ZVya1csNA6JwPIt90XZfKIe9wjllXs0
   aUzK64Cb9k4fYXM/8ink//gcw2rcbZQW3QMSmaFGhxzJrEKGLkKoPi+5p
   U/YW2udEMJEiGT8sXV+s8V9qK35YXZmC3AvZ53IAWyNoF13rzvecTiWDR
   9pCyy3OlO7PLgJeR163nYYMmcUFxfu363k9PeTdfmSW53R+U0KIpwHLDH
   d/8XBGf9nAxG+mr7cg8qqE8/7XjtY87e8zhV430lFekOO/+lPuNFjxPCl
   aijwBXAzAqEfgSPvSbh7jrNWbRei0zljpnSTD3oaXnEjg03QZyca7LQWm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="9835862"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9835862"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 16:36:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3097719"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Jan 2024 16:36:09 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTt9a-0002uh-12;
	Sun, 28 Jan 2024 00:36:06 +0000
Date: Sun, 28 Jan 2024 08:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 11/42] fs/fuse/file.c:2512:7: error: no member
 named 'fl_pid' in 'struct file_lock'; did you mean 'fl_end'?
Message-ID: <202401280812.Rp5gw8OV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   c5d95cb3372545ee787fd317010a6213b2ba740c
commit: 28c6b852f23ef8478f37a63df89778175e127b89 [11/42] filelock: split common fields into struct file_lock_core
config: i386-buildonly-randconfig-003-20240128 (https://download.01.org/0day-ci/archive/20240128/202401280812.Rp5gw8OV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280812.Rp5gw8OV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280812.Rp5gw8OV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fuse/file.c:2512:7: error: no member named 'fl_pid' in 'struct file_lock'; did you mean 'fl_end'?
    2512 |                 fl->fl_pid = pid_nr_ns(find_pid_ns(ffl->pid, fc->pid_ns), &init_pid_ns);
         |                     ^~~~~~
         |                     fl_end
   include/linux/filelock.h:127:9: note: 'fl_end' declared here
     127 |         loff_t fl_end;
         |                ^
>> fs/fuse/file.c:2519:6: error: no member named 'fl_type' in 'struct file_lock'
    2519 |         fl->fl_type = ffl->type;
         |         ~~  ^
>> fs/fuse/file.c:2533:44: error: no member named 'fl_owner' in 'struct file_lock'
    2533 |         inarg->owner = fuse_lock_owner_id(fc, fl->fl_owner);
         |                                               ~~  ^
   fs/fuse/file.c:2536:23: error: no member named 'fl_type' in 'struct file_lock'
    2536 |         inarg->lk.type = fl->fl_type;
         |                          ~~  ^
>> fs/fuse/file.c:2573:20: error: no member named 'fl_flags' in 'struct file_lock'
    2573 |         int opcode = (fl->fl_flags & FL_SLEEP) ? FUSE_SETLKW : FUSE_SETLK;
         |                       ~~  ^
   fs/fuse/file.c:2574:24: error: no member named 'fl_type' in 'struct file_lock'
    2574 |         struct pid *pid = fl->fl_type != F_UNLCK ? task_tgid(current) : NULL;
         |                           ~~  ^
   fs/fuse/file.c:2584:11: error: no member named 'fl_flags' in 'struct file_lock'
    2584 |         if ((fl->fl_flags & FL_CLOSE_POSIX) == FL_CLOSE_POSIX)
         |              ~~  ^
   7 errors generated.


vim +2512 fs/fuse/file.c

55752a3aba1387 Miklos Szeredi      2019-01-24  2489  
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2490  static int convert_fuse_file_lock(struct fuse_conn *fc,
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2491  				  const struct fuse_file_lock *ffl,
7142125937e148 Miklos Szeredi      2006-06-25  2492  				  struct file_lock *fl)
7142125937e148 Miklos Szeredi      2006-06-25  2493  {
7142125937e148 Miklos Szeredi      2006-06-25  2494  	switch (ffl->type) {
7142125937e148 Miklos Szeredi      2006-06-25  2495  	case F_UNLCK:
7142125937e148 Miklos Szeredi      2006-06-25  2496  		break;
7142125937e148 Miklos Szeredi      2006-06-25  2497  
7142125937e148 Miklos Szeredi      2006-06-25  2498  	case F_RDLCK:
7142125937e148 Miklos Szeredi      2006-06-25  2499  	case F_WRLCK:
7142125937e148 Miklos Szeredi      2006-06-25  2500  		if (ffl->start > OFFSET_MAX || ffl->end > OFFSET_MAX ||
7142125937e148 Miklos Szeredi      2006-06-25  2501  		    ffl->end < ffl->start)
7142125937e148 Miklos Szeredi      2006-06-25  2502  			return -EIO;
7142125937e148 Miklos Szeredi      2006-06-25  2503  
7142125937e148 Miklos Szeredi      2006-06-25  2504  		fl->fl_start = ffl->start;
7142125937e148 Miklos Szeredi      2006-06-25  2505  		fl->fl_end = ffl->end;
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2506  
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2507  		/*
9d5b86ac13c573 Benjamin Coddington 2017-07-16  2508  		 * Convert pid into init's pid namespace.  The locks API will
9d5b86ac13c573 Benjamin Coddington 2017-07-16  2509  		 * translate it into the caller's pid namespace.
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2510  		 */
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2511  		rcu_read_lock();
9d5b86ac13c573 Benjamin Coddington 2017-07-16 @2512  		fl->fl_pid = pid_nr_ns(find_pid_ns(ffl->pid, fc->pid_ns), &init_pid_ns);
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2513  		rcu_read_unlock();
7142125937e148 Miklos Szeredi      2006-06-25  2514  		break;
7142125937e148 Miklos Szeredi      2006-06-25  2515  
7142125937e148 Miklos Szeredi      2006-06-25  2516  	default:
7142125937e148 Miklos Szeredi      2006-06-25  2517  		return -EIO;
7142125937e148 Miklos Szeredi      2006-06-25  2518  	}
7142125937e148 Miklos Szeredi      2006-06-25 @2519  	fl->fl_type = ffl->type;
7142125937e148 Miklos Szeredi      2006-06-25  2520  	return 0;
7142125937e148 Miklos Szeredi      2006-06-25  2521  }
7142125937e148 Miklos Szeredi      2006-06-25  2522  
7078187a795f86 Miklos Szeredi      2014-12-12  2523  static void fuse_lk_fill(struct fuse_args *args, struct file *file,
a9ff4f87056cd3 Miklos Szeredi      2007-10-18  2524  			 const struct file_lock *fl, int opcode, pid_t pid,
7078187a795f86 Miklos Szeredi      2014-12-12  2525  			 int flock, struct fuse_lk_in *inarg)
7142125937e148 Miklos Szeredi      2006-06-25  2526  {
6131ffaa1f0914 Al Viro             2013-02-27  2527  	struct inode *inode = file_inode(file);
9c8ef5614da226 Miklos Szeredi      2006-06-25  2528  	struct fuse_conn *fc = get_fuse_conn(inode);
7142125937e148 Miklos Szeredi      2006-06-25  2529  	struct fuse_file *ff = file->private_data;
7078187a795f86 Miklos Szeredi      2014-12-12  2530  
7078187a795f86 Miklos Szeredi      2014-12-12  2531  	memset(inarg, 0, sizeof(*inarg));
7078187a795f86 Miklos Szeredi      2014-12-12  2532  	inarg->fh = ff->fh;
7078187a795f86 Miklos Szeredi      2014-12-12 @2533  	inarg->owner = fuse_lock_owner_id(fc, fl->fl_owner);
7078187a795f86 Miklos Szeredi      2014-12-12  2534  	inarg->lk.start = fl->fl_start;
7078187a795f86 Miklos Szeredi      2014-12-12  2535  	inarg->lk.end = fl->fl_end;
7078187a795f86 Miklos Szeredi      2014-12-12  2536  	inarg->lk.type = fl->fl_type;
7078187a795f86 Miklos Szeredi      2014-12-12  2537  	inarg->lk.pid = pid;
a9ff4f87056cd3 Miklos Szeredi      2007-10-18  2538  	if (flock)
7078187a795f86 Miklos Szeredi      2014-12-12  2539  		inarg->lk_flags |= FUSE_LK_FLOCK;
d5b4854357f478 Miklos Szeredi      2019-09-10  2540  	args->opcode = opcode;
d5b4854357f478 Miklos Szeredi      2019-09-10  2541  	args->nodeid = get_node_id(inode);
d5b4854357f478 Miklos Szeredi      2019-09-10  2542  	args->in_numargs = 1;
d5b4854357f478 Miklos Szeredi      2019-09-10  2543  	args->in_args[0].size = sizeof(*inarg);
d5b4854357f478 Miklos Szeredi      2019-09-10  2544  	args->in_args[0].value = inarg;
7142125937e148 Miklos Szeredi      2006-06-25  2545  }
7142125937e148 Miklos Szeredi      2006-06-25  2546  
7142125937e148 Miklos Szeredi      2006-06-25  2547  static int fuse_getlk(struct file *file, struct file_lock *fl)
7142125937e148 Miklos Szeredi      2006-06-25  2548  {
6131ffaa1f0914 Al Viro             2013-02-27  2549  	struct inode *inode = file_inode(file);
fcee216beb9c15 Max Reitz           2020-05-06  2550  	struct fuse_mount *fm = get_fuse_mount(inode);
7078187a795f86 Miklos Szeredi      2014-12-12  2551  	FUSE_ARGS(args);
7078187a795f86 Miklos Szeredi      2014-12-12  2552  	struct fuse_lk_in inarg;
7142125937e148 Miklos Szeredi      2006-06-25  2553  	struct fuse_lk_out outarg;
7142125937e148 Miklos Szeredi      2006-06-25  2554  	int err;
7142125937e148 Miklos Szeredi      2006-06-25  2555  
7078187a795f86 Miklos Szeredi      2014-12-12  2556  	fuse_lk_fill(&args, file, fl, FUSE_GETLK, 0, 0, &inarg);
d5b4854357f478 Miklos Szeredi      2019-09-10  2557  	args.out_numargs = 1;
d5b4854357f478 Miklos Szeredi      2019-09-10  2558  	args.out_args[0].size = sizeof(outarg);
d5b4854357f478 Miklos Szeredi      2019-09-10  2559  	args.out_args[0].value = &outarg;
fcee216beb9c15 Max Reitz           2020-05-06  2560  	err = fuse_simple_request(fm, &args);
7142125937e148 Miklos Szeredi      2006-06-25  2561  	if (!err)
fcee216beb9c15 Max Reitz           2020-05-06  2562  		err = convert_fuse_file_lock(fm->fc, &outarg.lk, fl);
7142125937e148 Miklos Szeredi      2006-06-25  2563  
7142125937e148 Miklos Szeredi      2006-06-25  2564  	return err;
7142125937e148 Miklos Szeredi      2006-06-25  2565  }
7142125937e148 Miklos Szeredi      2006-06-25  2566  
a9ff4f87056cd3 Miklos Szeredi      2007-10-18  2567  static int fuse_setlk(struct file *file, struct file_lock *fl, int flock)
7142125937e148 Miklos Szeredi      2006-06-25  2568  {
6131ffaa1f0914 Al Viro             2013-02-27  2569  	struct inode *inode = file_inode(file);
fcee216beb9c15 Max Reitz           2020-05-06  2570  	struct fuse_mount *fm = get_fuse_mount(inode);
7078187a795f86 Miklos Szeredi      2014-12-12  2571  	FUSE_ARGS(args);
7078187a795f86 Miklos Szeredi      2014-12-12  2572  	struct fuse_lk_in inarg;
7142125937e148 Miklos Szeredi      2006-06-25 @2573  	int opcode = (fl->fl_flags & FL_SLEEP) ? FUSE_SETLKW : FUSE_SETLK;
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2574  	struct pid *pid = fl->fl_type != F_UNLCK ? task_tgid(current) : NULL;
fcee216beb9c15 Max Reitz           2020-05-06  2575  	pid_t pid_nr = pid_nr_ns(pid, fm->fc->pid_ns);
7142125937e148 Miklos Szeredi      2006-06-25  2576  	int err;
7142125937e148 Miklos Szeredi      2006-06-25  2577  
8fb47a4fbf858a J. Bruce Fields     2011-07-20  2578  	if (fl->fl_lmops && fl->fl_lmops->lm_grant) {
48e90761b570ff Miklos Szeredi      2008-07-25  2579  		/* NLM needs asynchronous locks, which we don't support yet */
48e90761b570ff Miklos Szeredi      2008-07-25  2580  		return -ENOLCK;
48e90761b570ff Miklos Szeredi      2008-07-25  2581  	}
48e90761b570ff Miklos Szeredi      2008-07-25  2582  
7142125937e148 Miklos Szeredi      2006-06-25  2583  	/* Unlock on close is handled by the flush method */
50f2112cf7a3e6 Benjamin Coddington 2017-04-11  2584  	if ((fl->fl_flags & FL_CLOSE_POSIX) == FL_CLOSE_POSIX)
7142125937e148 Miklos Szeredi      2006-06-25  2585  		return 0;
7142125937e148 Miklos Szeredi      2006-06-25  2586  
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2587  	fuse_lk_fill(&args, file, fl, opcode, pid_nr, flock, &inarg);
fcee216beb9c15 Max Reitz           2020-05-06  2588  	err = fuse_simple_request(fm, &args);
7142125937e148 Miklos Szeredi      2006-06-25  2589  
a4d27e75ffb7b8 Miklos Szeredi      2006-06-25  2590  	/* locking is restartable */
a4d27e75ffb7b8 Miklos Szeredi      2006-06-25  2591  	if (err == -EINTR)
a4d27e75ffb7b8 Miklos Szeredi      2006-06-25  2592  		err = -ERESTARTSYS;
7078187a795f86 Miklos Szeredi      2014-12-12  2593  
7142125937e148 Miklos Szeredi      2006-06-25  2594  	return err;
7142125937e148 Miklos Szeredi      2006-06-25  2595  }
7142125937e148 Miklos Szeredi      2006-06-25  2596  

:::::: The code at line 2512 was first introduced by commit
:::::: 9d5b86ac13c573795525ecac6ed2db39ab23e2a8 fs/locks: Remove fl_nspid and use fs-specific l_pid for remote locks

:::::: TO: Benjamin Coddington <bcodding@redhat.com>
:::::: CC: Jeff Layton <jlayton@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

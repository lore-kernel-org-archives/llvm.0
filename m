Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EED208AD;
	Sun, 28 Jan 2024 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706446112; cv=none; b=X3KjUIvoBovP+iTz2E6gaemtioyVN6gJQRKXmiZb+WWKrevv9Dn7tExSzq2GH7jhtjdDkNJmXY/KomP0gCv5w4LDYttMpruXBz7AiwcUw2GFsEhvXnpSri1k+K1T42JNe7c+L7g88DRpneH5FwvccnWnB6g1/oTAub2yS1GF+tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706446112; c=relaxed/simple;
	bh=vfS0G4Q+/CnUVu1/XpiamJkmzbGp1G91B9RQB+T0DWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VgnpuoFxj+S/PbyTnapFn9a9NK6edZkxs2TFjGyXm0EYhZPI/64UyQe4qQcgRdeAar0EG6+iKFvRdWI9324DRyab7gTFjDKvvz6E40RDXI+Gqqo9PU9zZWBg4/eM/iRq2uvwDRc/8ePqlcD6Wjca51WogRjm+t1HodcTBjcjGX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JiOYs81F; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JiOYs81F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706446109; x=1737982109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vfS0G4Q+/CnUVu1/XpiamJkmzbGp1G91B9RQB+T0DWU=;
  b=JiOYs81Fe+XYjIjm0OXh3QKtZXefwGDi1eXp6af9L44iJEN1vbwRs4zc
   HwWD04bUA/nYQ6rvCGL9I71k9eBYFzhbSIMGHB+65v461ZwSyLiJaMyjy
   yvQKgtDaicOnXwLau7GvyFgcGJtx0yTI4+VDQLtk/rdUty9L5zclE49tH
   1KgmngpD6c6vZkDwT7x5hdSIvSpzXqM2zvpXmBo95OI0ZE8F0/jgxFq1I
   uB0nVrbbNv15y4YJ0TH2mmqxFCNsNcinGeZLYJhhYvLroQie5J8l3mK+i
   K41CrcsNzuzvzjj7F9LspaotT8Sk1aTtHSudxBERvSZIAW5MKk7yU903w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="406494867"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="406494867"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 04:48:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="21837490"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2024 04:48:27 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU4aH-0003Oq-0A;
	Sun, 28 Jan 2024 12:48:25 +0000
Date: Sun, 28 Jan 2024 20:48:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:flsplit2 11/42] fs/fuse/file.c:2512:7: error: no member
 named 'fl_pid' in 'struct file_lock'; did you mean 'fl_end'?
Message-ID: <202401282011.odbgKcIu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git flsplit2
head:   43c094289e51b0d2e1b3a8b7a6cda14ddcaec4ba
commit: 48df0dcdbded452c1d8cc84652f8705a574bb1fc [11/42] filelock: split common fields into struct file_lock_core
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240128/202401282011.odbgKcIu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401282011.odbgKcIu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401282011.odbgKcIu-lkp@intel.com/

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
   fs/fuse/file.c:2573:20: error: no member named 'fl_flags' in 'struct file_lock'
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

:::::: The code at line 2512 was first introduced by commit
:::::: 9d5b86ac13c573795525ecac6ed2db39ab23e2a8 fs/locks: Remove fl_nspid and use fs-specific l_pid for remote locks

:::::: TO: Benjamin Coddington <bcodding@redhat.com>
:::::: CC: Jeff Layton <jlayton@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

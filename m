Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA48E1D68C;
	Fri,  5 Jan 2024 07:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1ZFzRMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704439162; x=1735975162;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EVi7xzinGzVxgRZPvqmQffpHeA90r1b+wyL9xLMrw0U=;
  b=m1ZFzRMvPHfTBzL2n2+Aa994jEbecnZIkhab/sdLNFqMM2U6dvhEZ7jb
   pWiSxQjz+DE/T0TsUZSbuf/vf8RRAhUsUYvAruQbx+k/sgXDEQXkzyta9
   33r3cffgIEebwyAYjaTDRuCgU1cxtZ7g8D07EML+pboNNZiD6xMHTLl4u
   jMrGDAVvJmNDDyN67lxCjpbUPv01dy80/EN83dbL4dZiAlO4mQSQRT3zp
   xNQC1CE/tSuVDCa6XHzDiKfF7akumPga5xWtuYeITEGStmhuTvs0wRYGE
   vJ/fm+YgErFiHK9BlwOA58av4s9RD/M7uLW9L5t6G2vwXfaCWx2xm3XKZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="400210709"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="400210709"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 23:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="29053403"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Jan 2024 23:19:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLeU8-0000vY-2S;
	Fri, 05 Jan 2024 07:19:16 +0000
Date: Fri, 5 Jan 2024 15:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:leases 8/8] fs/dlm/plock.c:265:7: error: no member named
 'fl_flags' in 'struct file_lock'
Message-ID: <202401051551.dziIMfHM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Jeff,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git leases
head:   bfa9c95ea16416c581e8940d6d36de21aca94011
commit: bfa9c95ea16416c581e8940d6d36de21aca94011 [8/8] filelock: move fl_flags into fl_core
config: i386-buildonly-randconfig-002-20240105 (https://download.01.org/0day-ci/archive/20240105/202401051551.dziIMfHM-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401051551.dziIMfHM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401051551.dziIMfHM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/dlm/plock.c:265:7: error: no member named 'fl_flags' in 'struct file_lock'
     265 |         flc->fl_flags &= ~FL_SLEEP;
         |         ~~~  ^
   fs/dlm/plock.c:298:31: error: no member named 'fl_flags' in 'struct file_lock'
     298 |         unsigned char fl_flags = fl->fl_flags;
         |                                  ~~  ^
   fs/dlm/plock.c:311:6: error: no member named 'fl_flags' in 'struct file_lock'
     311 |         fl->fl_flags |= FL_EXISTS;
         |         ~~  ^
   fs/dlm/plock.c:334:10: error: no member named 'fl_flags' in 'struct file_lock'
     334 |         if (fl->fl_flags & FL_CLOSE) {
         |             ~~  ^
   fs/dlm/plock.c:355:6: error: no member named 'fl_flags' in 'struct file_lock'
     355 |         fl->fl_flags = fl_flags;
         |         ~~  ^
   fs/dlm/plock.c:474:7: error: no member named 'fl_flags' in 'struct file_lock'
     474 |                 fl->fl_flags = FL_POSIX;
         |                 ~~  ^
   6 errors generated.
--
>> fs/ceph/locks.c:230:32: error: no member named 'fl_flags' in 'struct file_lock'
     230 |         unsigned int orig_flags = fl->fl_flags;
         |                                   ~~  ^
   fs/ceph/locks.c:231:6: error: no member named 'fl_flags' in 'struct file_lock'
     231 |         fl->fl_flags |= FL_EXISTS;
         |         ~~  ^
   fs/ceph/locks.c:233:6: error: no member named 'fl_flags' in 'struct file_lock'
     233 |         fl->fl_flags = orig_flags;
         |         ~~  ^
   fs/ceph/locks.c:256:12: error: no member named 'fl_flags' in 'struct file_lock'
     256 |         if (!(fl->fl_flags & FL_POSIX))
         |               ~~  ^
   fs/ceph/locks.c:322:12: error: no member named 'fl_flags' in 'struct file_lock'
     322 |         if (!(fl->fl_flags & FL_FLOCK))
         |               ~~  ^
   5 errors generated.
--
>> fs/nfsd/filecache.c:665:10: error: no member named 'fl_flags' in 'struct file_lock'
     665 |         if (fl->fl_flags & FL_LEASE)
         |             ~~  ^
   1 error generated.
--
>> fs/9p/vfs_file.c:130:14: error: no member named 'fl_flags' in 'struct file_lock'
     130 |         BUG_ON((fl->fl_flags & FL_POSIX) != FL_POSIX);
         |                 ~~  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                             ^~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/9p/vfs_file.c:327:12: error: no member named 'fl_flags' in 'struct file_lock'
     327 |         if (!(fl->fl_flags & FL_FLOCK))
         |               ~~  ^
   fs/9p/vfs_file.c:335:6: error: no member named 'fl_flags' in 'struct file_lock'
     335 |         fl->fl_flags |= FL_POSIX;
         |         ~~  ^
   fs/9p/vfs_file.c:336:6: error: no member named 'fl_flags' in 'struct file_lock'
     336 |         fl->fl_flags ^= FL_FLOCK;
         |         ~~  ^
   4 errors generated.
--
>> fs/ocfs2/locks.c:57:11: error: no member named 'fl_flags' in 'struct file_lock'
      57 |                 request.fl_flags = FL_FLOCK;
         |                 ~~~~~~~ ^
   fs/ocfs2/locks.c:103:12: error: no member named 'fl_flags' in 'struct file_lock'
     103 |         if (!(fl->fl_flags & FL_FLOCK))
         |               ~~  ^
   fs/ocfs2/locks.c:121:12: error: no member named 'fl_flags' in 'struct file_lock'
     121 |         if (!(fl->fl_flags & FL_POSIX))
         |               ~~  ^
   3 errors generated.


vim +265 fs/dlm/plock.c

586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  240  
af901ca181d92a fs/dlm/plock.c              André Goddard Rosa 2009-11-14  241  /* Returns failure iff a successful lock operation should be canceled */
2402211a838928 fs/dlm/plock.c              David Teigland     2008-03-14  242  static int dlm_plock_callback(struct plock_op *op)
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  243  {
bcbb4ba6c9ba81 fs/dlm/plock.c              Alexander Aring    2022-04-04  244  	struct plock_async_data *op_data = op->data;
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  245  	struct file *file;
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  246  	struct file_lock *fl;
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  247  	struct file_lock *flc;
d0449b90f80f26 fs/dlm/plock.c              Joe Perches        2014-08-22  248  	int (*notify)(struct file_lock *fl, int result) = NULL;
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  249  	int rv = 0;
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  250  
a559790caa1c6c fs/dlm/plock.c              Alexander Aring    2022-04-04  251  	WARN_ON(!list_empty(&op->list));
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  252  
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  253  	/* check if the following 2 are still valid or make a copy */
bcbb4ba6c9ba81 fs/dlm/plock.c              Alexander Aring    2022-04-04  254  	file = op_data->file;
bcbb4ba6c9ba81 fs/dlm/plock.c              Alexander Aring    2022-04-04  255  	flc = &op_data->flc;
bcbb4ba6c9ba81 fs/dlm/plock.c              Alexander Aring    2022-04-04  256  	fl = op_data->fl;
bcbb4ba6c9ba81 fs/dlm/plock.c              Alexander Aring    2022-04-04  257  	notify = op_data->callback;
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  258  
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  259  	if (op->info.rv) {
d0449b90f80f26 fs/dlm/plock.c              Joe Perches        2014-08-22  260  		notify(fl, op->info.rv);
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  261  		goto out;
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  262  	}
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  263  
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  264  	/* got fs lock; bookkeep locally as well: */
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14 @265  	flc->fl_flags &= ~FL_SLEEP;
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  266  	if (posix_lock_file(file, flc, NULL)) {
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  267  		/*
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  268  		 * This can only happen in the case of kmalloc() failure.
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  269  		 * The filesystem's own lock is the authoritative lock,
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  270  		 * so a failure to get the lock locally is not a disaster.
2402211a838928 fs/dlm/plock.c              David Teigland     2008-03-14  271  		 * As long as the fs cannot reliably cancel locks (especially
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  272  		 * in a low-memory situation), we're better off ignoring
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  273  		 * this failure than trying to recover.
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  274  		 */
2402211a838928 fs/dlm/plock.c              David Teigland     2008-03-14  275  		log_print("dlm_plock_callback: vfs lock error %llx file %p fl %p",
2402211a838928 fs/dlm/plock.c              David Teigland     2008-03-14  276  			  (unsigned long long)op->info.number, file, fl);
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  277  	}
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  278  
d0449b90f80f26 fs/dlm/plock.c              Joe Perches        2014-08-22  279  	rv = notify(fl, 0);
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  280  	if (rv) {
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  281  		/* XXX: We need to cancel the fs lock here: */
99c58d6480d937 fs/dlm/plock.c              Alexander Aring    2023-07-20  282  		log_print("%s: lock granted after lock request failed; dangling lock!",
99c58d6480d937 fs/dlm/plock.c              Alexander Aring    2023-07-20  283  			  __func__);
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  284  		goto out;
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  285  	}
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  286  
586759f03e2e90 fs/gfs2/locking/dlm/plock.c Marc Eshel         2006-11-14  287  out:
bcbb4ba6c9ba81 fs/dlm/plock.c              Alexander Aring    2022-04-04  288  	dlm_release_plock_op(op);
869d81df53ad28 fs/gfs2/locking/dlm/plock.c David Teigland     2006-01-17  289  	return rv;
869d81df53ad28 fs/gfs2/locking/dlm/plock.c David Teigland     2006-01-17  290  }
869d81df53ad28 fs/gfs2/locking/dlm/plock.c David Teigland     2006-01-17  291  

:::::: The code at line 265 was first introduced by commit
:::::: 586759f03e2e9031ac5589912a51a909ed53c30a gfs2: nfs lock support for gfs2

:::::: TO: Marc Eshel <eshel@almaden.ibm.com>
:::::: CC: J. Bruce Fields <bfields@citi.umich.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

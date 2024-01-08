Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6F863A1;
	Mon,  8 Jan 2024 06:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1SuYb9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704695392; x=1736231392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tDt9fsyl42BAfmS/nboLfLKjst8BkgIMZHFaLQmEEu0=;
  b=k1SuYb9YSiH7g0D5xKKz53HP4GYC/MOCJmtAIVFWse42LEvg8goXunH/
   bLzjHnOfDva1atOrMuntji++cN1YQU9CxhoEOhiqA0EPr58P8M/BAI7K/
   XuG3oUUDL8b9d2/gbnfjG/6I3Z+GLRszRMgfvJlfRMllNI7gAjQKiJAvK
   J1AlJCPLQQHErbuFS9dl1egAhR5UsBbuEl9loH3Rik1hDzGt4a7aaxsAs
   oYB0XSx0PHHPXwOwcbH8DgUy9I3MhSufIyv7l2n/4yULTHQ0EEbx8CUf8
   au60yUeSUme3dWy9LLvWRRZwPhDMmImF2ca8j1lXzpLjGb8l4pR2MQxPt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="483986960"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="483986960"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 22:29:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="781321970"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="781321970"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 07 Jan 2024 22:29:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMj8r-0004UW-2B;
	Mon, 08 Jan 2024 06:29:45 +0000
Date: Mon, 8 Jan 2024 14:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:filelock-6.9 10/11] fs/afs/flock.c:115:22: error: expected
 ';' at end of declaration
Message-ID: <202401081419.ySoub5qC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git filelock-6.9
head:   fbf183d9e9c1309edc5fca747309c7c595c12090
commit: a93f3917a4e31e2a760cca892ba86ff5b38e16e1 [10/11] filelock: move fl_type into fl_core
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240108/202401081419.ySoub5qC-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401081419.ySoub5qC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401081419.ySoub5qC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/afs/flock.c:115:22: error: expected ';' at end of declaration
     115 |         unsigned int fl_core.fl_type = F_RDLCK;
         |                             ^
         |                             ;
>> fs/afs/flock.c:120:10: error: member reference base type 'unsigned int' is not a structure or union
     120 |                 fl_core.fl_type = F_WRLCK;
         |                 ~~~~~~~^~~~~~~~
   fs/afs/flock.c:124:36: error: member reference base type 'unsigned int' is not a structure or union
     124 |                     p->fl_core.fl_type == fl_core.fl_type &&
         |                                           ~~~~~~~^~~~~~~~
   fs/afs/flock.c:527:12: error: no member named 'fl_flags' in 'struct file_lock'
     527 |             !(fl->fl_flags & FL_SLEEP)) {
         |               ~~  ^
   fs/afs/flock.c:624:12: error: no member named 'fl_flags' in 'struct file_lock'
     624 |         if (!(fl->fl_flags & FL_SLEEP)) {
         |               ~~  ^
   fs/afs/flock.c:772:34: error: no member named 'fl_flags' in 'struct file_lock'
     772 |                fl->fl_core.fl_type, fl->fl_flags,
         |                                     ~~  ^
   fs/afs/internal.h:1672:16: note: expanded from macro '_enter'
    1672 |                 kenter(FMT,##__VA_ARGS__);              \
         |                              ^~~~~~~~~~~
   fs/afs/internal.h:1654:63: note: expanded from macro 'kenter'
    1654 | #define kenter(FMT,...) dbgprintk("==> %s("FMT")",__func__ ,##__VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   fs/afs/internal.h:1652:46: note: expanded from macro 'dbgprintk'
    1652 |         printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
         |                                                     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   fs/afs/flock.c:807:34: error: no member named 'fl_flags' in 'struct file_lock'
     807 |                fl->fl_core.fl_type, fl->fl_flags);
         |                                     ~~  ^
   fs/afs/internal.h:1672:16: note: expanded from macro '_enter'
    1672 |                 kenter(FMT,##__VA_ARGS__);              \
         |                              ^~~~~~~~~~~
   fs/afs/internal.h:1654:63: note: expanded from macro 'kenter'
    1654 | #define kenter(FMT,...) dbgprintk("==> %s("FMT")",__func__ ,##__VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   fs/afs/internal.h:1652:46: note: expanded from macro 'dbgprintk'
    1652 |         printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
         |                                                     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   fs/afs/flock.c:816:12: error: no member named 'fl_flags' in 'struct file_lock'
     816 |         if (!(fl->fl_flags & FL_FLOCK))
         |               ~~  ^
   8 errors generated.


vim +115 fs/afs/flock.c

   105	
   106	/*
   107	 * If an error is specified, reject every pending lock that matches the
   108	 * authentication and type of the lock we failed to get.  If there are any
   109	 * remaining lockers, try to wake up one of them to have a go.
   110	 */
   111	static void afs_next_locker(struct afs_vnode *vnode, int error)
   112	{
   113		struct file_lock *p, *_p, *next = NULL;
   114		struct key *key = vnode->lock_key;
 > 115		unsigned int fl_core.fl_type = F_RDLCK;
   116	
   117		_enter("");
   118	
   119		if (vnode->lock_type == AFS_LOCK_WRITE)
 > 120			fl_core.fl_type = F_WRLCK;
   121	
   122		list_for_each_entry_safe(p, _p, &vnode->pending_locks, fl_u.afs.link) {
   123			if (error &&
   124			    p->fl_core.fl_type == fl_core.fl_type &&
   125			    afs_file_key(p->fl_file) == key) {
   126				list_del_init(&p->fl_u.afs.link);
   127				p->fl_u.afs.state = error;
   128				wake_up(&p->fl_wait);
   129			}
   130	
   131			/* Select the next locker to hand off to. */
   132			if (next &&
   133			    (next->fl_core.fl_type == F_WRLCK || p->fl_core.fl_type == F_RDLCK))
   134				continue;
   135			next = p;
   136		}
   137	
   138		vnode->lock_key = NULL;
   139		key_put(key);
   140	
   141		if (next) {
   142			afs_set_lock_state(vnode, AFS_VNODE_LOCK_SETTING);
   143			next->fl_u.afs.state = AFS_LOCK_YOUR_TRY;
   144			trace_afs_flock_op(vnode, next, afs_flock_op_wake);
   145			wake_up(&next->fl_wait);
   146		} else {
   147			afs_set_lock_state(vnode, AFS_VNODE_LOCK_NONE);
   148			trace_afs_flock_ev(vnode, NULL, afs_flock_no_lockers, 0);
   149		}
   150	
   151		_leave("");
   152	}
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

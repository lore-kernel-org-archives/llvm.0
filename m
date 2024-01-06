Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1CF79F0;
	Sat,  6 Jan 2024 14:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4I6mFWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704550077; x=1736086077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hqDPk+rea7dosfnqB1kajy1T3c0u6ALIVOATHUi782s=;
  b=K4I6mFWQD/SvsBzljrBqI2L4ToHzNQCCzgbqWIkM3vqFQzPmBMyGeCfL
   S+wmRNOU9Pe6O7GjZ6NiK+ptO9IHnI+QAClhG+iHm0dwCfhzqutDgjOPf
   y8R4sk0BrnrnSg7HGlDsaiW1Psi0u2y56sz+at34zBTqe6KDQoDInJCSP
   H2NSfWZ/GvNClarZMnUBAqpNS0TtUQsuBZUDJZ5JMo+q1x06SJzuUOs+g
   FUl2y81JGM4Mf1jj/rKPVrFRbXKr7NWZrv0MqeK13ccqKLgxAM8wd63er
   qGLKaqno8d4QZDWNXQnGLBYO6LH/btRvF9U/ZuuQ5Iex3essjbqgUjbVK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="4427244"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="4427244"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 06:07:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="29356787"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 06 Jan 2024 06:07:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rM7L5-0002YK-2F;
	Sat, 06 Jan 2024 14:07:51 +0000
Date: Sat, 6 Jan 2024 22:07:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:filelock-6.9 8/11] fs/ceph/locks.c:230:32: error: no member
 named 'fl_flags' in 'struct file_lock'
Message-ID: <202401062221.U5Akwk2z-lkp@intel.com>
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
commit: 586ee3906f3c1613803f09e75c9459424992edce [8/11] filelock: move fl_flags into fl_core
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240106/202401062221.U5Akwk2z-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240106/202401062221.U5Akwk2z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401062221.U5Akwk2z-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> fs/fuse/file.c:2572:20: error: no member named 'fl_flags' in 'struct file_lock'
    2572 |         int opcode = (fl->fl_flags & FL_SLEEP) ? FUSE_SETLKW : FUSE_SETLK;
         |                       ~~  ^
   fs/fuse/file.c:2583:11: error: no member named 'fl_flags' in 'struct file_lock'
    2583 |         if ((fl->fl_flags & FL_CLOSE_POSIX) == FL_CLOSE_POSIX)
         |              ~~  ^
   2 errors generated.
--
>> fs/gfs2/file.c:1443:12: error: no member named 'fl_flags' in 'struct file_lock'
    1443 |         if (!(fl->fl_flags & FL_POSIX))
         |               ~~  ^
   fs/gfs2/file.c:1499:11: error: no member named 'fl_flags' in 'struct file_lock'
    1499 |                 request.fl_flags = FL_FLOCK;
         |                 ~~~~~~~ ^
   fs/gfs2/file.c:1560:12: error: no member named 'fl_flags' in 'struct file_lock'
    1560 |         if (!(fl->fl_flags & FL_FLOCK))
         |               ~~  ^
   3 errors generated.
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
--
>> fs/smb/client/file.c:1313:13: error: no member named 'fl_flags' in 'struct file_lock'
    1313 |                                         flock->fl_flags, &conf_lock,
         |                                         ~~~~~  ^
   fs/smb/client/file.c:1404:14: error: no member named 'fl_flags' in 'struct file_lock'
    1404 |         if ((flock->fl_flags & FL_POSIX) == 0)
         |              ~~~~~  ^
   fs/smb/client/file.c:1432:14: error: no member named 'fl_flags' in 'struct file_lock'
    1432 |         if ((flock->fl_flags & FL_POSIX) == 0)
         |              ~~~~~  ^
   fs/smb/client/file.c:1664:13: error: no member named 'fl_flags' in 'struct file_lock'
    1664 |         if (flock->fl_flags & FL_POSIX)
         |             ~~~~~  ^
   fs/smb/client/file.c:1666:13: error: no member named 'fl_flags' in 'struct file_lock'
    1666 |         if (flock->fl_flags & FL_FLOCK)
         |             ~~~~~  ^
   fs/smb/client/file.c:1668:13: error: no member named 'fl_flags' in 'struct file_lock'
    1668 |         if (flock->fl_flags & FL_SLEEP) {
         |             ~~~~~  ^
   fs/smb/client/file.c:1672:13: error: no member named 'fl_flags' in 'struct file_lock'
    1672 |         if (flock->fl_flags & FL_ACCESS)
         |             ~~~~~  ^
   fs/smb/client/file.c:1674:13: error: no member named 'fl_flags' in 'struct file_lock'
    1674 |         if (flock->fl_flags & FL_LEASE)
         |             ~~~~~  ^
   fs/smb/client/file.c:1676:13: error: no member named 'fl_flags' in 'struct file_lock'
    1676 |         if (flock->fl_flags &
         |             ~~~~~  ^
   fs/smb/client/file.c:1679:53: error: no member named 'fl_flags' in 'struct file_lock'
    1679 |                 cifs_dbg(FYI, "Unknown lock flags 0x%x\n", flock->fl_flags);
         |                                                            ~~~~~  ^
   fs/smb/client/cifs_debug.h:77:36: note: expanded from macro 'cifs_dbg'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                                                  ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:66:23: note: expanded from macro 'cifs_dbg_func'
      66 |                                       __FILE__, ##__VA_ARGS__);         \
         |                                                   ^~~~~~~~~~~
   include/linux/printk.h:634:38: note: expanded from macro 'pr_debug_once'
     634 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                             ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: expanded from macro 'no_printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                               ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   fs/smb/client/file.c:1679:53: error: no member named 'fl_flags' in 'struct file_lock'
    1679 |                 cifs_dbg(FYI, "Unknown lock flags 0x%x\n", flock->fl_flags);
         |                                                            ~~~~~  ^
   fs/smb/client/cifs_debug.h:77:36: note: expanded from macro 'cifs_dbg'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                                                  ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:68:38: note: expanded from macro 'cifs_dbg_func'
      68 |                 pr_err_ ## ratefunc("VFS: " fmt, ##__VA_ARGS__);        \
         |                                                    ^~~~~~~~~~~
   include/linux/printk.h:611:38: note: expanded from macro 'pr_err_once'
     611 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                             ^~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/once_lite.h:31:9: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                              ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   fs/smb/client/file.c:1679:53: error: no member named 'fl_flags' in 'struct file_lock'
    1679 |                 cifs_dbg(FYI, "Unknown lock flags 0x%x\n", flock->fl_flags);
         |                                                            ~~~~~  ^
   fs/smb/client/cifs_debug.h:77:36: note: expanded from macro 'cifs_dbg'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                                                  ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:70:32: note: expanded from macro 'cifs_dbg_func'
      70 |                 pr_debug_ ## ratefunc(fmt, ##__VA_ARGS__);              \
         |                                              ^~~~~~~~~~~
   include/linux/printk.h:634:38: note: expanded from macro 'pr_debug_once'
     634 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                             ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: expanded from macro 'no_printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                               ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   fs/smb/client/file.c:1679:53: error: no member named 'fl_flags' in 'struct file_lock'
    1679 |                 cifs_dbg(FYI, "Unknown lock flags 0x%x\n", flock->fl_flags);
         |                                                            ~~~~~  ^
   fs/smb/client/cifs_debug.h:79:43: note: expanded from macro 'cifs_dbg'
      79 |                 cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
         |                                                         ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:66:23: note: expanded from macro 'cifs_dbg_func'
      66 |                                       __FILE__, ##__VA_ARGS__);         \
         |                                                   ^~~~~~~~~~~
   include/linux/printk.h:692:50: note: expanded from macro 'pr_debug_ratelimited'
--
>> fs/smb/client/smb2file.c:231:17: error: no member named 'fl_flags' in 'struct file_lock'
     231 |                         if (!(flock->fl_flags & (FL_FLOCK | FL_OFDLCK)))
         |                               ~~~~~  ^
   1 error generated.
--
   fs/ocfs2/locks.c:14:10: error: 'cluster/masklog.h' file not found with <angled> include; use "quotes" instead
      14 | #include <cluster/masklog.h>
         |          ^~~~~~~~~~~~~~~~~~~
         |          "cluster/masklog.h"
>> fs/ocfs2/locks.c:57:11: error: no member named 'fl_flags' in 'struct file_lock'
      57 |                 request.fl_flags = FL_FLOCK;
         |                 ~~~~~~~ ^
   fs/ocfs2/locks.c:103:12: error: no member named 'fl_flags' in 'struct file_lock'
     103 |         if (!(fl->fl_flags & FL_FLOCK))
         |               ~~  ^
   fs/ocfs2/locks.c:121:12: error: no member named 'fl_flags' in 'struct file_lock'
     121 |         if (!(fl->fl_flags & FL_POSIX))
         |               ~~  ^
   4 errors generated.


vim +230 fs/ceph/locks.c

9280be24dc9c7a Yan, Zheng 2014-10-14  226  
bbb480ab05b2c1 Yan, Zheng 2020-02-11  227  static int try_unlock_file(struct file *file, struct file_lock *fl)
bbb480ab05b2c1 Yan, Zheng 2020-02-11  228  {
bbb480ab05b2c1 Yan, Zheng 2020-02-11  229  	int err;
bbb480ab05b2c1 Yan, Zheng 2020-02-11 @230  	unsigned int orig_flags = fl->fl_flags;
bbb480ab05b2c1 Yan, Zheng 2020-02-11  231  	fl->fl_flags |= FL_EXISTS;
bbb480ab05b2c1 Yan, Zheng 2020-02-11  232  	err = locks_lock_file_wait(file, fl);
bbb480ab05b2c1 Yan, Zheng 2020-02-11  233  	fl->fl_flags = orig_flags;
bbb480ab05b2c1 Yan, Zheng 2020-02-11  234  	if (err == -ENOENT) {
bbb480ab05b2c1 Yan, Zheng 2020-02-11  235  		if (!(orig_flags & FL_EXISTS))
bbb480ab05b2c1 Yan, Zheng 2020-02-11  236  			err = 0;
bbb480ab05b2c1 Yan, Zheng 2020-02-11  237  		return err;
bbb480ab05b2c1 Yan, Zheng 2020-02-11  238  	}
bbb480ab05b2c1 Yan, Zheng 2020-02-11  239  	return 1;
bbb480ab05b2c1 Yan, Zheng 2020-02-11  240  }
bbb480ab05b2c1 Yan, Zheng 2020-02-11  241  

:::::: The code at line 230 was first introduced by commit
:::::: bbb480ab05b2c148d8f8378660bfddd46761e86e ceph: check if file lock exists before sending unlock request

:::::: TO: Yan, Zheng <zyan@redhat.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED4B37646C;
	Sat,  1 Aug 2026 22:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785624666; cv=none; b=QkbyTPq4c9h8OCzDx9Oe3afPhozRUcBnSQN7MosN+nFt49NTgqL6BR9WVYgDbTKm+PbxJUS/EooxE4ow+GsWho6g5ViWKTsqhNZ5hMfqb25EtVQEP4XPp2atYfXtimh3c1pHmn90HdZhVaiHn0v4L99/WJshz0MTMiHkhwfi4U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785624666; c=relaxed/simple;
	bh=2P5oz4mCxXU2DAgzLJHLgp7eraPTU75RheNmQejjXF8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C5Dz7sL3+DR2lDe+yPFu/LhdKLL6lpWZTIPBDlYcRaUeeOMqj7d18/4tjjGLyTvaOQA5O7nLp14Ef57AN40idJaByzEXY/RChO4Pisk+6iZW3YhR7H1oQQh74w45Y1xod7HyM9/TKPxge1Hto1kzclXrElRpkYTFrpWq/Onl4D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJNVg4Kb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJNVg4Kb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785624664; x=1817160664;
  h=date:from:to:cc:subject:message-id;
  bh=2P5oz4mCxXU2DAgzLJHLgp7eraPTU75RheNmQejjXF8=;
  b=lJNVg4KbEsI2KFqmpNTgMtdFjf7mahDjkj9uxbqZuOKdyH2BlvVkhPD2
   403BM7JHN8JU1bcOuIZLzXZRE22ryGcOrChCrGEuUIkECOwUbl6IauEtt
   Vq6Yu6YPxQ8rVoBgL+vUowg7hSzRfAEp9JMrj4/ipCX1WpCJDW8pfeT/Q
   BQgeVcZTThilP1kx76h1Z2ACwefe+4h16F8ZDnAqviRI41S8Wbr9b5Ix9
   465bUr8GOv8SOCR/kE1Fi8jfvDGbR4oDBfeO4DskCc2D0I3p1o0BSpaPl
   GLwmcXOlqs6aLV4bBk1o7nA++8X19nN5XSqIgfM50x61gM87BkJSTF7uE
   g==;
X-CSE-ConnectionGUID: MVxbz0/qQZK6OtNE+Y9hSg==
X-CSE-MsgGUID: RuTQOnJTRFCRH04zJxxWNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="86162824"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="86162824"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 15:51:01 -0700
X-CSE-ConnectionGUID: Ry7ASaFeRJm5E02/qQtUwA==
X-CSE-MsgGUID: E0b0K6vaRlOJB+Rj+XDb2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="265143623"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Aug 2026 15:51:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqIXh-000000003zz-0V9e;
	Sat, 01 Aug 2026 22:50:57 +0000
Date: Sun, 02 Aug 2026 06:50:53 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 85/93] fs/rpdfs/mkfs.c:23:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202608020604.HX4Ue3Tz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   7dd9571ed4664ad741e8519b4a4369a2d84523f6
commit: 2f7d4b4295890ece08df31aa8e2d0150594c6c07 [85/93] rpdfs: update inode code
config: hexagon-randconfig-002-20260802 (https://download.01.org/0day-ci/archive/20260802/202608020604.HX4Ue3Tz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608020604.HX4Ue3Tz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608020604.HX4Ue3Tz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/rpdfs/mkfs.c:23:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      23 |         if (IS_ERR(folio)) {
         |             ^~~~~~~~~~~~~
   fs/rpdfs/mkfs.c:46:9: note: uninitialized use occurs here
      46 |         return ret;
         |                ^~~
   fs/rpdfs/mkfs.c:23:2: note: remove the 'if' if its condition is always true
      23 |         if (IS_ERR(folio)) {
         |         ^~~~~~~~~~~~~~~~~~
   fs/rpdfs/mkfs.c:20:9: note: initialize the variable 'ret' to silence this warning
      20 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.
--
>> fs/rpdfs/aops.c:163:66: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     163 |                 rpdfs_prd("key "RBKF" err %u ret %d", RBKA(&wr->key), wr->err, ret);
         |                                                                                ^~~
   fs/rpdfs/pr.h:36:25: note: expanded from macro 'rpdfs_prd'
      36 |         _rpdfs_pr_debug(fmt, ##args)
         |                                ^~~~
   fs/rpdfs/pr.h:33:58: note: expanded from macro '_rpdfs_pr_debug'
      33 |         pr_debug("rpdfs: %s:%u: "fmt"\n", __func__, __LINE__, ##args); \
         |                                                                 ^~~~
   include/linux/printk.h:631:26: note: expanded from macro 'pr_debug'
     631 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   fs/rpdfs/aops.c:159:9: note: initialize the variable 'ret' to silence this warning
     159 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.
--
>> fs/rpdfs/ehtable.c:259:2: warning: variable 'del' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
     259 |         for_each_entry(ehb, iargs->hash, ent, pl) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/rpdfs/ehtable.c:148:2: note: expanded from macro 'for_each_entry'
     148 |         __for_each_entry(ehb, base_entry(ehb, hash), ent, pl)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/rpdfs/ehtable.c:144:7: note: expanded from macro '__for_each_entry'
     144 |              (ent = &ehb->entries[(ent - ehb->entries) & RPDFS_EHTABLE_ENTRIES_MASK]); \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/rpdfs/ehtable.c:275:31: note: uninitialized use occurs here
     275 |         for_each_entry_continue(ehb, del, ent, pl) {
         |                                      ^~~
   fs/rpdfs/ehtable.c:151:25: note: expanded from macro 'for_each_entry_continue'
     151 |         __for_each_entry(ehb, (cont + 1), ent, pl)
         |                                ^~~~
   fs/rpdfs/ehtable.c:143:13: note: expanded from macro '__for_each_entry'
     143 |         for (ent = INIT, pl = 0; \
         |                    ^~~~
   fs/rpdfs/ehtable.c:259:2: note: remove the condition if it is always true
     259 |         for_each_entry(ehb, iargs->hash, ent, pl) {
         |         ^
   fs/rpdfs/ehtable.c:148:2: note: expanded from macro 'for_each_entry'
     148 |         __for_each_entry(ehb, base_entry(ehb, hash), ent, pl)
         |         ^
   fs/rpdfs/ehtable.c:144:7: note: expanded from macro '__for_each_entry'
     144 |              (ent = &ehb->entries[(ent - ehb->entries) & RPDFS_EHTABLE_ENTRIES_MASK]); \
         |              ^
   fs/rpdfs/ehtable.c:254:33: note: initialize the variable 'del' to silence this warning
     254 |         struct rpdfs_ehtable_entry *del;
         |                                        ^
         |                                         = NULL
   1 warning generated.
--
>> fs/rpdfs/meta.c:184:6: warning: variable 'folio' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     185 |             WARN_ON_ONCE((mgf & MGF_NEW) && (mgf & ~MGF_NEW)) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     186 |             WARN_ON_ONCE((mgf & MGF_READ) && (mgf & MGF_WRITE))) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:148:2: note: expanded from macro 'WARN_ON_ONCE'
     148 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
         |         ^
   include/linux/once_lite.h:27:2: note: expanded from macro 'DO_ONCE_LITE_IF'
      27 |         ({                                                              \
         |         ^
   fs/rpdfs/meta.c:226:9: note: uninitialized use occurs here
     226 |         return folio;
         |                ^~~~~
   fs/rpdfs/meta.c:184:2: note: remove the 'if' if its condition is always false
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     185 |             WARN_ON_ONCE((mgf & MGF_NEW) && (mgf & ~MGF_NEW)) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     186 |             WARN_ON_ONCE((mgf & MGF_READ) && (mgf & MGF_WRITE))) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     187 |                 ret = -EINVAL;
         |                 ~~~~~~~~~~~~~~
     188 |                 goto out;
         |                 ~~~~~~~~~
     189 |         }
         |         ~
>> fs/rpdfs/meta.c:184:6: warning: variable 'folio' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     185 |             WARN_ON_ONCE((mgf & MGF_NEW) && (mgf & ~MGF_NEW)) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:148:2: note: expanded from macro 'WARN_ON_ONCE'
     148 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
         |         ^
   include/linux/once_lite.h:27:2: note: expanded from macro 'DO_ONCE_LITE_IF'
      27 |         ({                                                              \
         |         ^
   fs/rpdfs/meta.c:226:9: note: uninitialized use occurs here
     226 |         return folio;
         |                ^~~~~
   fs/rpdfs/meta.c:184:6: note: remove the '||' if its condition is always false
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     185 |             WARN_ON_ONCE((mgf & MGF_NEW) && (mgf & ~MGF_NEW)) ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:148:2: note: expanded from macro 'WARN_ON_ONCE'
     148 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
         |         ^
   include/linux/once_lite.h:27:2: note: expanded from macro 'DO_ONCE_LITE_IF'
      27 |         ({                                                              \
         |         ^
>> fs/rpdfs/meta.c:184:6: warning: variable 'folio' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:148:2: note: expanded from macro 'WARN_ON_ONCE'
     148 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:27:2: note: expanded from macro 'DO_ONCE_LITE_IF'
      27 |         ({                                                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      29 |                                                                         \
         |                                                                         ~
      30 |                 if (__ONCE_LITE_IF(__ret_do_once))                      \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      31 |                         func(__VA_ARGS__);                              \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      32 |                                                                         \
         |                                                                         ~
      33 |                 unlikely(__ret_do_once);                                \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      34 |         })
         |         ~~
   fs/rpdfs/meta.c:226:9: note: uninitialized use occurs here
     226 |         return folio;
         |                ^~~~~
   fs/rpdfs/meta.c:184:6: note: remove the '||' if its condition is always false
     184 |         if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:148:2: note: expanded from macro 'WARN_ON_ONCE'
     148 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
         |         ^
   include/linux/once_lite.h:27:2: note: expanded from macro 'DO_ONCE_LITE_IF'
      27 |         ({                                                              \
         |         ^
   fs/rpdfs/meta.c:178:21: note: initialize the variable 'folio' to silence this warning
     178 |         struct folio *folio;
         |                            ^
         |                             = NULL
   3 warnings generated.


vim +23 fs/rpdfs/mkfs.c

e8e76da7ed715ef Zach Brown 2025-08-13  11  
e8e76da7ed715ef Zach Brown 2025-08-13  12  /*
e8e76da7ed715ef Zach Brown 2025-08-13  13   * This is a hack while we're bringing the system up.
e8e76da7ed715ef Zach Brown 2025-08-13  14   */
e8e76da7ed715ef Zach Brown 2025-08-13  15  
ca29d34b2ba425e Zach Brown 2026-07-09  16  int rpdfs_mkfs_root_inode(struct inode *inode)
e8e76da7ed715ef Zach Brown 2025-08-13  17  {
e8e76da7ed715ef Zach Brown 2025-08-13  18  	struct rpdfs_inode *rinode;
ca29d34b2ba425e Zach Brown 2026-07-09  19  	struct folio *folio;
e8e76da7ed715ef Zach Brown 2025-08-13  20  	int ret;
e8e76da7ed715ef Zach Brown 2025-08-13  21  
ca29d34b2ba425e Zach Brown 2026-07-09  22  	folio = rpdfs_meta_get_folio(inode, MGF_NEW, RPDFS_BLOCK_KEY_TYPE_INODE, 0);
ca29d34b2ba425e Zach Brown 2026-07-09 @23  	if (IS_ERR(folio)) {

:::::: The code at line 23 was first introduced by commit
:::::: ca29d34b2ba425ec26d7b54856f8ba86cb233d41 rpdfs: update mkfs

:::::: TO: Zach Brown <zab@zabbo.net>
:::::: CC: Zach Brown <zab@zabbo.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

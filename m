Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF021FDA61;
	Sat, 24 Jan 2026 05:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769232360; cv=none; b=YPpwswLDc10MIY2PC0ux4yWIkDTD+44ZoZlOqq7mMAjBXcbbTf+UUTdK5tPLgW+yF4jICdqpPlrXD9EBvQzcgQF8QD1z7t2qD3qmZAXjlpwK0ErUsG+3Q8xnicO64l8H8iNsgM2V40EB43BGu+SdurlQqz6BJivFYwTZxGgPbEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769232360; c=relaxed/simple;
	bh=uxqnrkgeKptqSoi+C2fKqng5uVAdCSjsrVKuOkNmMEA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qp3V35NFk8IZEfUMtZVmX+20f4mbOWlljS46Ih9ysFt95jTSYptUAam3x7usXYxmoc0EPhLNUYCGxMYi9lijZNuLY9Njw+Eo3ripvrvEVMM6VdW6K8zFbPE1lG5RVdTKp1zWaSlgafHreo+Sa7LZernRDsKhbZDm3nLfR2j+kCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvFByWuR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvFByWuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769232358; x=1800768358;
  h=date:from:to:cc:subject:message-id;
  bh=uxqnrkgeKptqSoi+C2fKqng5uVAdCSjsrVKuOkNmMEA=;
  b=JvFByWuR8iyBAFufrL+HOL5/zGUyLifQlmDVZ/7mKyFFwqdE74fk3UCo
   WPXlW1qqOoqCtH1xSNygda1alCckeCoTT0lAqvAQ0pbUy+fvR6OdBmtdx
   jvGjj0pNbPSK9rRLFXi+f1cH72nLKkl98te55QWBUvQUz+SUvEFECsaKd
   +VP/Bj0Zfv/caGjRsis4Ehk/rbQ8WuyGOdYBFev6Oum1OENdR6p5sBYP1
   LjjP4Nsz/AlgfabP7eXLps8gEulkux8QrJHvmpKEDutT/Vlzc/HUozqYl
   eF6QwSMxdNf4YeE3h+q9LNLfj5j4+Smss2Ne0pcFeIyC4zg9ycrBUaCfz
   w==;
X-CSE-ConnectionGUID: zGa7T4ZYTX2vrWS+iyakzg==
X-CSE-MsgGUID: Agd3drqJSxWD109BXrIkVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="69499593"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="69499593"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 21:25:57 -0800
X-CSE-ConnectionGUID: DRlve81xTTODaxV49Y+KrA==
X-CSE-MsgGUID: SYKgPpx/T0yubXwn8K6ZeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207545852"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jan 2026 21:25:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjW9h-00000000UwA-1ntU;
	Sat, 24 Jan 2026 05:25:53 +0000
Date: Sat, 24 Jan 2026 13:25:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 245/248]
 fs/bcachefs/debug/sysfs.c:696:3: error: cannot jump from this goto statement
 to its label
Message-ID: <202601241354.PGwCvo94-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   1310ef4f3109a9e87aab48a8d8a1c15bccd9ece2
commit: 4fe5b6e8ec3efb6a0d112d2cb86f2b22734c8824 [245/248] bcachefs: opt_change_lock
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260124/202601241354.PGwCvo94-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241354.PGwCvo94-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601241354.PGwCvo94-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/debug/sysfs.c:696:3: error: cannot jump from this goto statement to its label
     696 |                 goto err;
         |                 ^
   fs/bcachefs/debug/sysfs.c:700:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     700 |         guard(opt_change_lock)(c);
         |         ^
   include/linux/cleanup.h:401:15: note: expanded from macro 'guard'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:88:1: note: expanded from here
      88 | __UNIQUE_ID_guard749
         | ^
   fs/bcachefs/debug/sysfs.c:699:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     699 |         guard(memalloc_flags)(PF_MEMALLOC_NOFS);
         |         ^
   include/linux/cleanup.h:401:15: note: expanded from macro 'guard'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:79:1: note: expanded from here
      79 | __UNIQUE_ID_guard748
         | ^
   1 error generated.


vim +696 fs/bcachefs/debug/sysfs.c

1c6fdbd8f2465d fs/bcachefs/sysfs.c       Kent Overstreet 2017-03-16  677  
8b294a9b5c1447 fs/bcachefs/sysfs.c       Kent Overstreet 2025-03-11  678  static ssize_t sysfs_opt_store(struct bch_fs *c,
8b294a9b5c1447 fs/bcachefs/sysfs.c       Kent Overstreet 2025-03-11  679  			       struct bch_dev *ca,
8b294a9b5c1447 fs/bcachefs/sysfs.c       Kent Overstreet 2025-03-11  680  			       enum bch_opt_id id,
8b294a9b5c1447 fs/bcachefs/sysfs.c       Kent Overstreet 2025-03-11  681  			       const char *buf, size_t size)
1c6fdbd8f2465d fs/bcachefs/sysfs.c       Kent Overstreet 2017-03-16  682  {
8b294a9b5c1447 fs/bcachefs/sysfs.c       Kent Overstreet 2025-03-11  683  	const struct bch_option *opt = bch2_opt_table + id;
8b294a9b5c1447 fs/bcachefs/sysfs.c       Kent Overstreet 2025-03-11  684  	int ret = 0;
1c6fdbd8f2465d fs/bcachefs/sysfs.c       Kent Overstreet 2017-03-16  685  
f0cc5d2931378b fs/bcachefs/sysfs.c       Kent Overstreet 2022-03-06  686  	/*
f0cc5d2931378b fs/bcachefs/sysfs.c       Kent Overstreet 2022-03-06  687  	 * We don't need to take c->writes for correctness, but it eliminates an
f0cc5d2931378b fs/bcachefs/sysfs.c       Kent Overstreet 2022-03-06  688  	 * unsightly error message in the dmesg log when we're RO:
f0cc5d2931378b fs/bcachefs/sysfs.c       Kent Overstreet 2022-03-06  689  	 */
c9b1d94a2196fc fs/bcachefs/sysfs.c       Kent Overstreet 2025-04-18  690  	if (unlikely(!enumerated_ref_tryget(&c->writes, BCH_WRITE_REF_sysfs)))
f0cc5d2931378b fs/bcachefs/sysfs.c       Kent Overstreet 2022-03-06  691  		return -EROFS;
f0cc5d2931378b fs/bcachefs/sysfs.c       Kent Overstreet 2022-03-06  692  
a5f5d2cde0ab3c fs/bcachefs/debug/sysfs.c Kent Overstreet 2025-10-08  693  	char *tmp __free(kfree) = kstrdup(buf, GFP_KERNEL);
f0cc5d2931378b fs/bcachefs/sysfs.c       Kent Overstreet 2022-03-06  694  	if (!tmp) {
f0cc5d2931378b fs/bcachefs/sysfs.c       Kent Overstreet 2022-03-06  695  		ret = -ENOMEM;
f0cc5d2931378b fs/bcachefs/sysfs.c       Kent Overstreet 2022-03-06 @696  		goto err;
f0cc5d2931378b fs/bcachefs/sysfs.c       Kent Overstreet 2022-03-06  697  	}
1c6fdbd8f2465d fs/bcachefs/sysfs.c       Kent Overstreet 2017-03-16  698  
4fe5b6e8ec3efb fs/bcachefs/debug/sysfs.c Kent Overstreet 2026-01-23  699  	guard(memalloc_flags)(PF_MEMALLOC_NOFS);
4fe5b6e8ec3efb fs/bcachefs/debug/sysfs.c Kent Overstreet 2026-01-23  700  	guard(opt_change_lock)(c);
4fe5b6e8ec3efb fs/bcachefs/debug/sysfs.c Kent Overstreet 2026-01-23  701  
8b294a9b5c1447 fs/bcachefs/sysfs.c       Kent Overstreet 2025-03-11  702  	u64 v;
8b294a9b5c1447 fs/bcachefs/sysfs.c       Kent Overstreet 2025-03-11  703  	ret =   bch2_opt_parse(c, opt, strim(tmp), &v, NULL) ?:
39c74fd00b95fb fs/bcachefs/sysfs.c       Kent Overstreet 2025-08-27  704  		bch2_opt_hook_pre_set(c, ca, 0, id, v, true);
1c6fdbd8f2465d fs/bcachefs/sysfs.c       Kent Overstreet 2017-03-16  705  
1c6fdbd8f2465d fs/bcachefs/sysfs.c       Kent Overstreet 2017-03-16  706  	if (ret < 0)
f0cc5d2931378b fs/bcachefs/sysfs.c       Kent Overstreet 2022-03-06  707  		goto err;
1c6fdbd8f2465d fs/bcachefs/sysfs.c       Kent Overstreet 2017-03-16  708  
e882906929c55a fs/bcachefs/sysfs.c       Kent Overstreet 2025-05-14  709  	bool is_sb = opt->get_sb || opt->get_member;
e882906929c55a fs/bcachefs/sysfs.c       Kent Overstreet 2025-05-14  710  	bool changed = false;
e882906929c55a fs/bcachefs/sysfs.c       Kent Overstreet 2025-05-14  711  
e882906929c55a fs/bcachefs/sysfs.c       Kent Overstreet 2025-05-14  712  	if (is_sb) {
e882906929c55a fs/bcachefs/sysfs.c       Kent Overstreet 2025-05-14  713  		changed = bch2_opt_set_sb(c, ca, opt, v);
e882906929c55a fs/bcachefs/sysfs.c       Kent Overstreet 2025-05-14  714  	} else if (!ca) {
e882906929c55a fs/bcachefs/sysfs.c       Kent Overstreet 2025-05-14  715  		changed = bch2_opt_get_by_id(&c->opts, id) != v;
e882906929c55a fs/bcachefs/sysfs.c       Kent Overstreet 2025-05-14  716  	} else {
e882906929c55a fs/bcachefs/sysfs.c       Kent Overstreet 2025-05-14  717  		/* device options that aren't superblock options aren't
e882906929c55a fs/bcachefs/sysfs.c       Kent Overstreet 2025-05-14  718  		 * supported */
e882906929c55a fs/bcachefs/sysfs.c       Kent Overstreet 2025-05-14  719  		BUG();
e882906929c55a fs/bcachefs/sysfs.c       Kent Overstreet 2025-05-14  720  	}
c2250847043901 fs/bcachefs/sysfs.c       Kent Overstreet 2024-10-24  721  
a5f237d69e8a72 fs/bcachefs/debug/sysfs.c Kent Overstreet 2025-11-12  722  	if (changed) {
a5f237d69e8a72 fs/bcachefs/debug/sysfs.c Kent Overstreet 2025-11-12  723  		if (!ca) {
c79eb06da4c34f fs/bcachefs/sysfs.c       Kent Overstreet 2025-04-15  724  			bch2_opt_set_by_id(&c->opts, id, v);
a5f237d69e8a72 fs/bcachefs/debug/sysfs.c Kent Overstreet 2025-11-12  725  			clear_bit(id, c->mount_opts.d);
a5f237d69e8a72 fs/bcachefs/debug/sysfs.c Kent Overstreet 2025-11-12  726  		}
80be08cdb5a822 fs/bcachefs/sysfs.c       Kent Overstreet 2025-03-13  727  
783eae0fb55bd7 fs/bcachefs/sysfs.c       Kent Overstreet 2025-08-27  728  		bch2_opt_hook_post_set(c, ca, 0, id, v);
a5f237d69e8a72 fs/bcachefs/debug/sysfs.c Kent Overstreet 2025-11-12  729  	}
80be08cdb5a822 fs/bcachefs/sysfs.c       Kent Overstreet 2025-03-13  730  
f0cc5d2931378b fs/bcachefs/sysfs.c       Kent Overstreet 2022-03-06  731  	ret = size;
f0cc5d2931378b fs/bcachefs/sysfs.c       Kent Overstreet 2022-03-06  732  err:
c9b1d94a2196fc fs/bcachefs/sysfs.c       Kent Overstreet 2025-04-18  733  	enumerated_ref_put(&c->writes, BCH_WRITE_REF_sysfs);
f0cc5d2931378b fs/bcachefs/sysfs.c       Kent Overstreet 2022-03-06  734  	return ret;
1c6fdbd8f2465d fs/bcachefs/sysfs.c       Kent Overstreet 2017-03-16  735  }
8b294a9b5c1447 fs/bcachefs/sysfs.c       Kent Overstreet 2025-03-11  736  

:::::: The code at line 696 was first introduced by commit
:::::: f0cc5d2931378b7a2a7e797c726a2ab760d4a84d bcachefs: Check for rw before setting opts via sysfs

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

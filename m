Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42011C7012;
	Thu,  9 Apr 2026 01:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775696996; cv=none; b=eQRVTFRETlXwD3+PHUIb/dlYlHseGqLytgoQ5AXWgSZUWf3XzXFExvNoYETL49DE23t29XjFg9KW0NbkUzHBvC0IfH67/5BcOTKXayEezicFKwBQEfcYhc2dMn9uWQlJA2ziDJn6s0+XhWsZmRRTilA8we3sIozOQ078syWvAbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775696996; c=relaxed/simple;
	bh=1ocGCLkK05gThQJp1l+GnQEgV5TyowrtBkYJaMdXK6U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AcMzTxZe8L4NXVYFumptaIaQsng+0RviJ6o3qeHEBhavSthuxS5e22hbLl3J8w/qdLUBJSPXapkjwsypjtx0Px1KXsMPPOD/oqgPVriol+sj3pjsgafkcbNyhotfOXafzPK8HVhQyoS+6CR9C/3nPWqDlNkc25wTmPPGNxbJdkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrRS5/cy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrRS5/cy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775696995; x=1807232995;
  h=date:from:to:cc:subject:message-id;
  bh=1ocGCLkK05gThQJp1l+GnQEgV5TyowrtBkYJaMdXK6U=;
  b=KrRS5/cydOZCBrn3GQm8dwY7viDG/xMLbXTFOZppFH0VNJS1kN8VATU0
   kR1yGeM7KyWIG8H0f9610j7UyzjgFrM7x0Ald8mRbAYivx1rYEOP9bEib
   VHjWemSHFqgwSV1yPJtbCitVlufvJSOdHvS6TgdYvP25x0hIFBER/cC3L
   VCFe/0Mztfb40K/CYWgxx1V2kFgTW/L5VT1l2lkU8lyVlprKG7McDseEr
   KwDi9hr/QYKgFZOIdgZwr0BT5sU79ktvmqaVlcwE1sixzB3OefZH8lt6c
   ChTLtUfCphx2C1uQLGdFSJ2iBmmSNEJ3u9Vj0ejehwymmUhshadscER0z
   w==;
X-CSE-ConnectionGUID: 6dcO7+O4S526ty4wq/WqUw==
X-CSE-MsgGUID: Mf9IJb/IS/CwQ3phwxZVnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="102147164"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="102147164"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 18:09:54 -0700
X-CSE-ConnectionGUID: 1tq0T719TsavwYhrlfDMxw==
X-CSE-MsgGUID: fbSjKIngSpKE5W9hyJdQyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="228857879"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 08 Apr 2026 18:09:53 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAdu1-00000000AZN-47PZ;
	Thu, 09 Apr 2026 01:09:49 +0000
Date: Thu, 09 Apr 2026 03:09:28 +0200
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.fixes 3/5] fs/sysfs/mount.c:75:23:
 error: call to undeclared function 'to_net_ns'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202604090340.OgYnFPAR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git vfs.fixes
head:   98d1a51c628ef056c2d5a06d39c2d5b38aff9237
commit: 9a8098b1d5023ca94d91ce9b7c3dbf762fe3b3fb [3/5] kernfs: pass struct ns_common instead of const void * for namespace tags
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260409/202604090340.OgYnFPAR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260409/202604090340.OgYnFPAR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604090340.OgYnFPAR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/sysfs/mount.c:75:23: error: call to undeclared function 'to_net_ns'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      75 |                 struct net *netns = to_net_ns(ns);
         |                                     ^
>> fs/sysfs/mount.c:75:15: error: incompatible integer to pointer conversion initializing 'struct net *' with an expression of type 'int' [-Wint-conversion]
      75 |                 struct net *netns = to_net_ns(ns);
         |                             ^       ~~~~~~~~~~~~~
   2 errors generated.


vim +/to_net_ns +75 fs/sysfs/mount.c

    54	
    55	static int sysfs_init_fs_context(struct fs_context *fc)
    56	{
    57		struct kernfs_fs_context *kfc;
    58		struct ns_common *ns;
    59	
    60		if (!(fc->sb_flags & SB_KERNMOUNT)) {
    61			if (!kobj_ns_current_may_mount(KOBJ_NS_TYPE_NET))
    62				return -EPERM;
    63		}
    64	
    65		kfc = kzalloc_obj(struct kernfs_fs_context);
    66		if (!kfc)
    67			return -ENOMEM;
    68	
    69		kfc->ns_tag = ns = kobj_ns_grab_current(KOBJ_NS_TYPE_NET);
    70		kfc->root = sysfs_root;
    71		kfc->magic = SYSFS_MAGIC;
    72		fc->fs_private = kfc;
    73		fc->ops = &sysfs_fs_context_ops;
    74		if (ns) {
  > 75			struct net *netns = to_net_ns(ns);
    76	
    77			put_user_ns(fc->user_ns);
    78			fc->user_ns = get_user_ns(netns->user_ns);
    79		}
    80		fc->global = true;
    81		return 0;
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31CA17E9;
	Wed, 24 Jul 2024 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721809876; cv=none; b=RNSom4rfzmhxrbYkAihOca9F75UxgnlNt2lIo1kIUpMgOwdIonQfAusOUAP9HgPsCpWPaaejjHQbd7OhkZGK2Tm7fy5qk/u+uHHZFDDfQmmarUZ+pbJcWTn/M8+07pLwccg/tDxR72rI0ig8dJFmZqH2W7r4FN9+M+ysXp0SIuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721809876; c=relaxed/simple;
	bh=ZlbNSOhzydQsrfzyQHfifw3OnIHRu8VcebDQiZxw/Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kv7YBw5T8pRfRCPtA5p33Yq4ez4FOfdKpDVDEb4Vjt3crkpUSM4CDzVwaxSiSa0WRyxOX+W/bBjK3S8r26foCGHBEtJYNfj4YprdZ9a9FG1rotVXFvtBvvGc5wNFZL8XJiBBtqaO/NXUyv1RjCly6Y85zaOQVbZ9wvYU5kvuiSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zn+WLR/c; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zn+WLR/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721809874; x=1753345874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZlbNSOhzydQsrfzyQHfifw3OnIHRu8VcebDQiZxw/Vs=;
  b=Zn+WLR/c8kv2ywALNBzQ3TB4itE8TVRorKOeavNVK4tKP/k2+MsoxgvT
   BNvL8KabVAEEfyYdrgItHZ+NGVBjYnl3uzPUdAlQIKURF9W4+54JSlJ0J
   rPgNcoie0Y0PsXJwhbuqUjYVLT2yiiVMtlcmHY74miSmw7OsEK7hf6Jfw
   4W4n6sk0XRKEEVSvOcm1D7RjE9LoKl6yC5utXaTnvudFHUFD/8TZX5h0V
   EfTAm9TnKeAYXCR/HUZ1zvYe+97QCyX7GxGSDduA+x66k4hICP9ZOrHTd
   DGu5DVVXUi/N7ztgDRoGwZyv9fcJY93/07cir4oB96igb5NPGNxOEJ63U
   w==;
X-CSE-ConnectionGUID: SiZvpcCzTNqk2y6qdAAXxA==
X-CSE-MsgGUID: NZIJXENjTsuHx3mVwy2G7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="12683147"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="12683147"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 01:31:13 -0700
X-CSE-ConnectionGUID: AvLALhywTKOxqKqbcWWY1w==
X-CSE-MsgGUID: 2gkhP4qbQ0ynR7EAJXNxYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="56661865"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jul 2024 01:31:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWXOw-000mpi-02;
	Wed, 24 Jul 2024 08:31:10 +0000
Date: Wed, 24 Jul 2024 16:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsd-5.15.y 1/1] fs/notify/fanotify/fanotify.c:922:2: error:
 call to '__compiletime_assert_304' declared with 'error' attribute:
 BUILD_BUG_ON failed: HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 21
Message-ID: <202407241626.cj3ek00g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-5.15.y
head:   fd359f5ae54ff9668906addd2f298283aa058c16
commit: f4ffbb86cf1a1436b410766e83c93a1e4d34ea04 [1/1] Revert "fanotify: Allow users to request FAN_FS_ERROR events"
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240724/202407241626.cj3ek00g-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407241626.cj3ek00g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407241626.cj3ek00g-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/notify/fanotify/fanotify.c:14:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:1608:
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:443:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     443 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     444 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:455:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     455 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     456 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:464:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     464 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     465 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:922:2: error: call to '__compiletime_assert_304' declared with 'error' attribute: BUILD_BUG_ON failed: HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 21
     922 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 21);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:334:2: note: expanded from macro 'compiletime_assert'
     334 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:322:2: note: expanded from macro '_compiletime_assert'
     322 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:315:4: note: expanded from macro '__compiletime_assert'
     315 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:92:1: note: expanded from here
      92 | __compiletime_assert_304
         | ^
   5 warnings and 1 error generated.


vim +922 fs/notify/fanotify/fanotify.c

94e00d28a680df Amir Goldstein          2021-03-04  887  
b54cecf5e2293d Amir Goldstein          2020-06-07  888  static int fanotify_handle_event(struct fsnotify_group *group, u32 mask,
b54cecf5e2293d Amir Goldstein          2020-06-07  889  				 const void *data, int data_type,
b54cecf5e2293d Amir Goldstein          2020-06-07  890  				 struct inode *dir,
e43e9c339a78a0 Al Viro                 2019-04-26  891  				 const struct qstr *file_name, u32 cookie,
9385a84d7e1f65 Jan Kara                2016-11-10  892  				 struct fsnotify_iter_info *iter_info)
7053aee26a3548 Jan Kara                2014-01-21  893  {
7053aee26a3548 Jan Kara                2014-01-21  894  	int ret = 0;
33913997d5c067 Amir Goldstein          2019-01-10  895  	struct fanotify_event *event;
7053aee26a3548 Jan Kara                2014-01-21  896  	struct fsnotify_event *fsn_event;
77115225acc67d Amir Goldstein          2019-01-10  897  	__kernel_fsid_t fsid = {};
4b5743bdc5926f Amir Goldstein          2021-11-29  898  	u32 match_mask = 0;
7053aee26a3548 Jan Kara                2014-01-21  899  
7053aee26a3548 Jan Kara                2014-01-21  900  	BUILD_BUG_ON(FAN_ACCESS != FS_ACCESS);
7053aee26a3548 Jan Kara                2014-01-21  901  	BUILD_BUG_ON(FAN_MODIFY != FS_MODIFY);
235328d1fa4251 Amir Goldstein          2019-01-10  902  	BUILD_BUG_ON(FAN_ATTRIB != FS_ATTRIB);
7053aee26a3548 Jan Kara                2014-01-21  903  	BUILD_BUG_ON(FAN_CLOSE_NOWRITE != FS_CLOSE_NOWRITE);
7053aee26a3548 Jan Kara                2014-01-21  904  	BUILD_BUG_ON(FAN_CLOSE_WRITE != FS_CLOSE_WRITE);
7053aee26a3548 Jan Kara                2014-01-21  905  	BUILD_BUG_ON(FAN_OPEN != FS_OPEN);
235328d1fa4251 Amir Goldstein          2019-01-10  906  	BUILD_BUG_ON(FAN_MOVED_TO != FS_MOVED_TO);
235328d1fa4251 Amir Goldstein          2019-01-10  907  	BUILD_BUG_ON(FAN_MOVED_FROM != FS_MOVED_FROM);
235328d1fa4251 Amir Goldstein          2019-01-10  908  	BUILD_BUG_ON(FAN_CREATE != FS_CREATE);
235328d1fa4251 Amir Goldstein          2019-01-10  909  	BUILD_BUG_ON(FAN_DELETE != FS_DELETE);
235328d1fa4251 Amir Goldstein          2019-01-10  910  	BUILD_BUG_ON(FAN_DELETE_SELF != FS_DELETE_SELF);
235328d1fa4251 Amir Goldstein          2019-01-10  911  	BUILD_BUG_ON(FAN_MOVE_SELF != FS_MOVE_SELF);
7053aee26a3548 Jan Kara                2014-01-21  912  	BUILD_BUG_ON(FAN_EVENT_ON_CHILD != FS_EVENT_ON_CHILD);
7053aee26a3548 Jan Kara                2014-01-21  913  	BUILD_BUG_ON(FAN_Q_OVERFLOW != FS_Q_OVERFLOW);
7053aee26a3548 Jan Kara                2014-01-21  914  	BUILD_BUG_ON(FAN_OPEN_PERM != FS_OPEN_PERM);
7053aee26a3548 Jan Kara                2014-01-21  915  	BUILD_BUG_ON(FAN_ACCESS_PERM != FS_ACCESS_PERM);
7053aee26a3548 Jan Kara                2014-01-21  916  	BUILD_BUG_ON(FAN_ONDIR != FS_ISDIR);
9b076f1c0f4869 Matthew Bobrowski       2018-11-08  917  	BUILD_BUG_ON(FAN_OPEN_EXEC != FS_OPEN_EXEC);
66917a3130f218 Matthew Bobrowski       2018-11-08  918  	BUILD_BUG_ON(FAN_OPEN_EXEC_PERM != FS_OPEN_EXEC_PERM);
11280c7181b038 Gabriel Krisman Bertazi 2021-10-25  919  	BUILD_BUG_ON(FAN_FS_ERROR != FS_ERROR);
9acb63f955cadf Amir Goldstein          2021-11-29  920  	BUILD_BUG_ON(FAN_RENAME != FS_RENAME);
7053aee26a3548 Jan Kara                2014-01-21  921  
de7e2adfc7847a Amir Goldstein          2021-11-29 @922  	BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 21);
bdd5a46fe30653 Amir Goldstein          2018-10-04  923  
4b5743bdc5926f Amir Goldstein          2021-11-29  924  	mask = fanotify_group_event_mask(group, iter_info, &match_mask,
4b5743bdc5926f Amir Goldstein          2021-11-29  925  					 mask, data, data_type, dir);
2d10b23082a7eb Matthew Bobrowski       2018-11-08  926  	if (!mask)
83c4c4b0a3aadc Jan Kara                2014-01-21  927  		return 0;
83c4c4b0a3aadc Jan Kara                2014-01-21  928  
4b5743bdc5926f Amir Goldstein          2021-11-29  929  	pr_debug("%s: group=%p mask=%x report_mask=%x\n", __func__,
4b5743bdc5926f Amir Goldstein          2021-11-29  930  		 group, mask, match_mask);
7053aee26a3548 Jan Kara                2014-01-21  931  
6685df31255493 Miklos Szeredi          2017-10-30  932  	if (fanotify_is_perm_event(mask)) {
f37650f1c7c71c Miklos Szeredi          2017-10-30  933  		/*
f37650f1c7c71c Miklos Szeredi          2017-10-30  934  		 * fsnotify_prepare_user_wait() fails if we race with mark
f37650f1c7c71c Miklos Szeredi          2017-10-30  935  		 * deletion.  Just let the operation pass in that case.
f37650f1c7c71c Miklos Szeredi          2017-10-30  936  		 */
f37650f1c7c71c Miklos Szeredi          2017-10-30  937  		if (!fsnotify_prepare_user_wait(iter_info))
f37650f1c7c71c Miklos Szeredi          2017-10-30  938  			return 0;
f37650f1c7c71c Miklos Szeredi          2017-10-30  939  	}
f37650f1c7c71c Miklos Szeredi          2017-10-30  940  
d809daf1b6add5 Amir Goldstein          2020-07-16  941  	if (FAN_GROUP_FLAG(group, FANOTIFY_FID_BITS)) {
77115225acc67d Amir Goldstein          2019-01-10  942  		fsid = fanotify_get_fsid(iter_info);
b1da6a51871c69 Jan Kara                2019-04-24  943  		/* Racing with mark destruction or creation? */
b1da6a51871c69 Jan Kara                2019-04-24  944  		if (!fsid.val[0] && !fsid.val[1])
b1da6a51871c69 Jan Kara                2019-04-24  945  			return 0;
b1da6a51871c69 Jan Kara                2019-04-24  946  	}
77115225acc67d Amir Goldstein          2019-01-10  947  
b54cecf5e2293d Amir Goldstein          2020-06-07  948  	event = fanotify_alloc_event(group, mask, data, data_type, dir,
4b5743bdc5926f Amir Goldstein          2021-11-29  949  				     file_name, &fsid, match_mask);
f37650f1c7c71c Miklos Szeredi          2017-10-30  950  	ret = -ENOMEM;
7b1f641776e0c8 Jan Kara                2018-02-21  951  	if (unlikely(!event)) {
7b1f641776e0c8 Jan Kara                2018-02-21  952  		/*
7b1f641776e0c8 Jan Kara                2018-02-21  953  		 * We don't queue overflow events for permission events as
7b1f641776e0c8 Jan Kara                2018-02-21  954  		 * there the access is denied and so no event is in fact lost.
7b1f641776e0c8 Jan Kara                2018-02-21  955  		 */
7b1f641776e0c8 Jan Kara                2018-02-21  956  		if (!fanotify_is_perm_event(mask))
7b1f641776e0c8 Jan Kara                2018-02-21  957  			fsnotify_queue_overflow(group);
f37650f1c7c71c Miklos Szeredi          2017-10-30  958  		goto finish;
7b1f641776e0c8 Jan Kara                2018-02-21  959  	}
7053aee26a3548 Jan Kara                2014-01-21  960  
7053aee26a3548 Jan Kara                2014-01-21  961  	fsn_event = &event->fse;
8eb16abe8937b6 Gabriel Krisman Bertazi 2021-10-25  962  	ret = fsnotify_insert_event(group, fsn_event, fanotify_merge,
8c7986c2bcc92c Gabriel Krisman Bertazi 2021-10-25  963  				    fanotify_insert_event);
83c0e1b442b488 Jan Kara                2014-01-28  964  	if (ret) {
482ef06c5e946a Jan Kara                2014-02-21  965  		/* Permission events shouldn't be merged */
23c9deeb3285d3 Amir Goldstein          2018-10-04  966  		BUG_ON(ret == 1 && mask & FANOTIFY_PERM_EVENTS);
7053aee26a3548 Jan Kara                2014-01-21  967  		/* Our event wasn't used in the end. Free it. */
7053aee26a3548 Jan Kara                2014-01-21  968  		fsnotify_destroy_event(group, fsn_event);
482ef06c5e946a Jan Kara                2014-02-21  969  
f37650f1c7c71c Miklos Szeredi          2017-10-30  970  		ret = 0;
6685df31255493 Miklos Szeredi          2017-10-30  971  	} else if (fanotify_is_perm_event(mask)) {
7088f35720a55b Jan Kara                2020-03-24  972  		ret = fanotify_get_response(group, FANOTIFY_PERM(event),
05f0e38724e844 Jan Kara                2016-11-10  973  					    iter_info);
85816794240b96 Jan Kara                2014-01-28  974  	}
f37650f1c7c71c Miklos Szeredi          2017-10-30  975  finish:
6685df31255493 Miklos Szeredi          2017-10-30  976  	if (fanotify_is_perm_event(mask))
f37650f1c7c71c Miklos Szeredi          2017-10-30  977  		fsnotify_finish_user_wait(iter_info);
6685df31255493 Miklos Szeredi          2017-10-30  978  
7053aee26a3548 Jan Kara                2014-01-21  979  	return ret;
7053aee26a3548 Jan Kara                2014-01-21  980  }
7053aee26a3548 Jan Kara                2014-01-21  981  

:::::: The code at line 922 was first introduced by commit
:::::: de7e2adfc7847acd3925aa2c21009b410f9d4033 fanotify: wire up FAN_RENAME event

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

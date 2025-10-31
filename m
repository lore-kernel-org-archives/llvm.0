Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707722F39D4;
	Fri, 31 Oct 2025 02:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761878193; cv=none; b=mp5h25Zqwj9sYOzyVlpcs3HT92gWJHmqtTXmHI6dTucCiVYrED20Hv134GPlM8493YWbkzM2m0Hm/mlqpvsnJ+7IvGqtwj/BbZ7tHxKsqiJ0us3806EM3Gwqx8rVgVLNiddR4ObiJVBfoPOYGaBAHmyoYHhgFC/AGwUZh8aTIas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761878193; c=relaxed/simple;
	bh=Q8Iuy7jom1qrVMcMIdkOiE/4mAQVRGxUv0/PCSeVcIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PUueoEO6rnyMeHXzM0l1cD6kyV2saaAkqNBpIObM1eWpSTmWy4uJe0INIur3frcGzf9cqBU4wsWOc5WCYL4YcnUuGf0G1GZYAUPWDBnSYJAVHOgepEej1pxVTynFBpFJ5plhmSJo5/H3TGmKRK5NcS3r/XEsK9Ca3okSIdiBm8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nn3NAWeA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nn3NAWeA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761878190; x=1793414190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q8Iuy7jom1qrVMcMIdkOiE/4mAQVRGxUv0/PCSeVcIk=;
  b=Nn3NAWeAlP6haeyXSIJYJoYOdHXYzPJmHSzAuYTiK7vHja++Wyz2oB2V
   Xx7bLBEH3Dzo2FsS0ziZZIgnPxx4Xhhm93ffj7wym5A95HcjvtNps76r/
   RE997/3aTTH418juNLK4GpP4E7ZcqDD8PJFkrEJVpxDu3rk5+r1w4+omF
   NpWt2H8KtFO/9yZWmnJ8YwutZWuvGzj1T0m7yaee8d6nPcSxWtSJTKjp4
   2+LhK8wFN7Lwhorm919d2gMADeQLsp2qv97rxiDNMQOqNbtZHIWrEMo8X
   DoVLtC8VssNCfVxEWx+BKZ0hU/BbYs2pBv8E5iRHsm0KF5Z8Y9CU/Tvbs
   g==;
X-CSE-ConnectionGUID: JGy2Dyl2Q62TEbYfIdB2cg==
X-CSE-MsgGUID: H2nPrtFJQxeMKwCR3hbhsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64072918"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="64072918"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 19:36:27 -0700
X-CSE-ConnectionGUID: DJCcj5AZTH2udAfd45v8Tg==
X-CSE-MsgGUID: t51r4Gw/SMas4FpbAiyp/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="186217746"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2025 19:36:24 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vEf02-0000000017o-1a2F;
	Fri, 31 Oct 2025 02:36:22 +0000
Date: Fri, 31 Oct 2025 03:35:59 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:namespace-6.19 13/73] kernel/nstree.c:170:43: error:
 no member named 'type' in 'struct ns_tree'
Message-ID: <202510310339.Sv9wut8b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git namespace-6.19
head:   232affb34bfb5be4df33a3e7bc92154e38f74535
commit: 6696d17cfe2b00c43717aecab6f461e1a68c7b28 [13/73] nstree: introduce a unified tree
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251031/202510310339.Sv9wut8b-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310339.Sv9wut8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310339.Sv9wut8b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/nstree.c:170:43: error: no member named 'type' in 'struct ns_tree'
     170 |         VFS_WARN_ON_ONCE(ns->ns_type != ns_tree->type);
         |                                         ~~~~~~~  ^
   include/linux/vfsdebug.h:37:53: note: expanded from macro 'VFS_WARN_ON_ONCE'
      37 | #define VFS_WARN_ON_ONCE(cond) BUILD_BUG_ON_INVALID(cond)
         |                                                     ^~~~
   include/linux/build_bug.h:30:63: note: expanded from macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   kernel/nstree.c:297:93: error: no member named 'type' in 'struct ns_tree'
     297 |         VFS_WARN_ON_ONCE(list_entry_rcu(list, struct ns_common, ns_list_node)->ns_type != ns_tree->type);
         |                                                                                           ~~~~~~~  ^
   include/linux/vfsdebug.h:37:53: note: expanded from macro 'VFS_WARN_ON_ONCE'
      37 | #define VFS_WARN_ON_ONCE(cond) BUILD_BUG_ON_INVALID(cond)
         |                                                     ^~~~
   include/linux/build_bug.h:30:63: note: expanded from macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   2 errors generated.


vim +170 kernel/nstree.c

885fc8ac0a4dc70 Christian Brauner 2025-09-12  165  
885fc8ac0a4dc70 Christian Brauner 2025-09-12  166  void __ns_tree_remove(struct ns_common *ns, struct ns_tree *ns_tree)
885fc8ac0a4dc70 Christian Brauner 2025-09-12  167  {
885fc8ac0a4dc70 Christian Brauner 2025-09-12  168  	VFS_WARN_ON_ONCE(RB_EMPTY_NODE(&ns->ns_tree_node));
885fc8ac0a4dc70 Christian Brauner 2025-09-12  169  	VFS_WARN_ON_ONCE(list_empty(&ns->ns_list_node));
4055526d35746ce Christian Brauner 2025-09-24 @170  	VFS_WARN_ON_ONCE(ns->ns_type != ns_tree->type);
885fc8ac0a4dc70 Christian Brauner 2025-09-12  171  
6696d17cfe2b00c Christian Brauner 2025-10-29  172  	write_seqlock(&ns_tree_lock);
885fc8ac0a4dc70 Christian Brauner 2025-09-12  173  	rb_erase(&ns->ns_tree_node, &ns_tree->ns_tree);
6696d17cfe2b00c Christian Brauner 2025-10-29  174  	rb_erase(&ns->ns_unified_tree_node, &ns_unified_tree);
885fc8ac0a4dc70 Christian Brauner 2025-09-12  175  	list_bidir_del_rcu(&ns->ns_list_node);
885fc8ac0a4dc70 Christian Brauner 2025-09-12  176  	RB_CLEAR_NODE(&ns->ns_tree_node);
6696d17cfe2b00c Christian Brauner 2025-10-29  177  	write_sequnlock(&ns_tree_lock);
885fc8ac0a4dc70 Christian Brauner 2025-09-12  178  }
885fc8ac0a4dc70 Christian Brauner 2025-09-12  179  EXPORT_SYMBOL_GPL(__ns_tree_remove);
885fc8ac0a4dc70 Christian Brauner 2025-09-12  180  

:::::: The code at line 170 was first introduced by commit
:::::: 4055526d35746ce8b04bfa5e14e14f28bb163186 ns: move ns type into struct ns_common

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

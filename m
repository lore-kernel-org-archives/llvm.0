Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100AA3B71C6;
	Fri, 11 Sep 2026 05:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789104739; cv=none; b=gfDNhD/A7FFceH0WtIiu2HumIBFVJOakGT2SHrIqhBAx071dyjwJpNIrkXSZc5ESh1h0tJWegiFgIloo+DEg5F4NtkcZthK0jjr0cREqqe2mVxWFyMvYJPvSdizALC3uC3nnMaCPHCemSQPLV3fRxrzJnClKBvi6Lj1hBw6EDwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789104739; c=relaxed/simple;
	bh=fXxKvTHz+JPmv/661LfcWbVyiwIo8FfwvVGeAmr1jaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m5jQw9v5JQcqr21PTV0QmD7D0WieNaC8HokJ8Bc7DKrspnZnhKfAzHwb6RkM6KYLAYqf/J8+n/aopXNsnVfrxXxBweYFRC6f/krTolqCpMVtjy2mSV59L79Ya5hM1Ms05XivqZowWhr/G1oHbMZkWQEe8jgaaaH9n512IGvwVPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyTVm1fD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyTVm1fD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789104738; x=1820640738;
  h=date:from:to:cc:subject:message-id;
  bh=fXxKvTHz+JPmv/661LfcWbVyiwIo8FfwvVGeAmr1jaQ=;
  b=iyTVm1fDNSItnBYF/qockwevrXL4c304ptXBreMPg/3WpWd4gD9C0iQo
   5OiE9Ovx3EnzRA4fu9GiNGwBKAGrUW76HsbTNDxw24ZYGnuKYcJFp91e8
   M/f8yHXl+s9nkUsXPG9RTrC76V7bW99yQLVOj91VCQFJ3XnTR5XVvKK6s
   EnQGObY1aA/C/0SlEdI+7DBex2ze77IrKOjrEB8qjQIr8J3SzyXOY9XRf
   fFbivZ6ij035Gk6RaB+egaQnkcgr2vgzU9+F9gA1jSzPWbsW/DYHZv9dQ
   EOMDo7t1ZbgYYH1IjbrL591QsJ/Y/XBR2dveHRzd5ph0NQMSLGop74dp2
   Q==;
X-CSE-ConnectionGUID: VzYFrYgNQ72WTptNwnVmwA==
X-CSE-MsgGUID: wpUmcfBQReiwE+lh0EhlQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="112337902"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="112337902"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 22:32:17 -0700
X-CSE-ConnectionGUID: m+18s8xxQ/WNRiqVien/fw==
X-CSE-MsgGUID: y/+wDA4ERUW9G0/FfFtUOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="275600953"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 10 Sep 2026 22:32:14 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4trn-00000000152-0fNJ;
	Fri, 11 Sep 2026 05:32:05 +0000
Date: Fri, 11 Sep 2026 13:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bill Wendling <morbo@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 Bradley Morgan <brads@mainlining.org>
Subject: [brauner-vfs:namespace-7.4.misc 6/7]
 kernel/user_namespace.c:787:22: warning: no previous prototype for function
 'insert_extent'
Message-ID: <202609111305.ta3EOA2x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git namespace-7.4.misc
head:   34a496d638705dc227cc6dd2aaaa9e450893502f
commit: f6f1a2496ba5dcc076d7fb7aa329887cd6ae55fa [6/7] userns: Add KUnit test suite for uid_gid_map
config: s390-defconfig (https://download.01.org/0day-ci/archive/20260911/202609111305.ta3EOA2x-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111305.ta3EOA2x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111305.ta3EOA2x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/user_namespace.c:787:22: warning: no previous prototype for function 'insert_extent' [-Wmissing-prototypes]
     787 | VISIBLE_IF_KUNIT int insert_extent(struct uid_gid_map *map,
         |                      ^
   kernel/user_namespace.c:787:18: note: declare 'static' if the function is not intended to be used outside of this translation unit
     787 | VISIBLE_IF_KUNIT int insert_extent(struct uid_gid_map *map,
         |                  ^
         |                  static 
>> kernel/user_namespace.c:860:22: warning: no previous prototype for function 'sort_idmaps' [-Wmissing-prototypes]
     860 | VISIBLE_IF_KUNIT int sort_idmaps(struct uid_gid_map *map)
         |                      ^
   kernel/user_namespace.c:860:18: note: declare 'static' if the function is not intended to be used outside of this translation unit
     860 | VISIBLE_IF_KUNIT int sort_idmaps(struct uid_gid_map *map)
         |                  ^
         |                  static 
   2 warnings generated.


vim +/insert_extent +787 kernel/user_namespace.c

   781	
   782	/*
   783	 * insert_extent - Safely insert a new idmap extent into struct uid_gid_map.
   784	 * Takes care to allocate a 4K block of memory if the number of mappings exceeds
   785	 * UID_GID_MAP_MAX_BASE_EXTENTS.
   786	 */
 > 787	VISIBLE_IF_KUNIT int insert_extent(struct uid_gid_map *map,
   788					   struct uid_gid_extent *extent)
   789	{
   790		struct uid_gid_extent *dest;
   791	
   792		if (map->nr_extents == UID_GID_MAP_MAX_BASE_EXTENTS) {
   793			struct uid_gid_extent *forward;
   794	
   795			/* Allocate memory for 340 mappings. */
   796			forward = kmalloc_objs(struct uid_gid_extent,
   797					       UID_GID_MAP_MAX_EXTENTS);
   798			if (!forward)
   799				return -ENOMEM;
   800	
   801			/* Copy over memory. Only set up memory for the forward pointer.
   802			 * Defer the memory setup for the reverse pointer.
   803			 */
   804			memcpy(forward, map->extent,
   805			       map->nr_extents * sizeof(map->extent[0]));
   806	
   807			map->forward = forward;
   808			map->reverse = NULL;
   809		}
   810	
   811		/*
   812		 * nr_extents must be updated before the extent and forward arrays are
   813		 * accessed, otherwise KSAN will assert an out-of-bounds error.
   814		 */
   815		map->nr_extents++;
   816		if (map->nr_extents <= UID_GID_MAP_MAX_BASE_EXTENTS)
   817			dest = &map->extent[map->nr_extents - 1];
   818		else
   819			dest = &map->forward[map->nr_extents - 1];
   820	
   821		*dest = *extent;
   822		return 0;
   823	}
   824	EXPORT_SYMBOL_IF_KUNIT(insert_extent);
   825	
   826	/* cmp function to sort() forward mappings */
   827	static int cmp_extents_forward(const void *a, const void *b)
   828	{
   829		const struct uid_gid_extent *e1 = a;
   830		const struct uid_gid_extent *e2 = b;
   831	
   832		if (e1->first < e2->first)
   833			return -1;
   834	
   835		if (e1->first > e2->first)
   836			return 1;
   837	
   838		return 0;
   839	}
   840	
   841	/* cmp function to sort() reverse mappings */
   842	static int cmp_extents_reverse(const void *a, const void *b)
   843	{
   844		const struct uid_gid_extent *e1 = a;
   845		const struct uid_gid_extent *e2 = b;
   846	
   847		if (e1->lower_first < e2->lower_first)
   848			return -1;
   849	
   850		if (e1->lower_first > e2->lower_first)
   851			return 1;
   852	
   853		return 0;
   854	}
   855	
   856	/*
   857	 * sort_idmaps - Sorts an array of idmap entries.
   858	 * Can only be called if number of mappings exceeds UID_GID_MAP_MAX_BASE_EXTENTS.
   859	 */
 > 860	VISIBLE_IF_KUNIT int sort_idmaps(struct uid_gid_map *map)
   861	{
   862		if (map->nr_extents <= UID_GID_MAP_MAX_BASE_EXTENTS)
   863			return 0;
   864	
   865		/* Sort forward array. */
   866		sort(map->forward, map->nr_extents, sizeof(struct uid_gid_extent),
   867		     cmp_extents_forward, NULL);
   868	
   869		/* Only copy the memory from forward we actually need. */
   870		map->reverse = kmemdup_array(map->forward, map->nr_extents,
   871					     sizeof(struct uid_gid_extent), GFP_KERNEL);
   872		if (!map->reverse)
   873			return -ENOMEM;
   874	
   875		/* Sort reverse array. */
   876		sort(map->reverse, map->nr_extents, sizeof(struct uid_gid_extent),
   877		     cmp_extents_reverse, NULL);
   878	
   879		return 0;
   880	}
   881	EXPORT_SYMBOL_IF_KUNIT(sort_idmaps);
   882	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

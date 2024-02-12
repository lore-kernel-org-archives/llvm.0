Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A4117C2;
	Mon, 12 Feb 2024 01:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707702801; cv=none; b=Isxi03aXgSaufbVFgkPWQhY0MZl2/fMpx5nAFa8MjC6sbvEPM+5Msh8wxM7rNB9m3YwMoN5Nst4eHboQMPbLucBB/poD1tfB93c3lT7gcHN17eWHRD3Axt/s1hU1ztPGqoiXgs0rBc8PqYXG1e0cjkKl+13v6W5b5zmUVECfTEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707702801; c=relaxed/simple;
	bh=tdqEiITcjnUQ8+Cfsv9BjzEAX2VwC9h3wAtRJPeLQ+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m2OMFx6GYYqb4BJdv4+Gac1dprQhTYm8crm7EP6nCAHs28PVEJVsZlo/It7M4TW86qdwGE0WgPN7gcbDKuYRV9UN095RI9/10syzc259Wo9fovhqdMDZFBm+nRWjra4enTQaX+vg+sytyYwlozaJpKgTg6GsujRzbj619O02DR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/pJE1vP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/pJE1vP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707702800; x=1739238800;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tdqEiITcjnUQ8+Cfsv9BjzEAX2VwC9h3wAtRJPeLQ+4=;
  b=B/pJE1vPXI0tI1cHUPkt+8f8K6VS8Hu6pqnWPz7uuCbdk89l+isCXm05
   3hcQ3Q9MkT9EW/Rd24mzyPE+AKOXMNl5VI+7UOxg0xJT/zrw53Vjv/r/s
   ef2Y4F0pOlcpCrcP0kFRujNVrr3oBRpBWkOFyyd7ZVvqj75YacE0LFL6v
   qTnbNiSJ3ic8h7On60PXVCBTzBzesGsPbClP/up16uRI7ZIhsWg7I3wVL
   DCQOTpooARLpNF2fNU9nKJx2fFua7XQUtQGNycras1YnQNyZ8LRBEmffN
   DH6V/in0rsbB6mNtKLEfHKuTLa2fxhn+bejZ/WwYIX/zTzIVDisne4UAO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1812643"
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="1812643"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 17:53:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="7098577"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2024 17:53:18 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZLVT-0006rW-2C;
	Mon, 12 Feb 2024 01:53:15 +0000
Date: Mon, 12 Feb 2024 09:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Luca Coelho <luciano.coelho@intel.com>
Subject: [drm-misc:for-linux-next 49/49]
 drivers/gpu/drm/tests/drm_mm_test.c:191:25: error: implicit declaration of
 function 'drm_debug_printer' is invalid in C99
Message-ID: <202402120908.e1oAZN0i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   7edd06233958d9086a9e3eb723a8768d3c5a9ce1
commit: e154c4fc7bf2d5c3f86d07628ab1cb03e8085c25 [49/49] drm: remove drm_debug_printer in favor of drm_dbg_printer
config: powerpc-randconfig-002-20240211 (https://download.01.org/0day-ci/archive/20240212/202402120908.e1oAZN0i-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402120908.e1oAZN0i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402120908.e1oAZN0i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_mm_test.c:191:25: error: implicit declaration of function 'drm_debug_printer' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           struct drm_printer p = drm_debug_printer(test->name);
                                  ^
   drivers/gpu/drm/tests/drm_mm_test.c:191:25: note: did you mean 'drm_dbg_printer'?
   include/drm/drm_print.h:328:34: note: 'drm_dbg_printer' declared here
   static inline struct drm_printer drm_dbg_printer(struct drm_device *drm,
                                    ^
   drivers/gpu/drm/tests/drm_mm_test.c:191:21: error: initializing 'struct drm_printer' with an expression of incompatible type 'int'
           struct drm_printer p = drm_debug_printer(test->name);
                              ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/drm_debug_printer +191 drivers/gpu/drm/tests/drm_mm_test.c

393b50f30566ba drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  188  
961bcdf956a464 drivers/gpu/drm/tests/drm_mm_test.c     Maíra Canal      2022-09-11  189  static void drm_test_mm_debug(struct kunit *test)
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  190  {
3eb791c891aa91 drivers/gpu/drm/tests/drm_mm_test.c     Michał Winiarski 2024-01-16 @191  	struct drm_printer p = drm_debug_printer(test->name);
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  192  	struct drm_mm mm;
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  193  	struct drm_mm_node nodes[2];
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  194  
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  195  	/* Create a small drm_mm with a couple of nodes and a few holes, and
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  196  	 * check that the debug iterator doesn't explode over a trivial drm_mm.
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  197  	 */
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  198  	drm_mm_init(&mm, 0, 4096);
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  199  
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  200  	memset(nodes, 0, sizeof(nodes));
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  201  	nodes[0].start = 512;
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  202  	nodes[0].size = 1024;
fc8d29e298cf47 drivers/gpu/drm/tests/drm_mm_test.c     Arthur Grillo    2022-07-08  203  	KUNIT_ASSERT_FALSE_MSG(test, drm_mm_reserve_node(&mm, &nodes[0]),
fc8d29e298cf47 drivers/gpu/drm/tests/drm_mm_test.c     Arthur Grillo    2022-07-08  204  			       "failed to reserve node[0] {start=%lld, size=%lld)\n",
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  205  			       nodes[0].start, nodes[0].size);
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  206  
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  207  	nodes[1].size = 1024;
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  208  	nodes[1].start = 4096 - 512 - nodes[1].size;
fc8d29e298cf47 drivers/gpu/drm/tests/drm_mm_test.c     Arthur Grillo    2022-07-08  209  	KUNIT_ASSERT_FALSE_MSG(test, drm_mm_reserve_node(&mm, &nodes[1]),
fc8d29e298cf47 drivers/gpu/drm/tests/drm_mm_test.c     Arthur Grillo    2022-07-08  210  			       "failed to reserve node[0] {start=%lld, size=%lld)\n",
fc8d29e298cf47 drivers/gpu/drm/tests/drm_mm_test.c     Arthur Grillo    2022-07-08  211  			       nodes[0].start, nodes[0].size);
3eb791c891aa91 drivers/gpu/drm/tests/drm_mm_test.c     Michał Winiarski 2024-01-16  212  
3eb791c891aa91 drivers/gpu/drm/tests/drm_mm_test.c     Michał Winiarski 2024-01-16  213  	drm_mm_print(&mm, &p);
3eb791c891aa91 drivers/gpu/drm/tests/drm_mm_test.c     Michał Winiarski 2024-01-16  214  	KUNIT_SUCCEED(test);
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  215  }
06df8ac682e6a0 drivers/gpu/drm/selftests/test-drm_mm.c Chris Wilson     2016-12-22  216  

:::::: The code at line 191 was first introduced by commit
:::::: 3eb791c891aa91603a5fbbfea940f8acf5f17d45 drm/tests: mm: Call drm_mm_print in drm_test_mm_debug

:::::: TO: Michał Winiarski <michal.winiarski@intel.com>
:::::: CC: Maxime Ripard <mripard@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

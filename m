Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545C113AA27;
	Sat, 15 Mar 2025 10:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742034379; cv=none; b=gAdMc3Z4BLVkWASNnz0WD2GftRxxu7zHLzzVHBehPs4xlgd3KftlRqjWkhtwnTt8d72dGgBJ+Nb7XwUZJPVz/Z+Fz59mpkQBawP7fDOkSV9pwJAJVFf95w7fwKWq8b90dm66/I1p5Jt9afk9A7NrF5tkN3qBhBKXPjoop3JQDzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742034379; c=relaxed/simple;
	bh=X4Q5OmNEO2RCflqztTRWP1v+33pbm1riAHg2Gfekiqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ow6yY7yAheAJ+6tnjcwZVn9ScxjsM73fJjrA/vgluFVUWn4yJdlbq35OGL3yD3r2vmGljeZZMhD4ekMx6VWjBL5+lGA+xdV92Qh6BV5jn8OpQ5aCknwdm77tcXYCSq/J4njrvmKQZZ7pza0/07oni3F6fIawTVnRhtspsDTbWWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fj4Ki8cf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fj4Ki8cf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742034377; x=1773570377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X4Q5OmNEO2RCflqztTRWP1v+33pbm1riAHg2Gfekiqo=;
  b=Fj4Ki8cf9IQI3Gql87mr6Fkr90tfn8VA+Fl6PiB3Upt4jAhV1gVwZb8O
   eIOgXrm9RAqsfpK3dBK/EbwdvvaSMwbJ0Sa4Vb3qld2DJBhPGDfZbAJkU
   7XIHoPs4ygIQ+q18TZL359CnyM6QQQKqj6WOvcWTjpFTg0A+3YqPU6BqN
   BLtSZzjxC3jywriWL/6kWOXeIyuC2L+5BQ7u5FOaQjNl6ILMGqwdbQwEF
   bTba8hi6iL+qK/Ui7iMm3uYhT+4ToXwIOmGa4Ug4pqL6XDlt0gDCnAU/w
   UL5DTCfK9mPggRCsZLGx+0830b+d/CkxAHqjArLNwHCrA1lchMxTknb+S
   w==;
X-CSE-ConnectionGUID: Yob2f0FhSNKP1pSXeL6dMQ==
X-CSE-MsgGUID: tX+nwMP9RraR2ZHTi5tZhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43391977"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="43391977"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 03:26:17 -0700
X-CSE-ConnectionGUID: /OANnVKNR8yCIf6AmkPAhA==
X-CSE-MsgGUID: 3gaOF1inRU+Bz43jtAYz9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="121323158"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Mar 2025 03:26:15 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttOib-000BFD-2Z;
	Sat, 15 Mar 2025 10:26:13 +0000
Date: Sat, 15 Mar 2025 18:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:memcg-stock-trylock 1/2] lib/slub_kunit.c:10:10: fatal
 error: 'asm/tsc.h' file not found
Message-ID: <202503151838.M5kXUgbl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git memcg-stock-trylock
head:   478ebf7bfd1fda634d890d435c44fd77c97b163d
commit: 4e670c5b007b5bc341e53bb4902f72db41a30c2e [1/2] slub, kunit: hack a kmalloc/kfree microbench
config: powerpc64-randconfig-002-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151838.M5kXUgbl-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151838.M5kXUgbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151838.M5kXUgbl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/slub_kunit.c:10:10: fatal error: 'asm/tsc.h' file not found
      10 | #include <asm/tsc.h>
         |          ^~~~~~~~~~~
   1 error generated.


vim +10 lib/slub_kunit.c

  > 10	#include <asm/tsc.h>
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

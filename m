Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0650B18635;
	Mon, 27 Nov 2023 10:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jf/P+rW4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701080522; x=1732616522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q+tkuIG4elQ4G18bdgDoKvAi24ABvP1eoINyw247lNU=;
  b=jf/P+rW4e9Kr7Ju6Owp/qBdDtxyoMHOsSIE79Js1kHeUSmXDsLqzc9d6
   yKoxi5EZ1kMJQunT3Zl2+fCoLz28xN6okqaF8auP10mzoZmfXaWvZjmcZ
   aWiboH9K23SoS37yP8dLl4pTAovQcWYGrYVphA2ocfYJBxjZTqa81TAnN
   vPmBpqOIbmjx0eptk7SyhnnC+YmtbW0GS7+NpKj9MdvYaSuwKzb+gK1xK
   xQH/zIC5PAJknMzccdkl7lbnhdSrF9MILSGanbuTY6Y892u7xKj1bOuNu
   y8csjK4acTLrEQ8LmAqzOHS5BxzMDF15GemMDP35pc3l/5FUL6wqT+KpW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="372835296"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="372835296"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 02:22:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="912058110"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="912058110"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Nov 2023 02:22:00 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7YkY-00069U-1Y;
	Mon, 27 Nov 2023 10:21:58 +0000
Date: Mon, 27 Nov 2023 18:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3379/3551] fs/bcachefs/buckets.c:316:21: warning:
 no previous prototype for function 'bucket_m_to_alloc'
Message-ID: <202311271744.5EUZIZTD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48bbaf8b793e0770798519f8ee1ea2908ff0943a
commit: 8192d6956cb6798c4cb28d35712373c9af7897bf [3379/3551] bcachefs: New bucket sector count helpers
config: i386-randconfig-012-20231127 (https://download.01.org/0day-ci/archive/20231127/202311271744.5EUZIZTD-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311271744.5EUZIZTD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271744.5EUZIZTD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/buckets.c:316:21: warning: no previous prototype for function 'bucket_m_to_alloc' [-Wmissing-prototypes]
   struct bch_alloc_v4 bucket_m_to_alloc(struct bucket b)
                       ^
   fs/bcachefs/buckets.c:316:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct bch_alloc_v4 bucket_m_to_alloc(struct bucket b)
   ^
   static 
   1 warning generated.


vim +/bucket_m_to_alloc +316 fs/bcachefs/buckets.c

   315	
 > 316	struct bch_alloc_v4 bucket_m_to_alloc(struct bucket b)
   317	{
   318		return (struct bch_alloc_v4) {
   319			.gen		= b.gen,
   320			.data_type	= b.data_type,
   321			.dirty_sectors	= b.dirty_sectors,
   322			.cached_sectors	= b.cached_sectors,
   323			.stripe		= b.stripe,
   324		};
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

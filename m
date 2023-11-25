Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A492CCDA;
	Sat, 25 Nov 2023 17:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUnaw0xJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700933721; x=1732469721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dFznDDNNhPNIXpppnsgiJ+tGi5jL54Dp0PFIXkD+vcw=;
  b=JUnaw0xJu7Ir2r9T3g4g/hNMRLQPBnHwcYbu3FBRqa8aydfVHYZ3gMyD
   dlBumKhGd2fPVYY/AX9a9U6mjFRhfk/yZXoxSbLavn5mwC0qwhm2nK9TH
   C6oVQSkq58W13zBThMymc8diTObKybhoGV84c0IOuw36c6mw7DnglYVyp
   FID0PPvF0uYzwTYJJrK8KTrjnhRetf8HzxUm6WX9yfOIwwhh8YT4lQnEi
   hF5VeG5V32EBXoM2dKB5VLYFD4iLQo9FM8qPolVFxMnGxe2G89hIbE1xs
   YTtShJQK3fBI/Rn21LGx6gRy9JejhqFejweP4HpLZjRbl/9HpQDgINw/m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="377570817"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="377570817"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 09:35:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="1099368301"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="1099368301"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2023 09:35:16 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6wYk-0004FW-0C;
	Sat, 25 Nov 2023 17:35:14 +0000
Date: Sun, 26 Nov 2023 01:34:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>, tytso@mit.edu,
	adilger.kernel@dilger.ca
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] ext4: Add unit test for ext4_mb_mark_diskspace_used
Message-ID: <202311260042.kMxL6DnL-lkp@intel.com>
References: <20231125154144.3943442-6-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125154144.3943442-6-shikemeng@huaweicloud.com>

Hi Kemeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kemeng-Shi/ext4-Add-unit-test-for-test_free_blocks_simple/20231125-154444
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20231125154144.3943442-6-shikemeng%40huaweicloud.com
patch subject: [PATCH 5/5] ext4: Add unit test for ext4_mb_mark_diskspace_used
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231126/202311260042.kMxL6DnL-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260042.kMxL6DnL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260042.kMxL6DnL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/ext4/mballoc.c:6996:
   fs/ext4/mballoc-test.c:510:16: warning: variable 'max' set but not used [-Wunused-but-set-variable]
           ext4_grpblk_t max;
                         ^
>> fs/ext4/mballoc-test.c:506:13: warning: stack frame size (1036) exceeds limit (1024) in 'test_mark_diskspace_used' [-Wframe-larger-than]
   static void test_mark_diskspace_used(struct kunit *test)
               ^
   39/1036 (3.76%) spills, 997/1036 (96.24%) variables
   2 warnings generated.


vim +/test_mark_diskspace_used +506 fs/ext4/mballoc-test.c

   505	
 > 506	static void test_mark_diskspace_used(struct kunit *test)
   507	{
   508		struct super_block *sb = (struct super_block *)test->priv;
   509		struct inode inode = { .i_sb = sb, };
   510		ext4_grpblk_t max;
   511		struct ext4_allocation_context ac;
   512		struct test_range ranges[TEST_RANGE_COUNT];
   513		int i;
   514	
   515		mbt_generate_test_ranges(sb, ranges, TEST_RANGE_COUNT);
   516	
   517		ac.ac_status = AC_STATUS_FOUND;
   518		ac.ac_sb = sb;
   519		ac.ac_inode = &inode;
   520		max = EXT4_CLUSTERS_PER_GROUP(sb);
   521		for (i = 0; i < TEST_RANGE_COUNT; i++)
   522			test_mark_diskspace_used_range(test, &ac, ranges[i].start,
   523						       ranges[i].len);
   524	}
   525	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A03B71B7;
	Fri, 11 Sep 2026 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114371; cv=none; b=XGFo0ThnXRTL7Ujwl6VQ5/WDMkgJkDfRImvGh34uAzMqUQ495fWr2cqtHfdtIMWTrzol6i5bjFPjc5l5zPSN/zQ+Aog9TrXADaYBGO3ukaV45Xsk2HiHfdS+9r4S+rUsbB16d+RO0QAYF0HTK1eVOMnU+zXwSxhE9DJ9ZkqWjaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114371; c=relaxed/simple;
	bh=gvmZf3ItsRhJ8/S0UFE29TrvpRykf6zfuBlByhYmbFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKXLVYbVF1xI7tp5X/fFQmTiam0O9Wvod2d+NBDdX2gKUZwGxhgXhglTlQWDhFP7Gy3cGwChwh/4QSFs1hIlf0/+CHaCdRfnmdfun4YIiE3GdjMDooc0/Jy875AAqaZkvGsU0h8h8gL5tCUTJHMPYLAkvELJ4pTOOOl4W1VIUfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkRSlqlJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkRSlqlJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789114369; x=1820650369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gvmZf3ItsRhJ8/S0UFE29TrvpRykf6zfuBlByhYmbFI=;
  b=ZkRSlqlJo0eJmkO20ccFB+bTyPR/lVmnTCidP2hPsz6KyoS0AzBhyEOw
   6B+jx5ChlpUEvTj0J7iNuuHoU4EUg19vNkhIEHaMjL6S/LFlFgw+dxZwD
   b5AMkNGUrY/rJ4FfqxHZwxv7opcFwFBFXca4jM+HfchoohVHlmHqdJRfA
   gfd4E3Oxhlz71fQxJx4EZuYsLgytXbaWzjiug6oNJTsA/N7DuPpMzlPtF
   Oooz5NyVSGepENh7gkzcvNBy40Gm6NfrSYoXcAr0j/E/mb6IjOKnD7v7b
   tVU1Dy6Dh5Xk6pSBe2j5xBwfzPqLqc7u3YNTAmSaptAHPWTal9KKR41ZO
   g==;
X-CSE-ConnectionGUID: WykbNGTDQ9eQPItCGnwwZw==
X-CSE-MsgGUID: LXSC1G9DRqeVoUL0ECK2nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89508839"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89508839"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 01:12:49 -0700
X-CSE-ConnectionGUID: +ItDRX2hTa+1pmY5/NcOxA==
X-CSE-MsgGUID: w+iIru6QRJSpZd8HExTxcg==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="271834668"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 11 Sep 2026 01:12:47 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4wMQ-000000001HK-0ldF;
	Fri, 11 Sep 2026 08:12:02 +0000
Date: Fri, 11 Sep 2026 16:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daeho Jeong <daehojeong@google.com>
Subject: Re: [PATCH] f2fs: introduce reserve_shrink mount option for
 filesystem shrinkage
Message-ID: <202609111633.uyRbsEUB-lkp@intel.com>
References: <20260910181057.640203-1-daeho43@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910181057.640203-1-daeho43@gmail.com>

Hi Daeho,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev linus/master v7.3-rc2 next-20260909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daeho-Jeong/f2fs-introduce-reserve_shrink-mount-option-for-filesystem-shrinkage/20260910-111056
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20260910181057.640203-1-daeho43%40gmail.com
patch subject: [PATCH] f2fs: introduce reserve_shrink mount option for filesystem shrinkage
config: powerpc-randconfig-001-20260911 (https://download.01.org/0day-ci/archive/20260911/202609111633.uyRbsEUB-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111633.uyRbsEUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111633.uyRbsEUB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/debug.c:18:
>> fs/f2fs/f2fs.h:2663:6: warning: shift count >= width of type [-Wshift-count-overflow]
    2663 |         if (test_opt(sbi, RESERVE_SHRINK)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:157:26: note: expanded from macro 'test_opt'
     157 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   1 warning generated.
--
   In file included from fs/f2fs/gc.c:19:
>> fs/f2fs/f2fs.h:2663:6: warning: shift count >= width of type [-Wshift-count-overflow]
    2663 |         if (test_opt(sbi, RESERVE_SHRINK)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:157:26: note: expanded from macro 'test_opt'
     157 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
>> fs/f2fs/gc.c:2495:13: warning: shift count >= width of type [-Wshift-count-overflow]
    2495 |         } else if (test_opt(sbi, RESERVE_SHRINK)) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:157:26: note: expanded from macro 'test_opt'
     157 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/f2fs/gc.c:2498:3: warning: shift count >= width of type [-Wshift-count-overflow]
    2498 |                 clear_opt(sbi, RESERVE_SHRINK);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:153:28: note: expanded from macro 'clear_opt'
     153 |         (F2FS_OPTION(sbi).opt &= ~BIT(F2FS_MOUNT_##option))
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   3 warnings generated.
--
   In file included from fs/f2fs/super.c:34:
>> fs/f2fs/f2fs.h:2663:6: warning: shift count >= width of type [-Wshift-count-overflow]
    2663 |         if (test_opt(sbi, RESERVE_SHRINK)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:157:26: note: expanded from macro 'test_opt'
     157 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
>> fs/f2fs/super.c:548:7: warning: shift count >= width of type [-Wshift-count-overflow]
     548 |         if (!test_opt(sbi, RESERVE_SHRINK))
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:157:26: note: expanded from macro 'test_opt'
     157 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/f2fs/super.c:2326:6: warning: shift count >= width of type [-Wshift-count-overflow]
    2326 |         if (test_opt(sbi, RESERVE_SHRINK)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:157:26: note: expanded from macro 'test_opt'
     157 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   fs/f2fs/super.c:2557:6: warning: shift count >= width of type [-Wshift-count-overflow]
    2557 |         if (test_opt(sbi, RESERVE_SHRINK))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:157:26: note: expanded from macro 'test_opt'
     157 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   4 warnings generated.
--
   In file included from fs/f2fs/sysfs.c:17:
>> fs/f2fs/f2fs.h:2663:6: warning: shift count >= width of type [-Wshift-count-overflow]
    2663 |         if (test_opt(sbi, RESERVE_SHRINK)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:157:26: note: expanded from macro 'test_opt'
     157 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
>> fs/f2fs/sysfs.c:599:7: warning: shift count >= width of type [-Wshift-count-overflow]
     599 |                 if (test_opt(sbi, RESERVE_SHRINK)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:157:26: note: expanded from macro 'test_opt'
     157 |         (F2FS_OPTION(sbi).opt & BIT(F2FS_MOUNT_##option))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^  ~~~~
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +2663 fs/f2fs/f2fs.h

  2650	
  2651	static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
  2652							struct inode *inode, bool cap)
  2653	{
  2654		block_t avail_user_block_count;
  2655	
  2656		avail_user_block_count = sbi->user_block_count -
  2657						sbi->current_reserved_blocks -
  2658						sbi->alias_reserved_blocks;
  2659	
  2660		if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(sbi, inode, cap))
  2661			avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
  2662	
> 2663		if (test_opt(sbi, RESERVE_SHRINK)) {
  2664			if (avail_user_block_count > F2FS_OPTION(sbi).reserve_shrink_blocks)
  2665				avail_user_block_count -= F2FS_OPTION(sbi).reserve_shrink_blocks;
  2666			else
  2667				avail_user_block_count = 0;
  2668		}
  2669	
  2670		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
  2671			if (avail_user_block_count > sbi->unusable_block_count)
  2672				avail_user_block_count -= sbi->unusable_block_count;
  2673			else
  2674				avail_user_block_count = 0;
  2675		}
  2676	
  2677		return avail_user_block_count;
  2678	}
  2679	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

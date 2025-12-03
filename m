Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618F41B4257;
	Wed,  3 Dec 2025 01:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764723961; cv=none; b=DJBDObI/gffCXT+cV/3v5Zg3IGXQzs7GB3thjsYRf/a4KLKtkRdRxxiIZCZwaPfv11lrJZG2tONaxt/1gTZyx7F+T+M2A1f+toBJ+Gl5EK8ZdPdZ+WJXDlhJDujTlUCPdklzQMfegVpF3Vyreb7NtPvIGkTwDufpJi+Ms5Z7Uek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764723961; c=relaxed/simple;
	bh=Q7FgzPiTQVCOcOXhyBadv3BfwwB0RDeQjqgHUDVrIKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ATOvE4+TYEjO1LoOZimIK6fsUJ9P04t8Ptsf9/jPWAzCIjWM6rjeRvy4xkzYsIh1t0+NESHXKyMlJkXy17ISuoji9HgCKb22li0nSGY6nWiG8HqIuNudUL6uSCn2OElQtkqRxLFdQsMwJyAXSf8YS1sxgpBsjcvG5L6xH2Nu1Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJ1wMI+Y; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJ1wMI+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764723960; x=1796259960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q7FgzPiTQVCOcOXhyBadv3BfwwB0RDeQjqgHUDVrIKM=;
  b=LJ1wMI+YEHAlrTWoVfzjxBjZQfn869uAVGcFto3Dm+yLDbMNHi6yS3p0
   r29vf5aUxn9PG0Bg/gnGHncEfYdKs9IPqil/na0h/3WxQ4BrcSnVCxUKZ
   PV61ysrhRsEi2XExcADqZ9GngYsGHUc3d0ppb7yIlQaEAlOofZu8cino+
   n4urez4xCdAzV3Uo7OC8whNnCeFrzH3wKobBNtVbHBSuGuFFZbwI8d6fw
   GDmTM7oGZPN5Sb8HxFT8z5/vkZ/rV99R26CvCha3jwiNVIgngPyrREH6T
   3ljq5+8qoBT4Rx9OTymrx0n9GM9fhP30DB2wRUpeIEkNupNVqCWLRlj8z
   A==;
X-CSE-ConnectionGUID: UU26cuxcRbaHFln/zIWL9w==
X-CSE-MsgGUID: SwNFZi8jShiS2kfEdom0zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66874817"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66874817"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 17:06:00 -0800
X-CSE-ConnectionGUID: ikaxBdF/Qz6F9KNkEFjHtg==
X-CSE-MsgGUID: ZTMQpqADR++TPqbwIDXyJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="195320631"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Dec 2025 17:05:58 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQbJb-00000000ALf-3rV0;
	Wed, 03 Dec 2025 01:05:55 +0000
Date: Wed, 3 Dec 2025 09:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Petr Mladek <pmladek@suse.com>
Subject: [linux-next:master 9966/13055] kernel/watchdog.c:74:22: warning:
 unused variable 'hardlockup_si_mask'
Message-ID: <202512030920.NFKtekA7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47b7b5e32bb7264b51b89186043e1ada4090b558
commit: a9af76a78760717361cccc884dc649e30db61c8b [9966/13055] watchdog: add sys_info sysctls to dump sys info on system lockup
config: powerpc64-randconfig-002-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030920.NFKtekA7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030920.NFKtekA7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030920.NFKtekA7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/watchdog.c:74:22: warning: unused variable 'hardlockup_si_mask' [-Wunused-variable]
      74 | static unsigned long hardlockup_si_mask;
         |                      ^~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/hardlockup_si_mask +74 kernel/watchdog.c

    62	
    63	/*
    64	 * Should we panic when a soft-lockup or hard-lockup occurs:
    65	 */
    66	unsigned int __read_mostly hardlockup_panic =
    67				IS_ENABLED(CONFIG_BOOTPARAM_HARDLOCKUP_PANIC);
    68	
    69	/*
    70	 * bitmasks to control what kinds of system info to be printed when
    71	 * hard lockup is detected, it could be task, memory, lock etc.
    72	 * Refer include/linux/sys_info.h for detailed bit definition.
    73	 */
  > 74	static unsigned long hardlockup_si_mask;
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

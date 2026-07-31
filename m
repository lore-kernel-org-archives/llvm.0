Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4982825228D;
	Fri, 31 Jul 2026 20:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529808; cv=none; b=Ebc6AZvkY31p4rp/3dVzAoQrvsGpln0NRD1SrKf+GxYEddUCIK9wUjJVEsZpiyvMJ8XrxKb39s9Z2VJsqbX7SzJ2lRvuetA1PM1pbH5zdPlPXDCmJe9CRPCfh1XXSVLp2vsXP4EbRlb/L6Q+3RVsKDiEvI02w+R8ba8+YvrN1yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529808; c=relaxed/simple;
	bh=bqF7m29joik0IJmWlz7XeZl/PRgS76pfe5mX7RodZM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c5FtaTnVBl32rUqaYbhk34s3NT8b5uU3AfFzoeX8UyATNVY+htmpAnKodL6bZmXolVGy0l076o14J4CIqaqvjOV/66Fx77vMB0GyLqBmtWCblpX7yL+ThP06fDzGXClJJvOebRaGK5bErdu1ms+UcG6mbxigrKHRx1I08MABBYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQfFr7xl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQfFr7xl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785529806; x=1817065806;
  h=date:from:to:cc:subject:message-id;
  bh=bqF7m29joik0IJmWlz7XeZl/PRgS76pfe5mX7RodZM8=;
  b=MQfFr7xlcFMWBwooe/njMbH9t5Ft84sL6za4t1Vx8KXz/2Kz88IbgxUr
   ico4By89c4WR0h1Fl3fAEim+vHCWpC7mYMYOMkM2JyIBGNxg24PijaS+p
   qI1wleoz/uZjw67xNd7zwqf5wyL0b+yIIdM/CNyOqxYsNDszxa6aiZE1b
   nD5dycPM+jLZ3kK9mOG9BgFPClb/bm8nhzRVBeEzXL0nzBDVCzckMoT/6
   z1LqrXXTzn2MmvU9s8lYzZTjhtQMRdcmHVPY7UQFRAC00zrBT3O5MlCWJ
   oFmRXu9LJhfHGtlvzrc2BKFWzAWhJzbEqvR7hiGPlIoUjQ45QZlO3XiDP
   A==;
X-CSE-ConnectionGUID: nQnhBdz2S8qQREOMd+jbfg==
X-CSE-MsgGUID: BgpxqWxiQJyFsz5+Dzl5sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86175766"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="86175766"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 13:30:04 -0700
X-CSE-ConnectionGUID: w2O/IcqYRwmDxNefNBX34w==
X-CSE-MsgGUID: OVU8TD1mQSCouP05GGxNYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="258869356"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Jul 2026 13:30:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wptrj-000000002C9-3gx2;
	Fri, 31 Jul 2026 20:29:59 +0000
Date: Sat, 01 Aug 2026 04:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Georgia Garcia <georgia.garcia@canonical.com>
Subject: [linux-next:master 10056/11507]
 security/apparmor/apparmorfs.c:1469:1: warning: unused variable
 'seq_ns_compress_min_fops'
Message-ID: <202608010404.4hcTn1py-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   415606a7be939835db9b0d6b711887586646346d
commit: 1c5f27e845e84f58ed6bbe3e6bc12d6a013e74b5 [10056/11507] apparmor: Fix build failure when ZSTD_DECOMPRESS is not enabled
config: powerpc-randconfig-001-20260801 (https://download.01.org/0day-ci/archive/20260801/202608010404.4hcTn1py-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010404.4hcTn1py-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010404.4hcTn1py-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/apparmorfs.c:1469:1: warning: unused variable 'seq_ns_compress_min_fops' [-Wunused-const-variable]
    1469 | SEQ_NS_FOPS(compress_min);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   security/apparmor/apparmorfs.c:1391:37: note: expanded from macro 'SEQ_NS_FOPS'
    1391 | static const struct file_operations seq_ns_ ##NAME ##_fops = {        \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:132:1: note: expanded from here
     132 | seq_ns_compress_min_fops
         | ^~~~~~~~~~~~~~~~~~~~~~~~
>> security/apparmor/apparmorfs.c:1470:1: warning: unused variable 'seq_ns_compress_max_fops' [-Wunused-const-variable]
    1470 | SEQ_NS_FOPS(compress_max);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   security/apparmor/apparmorfs.c:1391:37: note: expanded from macro 'SEQ_NS_FOPS'
    1391 | static const struct file_operations seq_ns_ ##NAME ##_fops = {        \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:140:1: note: expanded from here
     140 | seq_ns_compress_max_fops
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/seq_ns_compress_min_fops +1469 security/apparmor/apparmorfs.c

2218d08123362c Jon Tourville 2022-07-11  1464  
40cde7fcc344bc John Johansen 2017-06-09  1465  SEQ_NS_FOPS(stacked);
40cde7fcc344bc John Johansen 2017-06-09  1466  SEQ_NS_FOPS(nsstacked);
64c8697045f877 John Johansen 2017-05-25  1467  SEQ_NS_FOPS(level);
64c8697045f877 John Johansen 2017-05-25  1468  SEQ_NS_FOPS(name);
2218d08123362c Jon Tourville 2022-07-11 @1469  SEQ_NS_FOPS(compress_min);
2218d08123362c Jon Tourville 2022-07-11 @1470  SEQ_NS_FOPS(compress_max);
3e3e569539864d John Johansen 2017-01-16  1471  
5d5182cae40115 John Johansen 2017-05-09  1472  

:::::: The code at line 1469 was first introduced by commit
:::::: 2218d08123362c63bab257caf5ec3bc1a6e87ae9 apparmor: expose compression level limits in sysfs

:::::: TO: Jon Tourville <jon.tourville@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

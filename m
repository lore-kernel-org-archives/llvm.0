Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90763A48E6;
	Thu, 24 Sep 2026 04:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790224411; cv=none; b=nT4yq/a4PfGa8NMYgDEdZiWJx7nBLlKeHnM8ayJ3IROjWHEMt2091AZiZVXrxZDTOy7UfQuCv9gdeI9M/teB7V39R8Px5rEf84FTzQmUgT5QO8/uVdYgWSNrvSUnXZv/IhbHahN7UL6fl+PPHN69gSG3tmGEbCkFTwWhQOmISdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790224411; c=relaxed/simple;
	bh=l/3RpbMTkBtUBduClSIAgkGXjIpmb3CiegZTLuQ0WPo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rwzfuuvZ7LAirlTEt8lts8i+IXPFxC47i0LsUKv1lIwItM1Zz0QImstPfPm27ArL6Vj5eSAP+7BVX6S2pzsNLZnQ3HPt8swfST3e4bppZJgNVwJpurZPniV6422vqNLzHIm/+BKHgDCBAFWGzi0UyTdXMK4Pj6HuUnSUELiqlBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYuLTJc+; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYuLTJc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790224409; x=1821760409;
  h=date:from:to:cc:subject:message-id;
  bh=l/3RpbMTkBtUBduClSIAgkGXjIpmb3CiegZTLuQ0WPo=;
  b=UYuLTJc+co1AqdbtzZDbbSXxueI+rPTpuUCB1Z6go98NvlqzsS8sA06p
   A+nDmgwmaCdAXWTBqUGEsKlus6c7OmGYPd1XW9DVy7i8Engy8kt9fpgIz
   imL+FwuBnHUZIL4r6Fi1bMEm2wK3tef29C4a7hBs7hlY9LUbJt+Sv+Nwy
   b7t3D/A6M+fxcAb2/r0ELWQaPFnb7CwzgZTQLdW+3q7DOzbipq7bPyTzS
   69wt++Dz0sZtiF3OFThFj4DWbjhuanZdI8ZW1oR+awj1HEKO1yio9uArZ
   JXJGCM+KFBM4tRprHMFvkxeZcG7oZbe2jR1sNNxH5yPVFF1Md7WO2olbP
   w==;
X-CSE-ConnectionGUID: fMIkzfQATSuiiiC3bQZq5g==
X-CSE-MsgGUID: cqI75ltjT1Sub/k811g0Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1481283"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="1481283"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:33:28 -0700
X-CSE-ConnectionGUID: U5kyPlrRTOyLaEnfDIvoFw==
X-CSE-MsgGUID: CIks3rG3Say75ey3L0S3MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="271747055"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Sep 2026 21:33:26 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9b99-00000000ID0-1qFS;
	Thu, 24 Sep 2026 04:33:23 +0000
Date: Thu, 24 Sep 2026 12:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: Mehmet Fide <mehmet.fide@screeningeagle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [linux-next:master 7345/8910]
 include/linux/pinctrl/consumer.h:110:10: error: use of undeclared identifier
 'ENOTSUPP'
Message-ID: <202609241240.61Hz5rix-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: b44aec87658e5d1882503ad1208ebf0b052f0ac0 [7345/8910] pinctrl: make the CONFIG_PINCTRL=n gpio config stubs return -ENOTSUPP
config: i386-buildonly-randconfig-1002-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241240.61Hz5rix-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241240.61Hz5rix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241240.61Hz5rix-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/mediatek/mt8186/mt8186-afe-gpio.c:8:
>> include/linux/pinctrl/consumer.h:110:10: error: use of undeclared identifier 'ENOTSUPP'
     110 |         return -ENOTSUPP;
         |                 ^~~~~~~~
   include/linux/pinctrl/consumer.h:117:10: error: use of undeclared identifier 'ENOTSUPP'
     117 |         return -ENOTSUPP;
         |                 ^~~~~~~~
   In file included from sound/soc/mediatek/mt8186/mt8186-afe-gpio.c:10:
   In file included from sound/soc/mediatek/mt8186/mt8186-afe-common.h:11:
   In file included from include/sound/soc.h:26:
   In file included from include/sound/ac97_codec.h:17:
   In file included from include/sound/pcm.h:14:
   In file included from include/linux/poll.h:10:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from sound/soc/mediatek/mt8186/mt8186-afe-gpio.c:10:
   In file included from sound/soc/mediatek/mt8186/mt8186-afe-common.h:11:
   In file included from include/sound/soc.h:26:
   In file included from include/sound/ac97_codec.h:17:
   In file included from include/sound/pcm.h:14:
   In file included from include/linux/poll.h:10:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from sound/soc/mediatek/mt8186/mt8186-afe-gpio.c:10:
   In file included from sound/soc/mediatek/mt8186/mt8186-afe-common.h:11:
   In file included from include/sound/soc.h:26:
   In file included from include/sound/ac97_codec.h:17:
   In file included from include/sound/pcm.h:14:
   In file included from include/linux/poll.h:10:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from sound/soc/mediatek/mt8186/mt8186-afe-gpio.c:10:
   In file included from sound/soc/mediatek/mt8186/mt8186-afe-common.h:11:
   In file included from include/sound/soc.h:26:
   In file included from include/sound/ac97_codec.h:17:
   In file included from include/sound/pcm.h:14:
   In file included from include/linux/poll.h:10:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from sound/soc/mediatek/mt8186/mt8186-afe-gpio.c:10:
   In file included from sound/soc/mediatek/mt8186/mt8186-afe-common.h:11:
   In file included from include/sound/soc.h:26:
   In file included from include/sound/ac97_codec.h:17:
   In file included from include/sound/pcm.h:14:
   In file included from include/linux/poll.h:10:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from sound/soc/mediatek/mt8186/mt8186-afe-gpio.c:10:
   In file included from sound/soc/mediatek/mt8186/mt8186-afe-common.h:11:
   In file included from include/sound/soc.h:26:
   In file included from include/sound/ac97_codec.h:17:
   In file included from include/sound/pcm.h:14:


vim +/ENOTSUPP +110 include/linux/pinctrl/consumer.h

   105	
   106	static inline int
   107	pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
   108				unsigned long *config)
   109	{
 > 110		return -ENOTSUPP;
   111	}
   112	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

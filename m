Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF67EDC;
	Sun,  7 Apr 2024 02:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712456162; cv=none; b=i4XGLSrotpfkOznvQL0bzsVJ55HmG/0dngP+AgCEtCS8yEEWOaJx6lHdaZnVgalfh/yrfIYRna2Mo+X17bUQ/hGkpQafuR/v7l00W7D0FIsQemDkfkmr+MbroXyommw7vjKJsNHtHe+cEex93etEil3xwSVIf0b7/DF/nNDyBVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712456162; c=relaxed/simple;
	bh=kV6ZEd0mUPn8WwNtyquBljhyluW0RBgEuVzi8XsxypE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LYAIaA6HdltVRa6HPbZul1terxXNSiqO/D5XwpGRqqPYJ4RfhCBYmLqVA1OlpxPVFo8KpgSsL8cEN1eUobjt9VE4VvaxiJOlMl9z5mPqWE3K3HvpGOCgGHMea6TFQAh/0vyAEGQ6pFVEPG0rAauKK9uVCAuLcbAcgxYQD67T+qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQKOlCUe; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQKOlCUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712456160; x=1743992160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kV6ZEd0mUPn8WwNtyquBljhyluW0RBgEuVzi8XsxypE=;
  b=BQKOlCUecaFJhAnG3Gb3GYV1KIGjoc/41aY7hrbDeRbZgr90+87OO7tG
   +3NqnjO9hTt0Ktcf9KIuzt3dPUBWcTdxnuQuYJo48/2rsu4gf4NHRRFsP
   69UBLbguT/sEcaVOHcr0UC7VRLoFaIJ0nXAy0XlqTQmcRfqAb7OI5w2cB
   +nh0mjVtzvj3Se6lz+i3+FrtRAIXIjN9HBmpvQlzm339belrON+/KUzhC
   BiO3B0jvw0OLE2f43Yi7B9MRDMFW61BeN0Dm4yvwCOCBZ/mZjN24Yl5ev
   hEKAyuabRW0IPYeHuntymq47CqeiQwfmKbIwOYHMNOKK5tbz+7OTOHGW5
   A==;
X-CSE-ConnectionGUID: BPCpWnMfQZ25ptaurJcivA==
X-CSE-MsgGUID: c4ucViXvRK2e3+hOw0zUAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7878239"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="7878239"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 19:15:59 -0700
X-CSE-ConnectionGUID: 1YpZx088SSOX9pp0XIYvng==
X-CSE-MsgGUID: AzkKDCMYRg28LMOdwMnNEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="42698011"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2024 19:15:57 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtI4Z-000452-1K;
	Sun, 07 Apr 2024 02:15:55 +0000
Date: Sun, 7 Apr 2024 10:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 133/133] drivers/watchdog/ath79_wdt.c:235:3:
 error: field designator 'write' does not refer to any field in type 'const
 struct file_operations'
Message-ID: <202404071037.YS99gI5P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   1a95bcd36c1c2fd1c92f33b5ea95c2e0a5667100
commit: 1a95bcd36c1c2fd1c92f33b5ea95c2e0a5667100 [133/133] REMOVE ->read() and ->write()
config: arm-randconfig-002-20240407 (https://download.01.org/0day-ci/archive/20240407/202404071037.YS99gI5P-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 233c030dcb18880d5f0a749573f11f96f35e76b8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404071037.YS99gI5P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404071037.YS99gI5P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/watchdog/ath79_wdt.c:235:3: error: field designator 'write' does not refer to any field in type 'const struct file_operations'
     235 |         .write          = ath79_wdt_write,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/watchdog/wdt977.c:423:3: error: field designator 'write' does not refer to any field in type 'const struct file_operations'
     423 |         .write          = wdt977_write,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from drivers/gpu/drm/armada/armada_debugfs.c:12:
   In file included from include/drm/drm_debugfs.h:38:
   In file included from include/drm/drm_gpuvm.h:34:
   In file included from include/drm/drm_gem.h:42:
   In file included from include/drm/drm_vma_manager.h:27:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/armada/armada_debugfs.c:88:3: error: field designator 'read' does not refer to any field in type 'const struct file_operations'
      88 |         .read = seq_read,
         |         ~^~~~~~~~~~~~~~~
>> drivers/gpu/drm/armada/armada_debugfs.c:89:3: error: field designator 'write' does not refer to any field in type 'const struct file_operations'
      89 |         .write = armada_debugfs_crtc_reg_write,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/gpu/drm/omapdrm/dss/dss.c:13:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/omapdrm/dss/dss.c:919:3: error: field designator 'read' does not refer to any field in type 'const struct file_operations'
     919 |         .read           = seq_read,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +235 drivers/watchdog/ath79_wdt.c

f8394f61c66f48 Gabor Juhos   2011-01-04  231  
f8394f61c66f48 Gabor Juhos   2011-01-04  232  static const struct file_operations ath79_wdt_fops = {
f8394f61c66f48 Gabor Juhos   2011-01-04  233  	.owner		= THIS_MODULE,
f8394f61c66f48 Gabor Juhos   2011-01-04  234  	.llseek		= no_llseek,
f8394f61c66f48 Gabor Juhos   2011-01-04 @235  	.write		= ath79_wdt_write,
f8394f61c66f48 Gabor Juhos   2011-01-04  236  	.unlocked_ioctl	= ath79_wdt_ioctl,
b6dfb2477fb0bf Arnd Bergmann 2019-06-03  237  	.compat_ioctl	= compat_ptr_ioctl,
f8394f61c66f48 Gabor Juhos   2011-01-04  238  	.open		= ath79_wdt_open,
f8394f61c66f48 Gabor Juhos   2011-01-04  239  	.release	= ath79_wdt_release,
f8394f61c66f48 Gabor Juhos   2011-01-04  240  };
f8394f61c66f48 Gabor Juhos   2011-01-04  241  

:::::: The code at line 235 was first introduced by commit
:::::: f8394f61c66f48b1fe9d6964ddce492d7f9a4cd9 watchdog: add driver for the Atheros AR71XX/AR724X/AR913X SoCs

:::::: TO: Gabor Juhos <juhosg@openwrt.org>
:::::: CC: Wim Van Sebroeck <wim@iguana.be>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

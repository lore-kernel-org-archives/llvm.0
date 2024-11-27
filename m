Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D644481CD;
	Wed, 27 Nov 2024 05:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732684354; cv=none; b=r9ypyCu6iyEs+KiQpYONY5PlL85UytkW5UfTAAyo8p4OQCace29h52Hbv99imd79FArCuLkaQPa4X1mIJud8uhwjQnjw+AcHJ/meFVlG2eeD4dI+LJas2Uv8IUeGDlNTDTN83zmRDrhvfpX5fWkCpameyK7chwpjirmgL0JKLPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732684354; c=relaxed/simple;
	bh=jQ3goaphYtjA+yhJ3Vo0PIg0zoY7g5ElSsnuNe8DO1k=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VNGQuoiI9H4CQtfFRRA9mk1p3BchbPTzVXs1iGTBZrc0MvpNtwlCv7jpzVSlg9qu9hVndkagUQ5EJHfBj6AzdePach7/neUa3pHAodaEfRpJnPZ7BWSwEQ2nmsPdEN/H0uyy09mYo3lFMQkQWJuZ/YDzHtKPh5yGqiaTEKueryw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHIvzxFF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHIvzxFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732684351; x=1764220351;
  h=date:from:cc:subject:message-id:mime-version;
  bh=jQ3goaphYtjA+yhJ3Vo0PIg0zoY7g5ElSsnuNe8DO1k=;
  b=VHIvzxFFkZbR5MRh0mFARQZ1lUuIkk3+lI8EKaILw874WBTCiNVIfhuI
   yEE4PEf7c9Sq9uGNAyWZ2NrdqkNySZWEypT4ZEUXyDQlwMzJl4fHptthj
   mzHlfMeD+yLfax+lNQakE57tdmS43Bsy5V8r5CyzLzWJFD8iZLfYFb4I3
   jTQBaa2X/zbA0Ud/pGrhS7KxLflpcylNVqEgMx3E3tR0EZeia/tPW+231
   bFF+3WrdtMB7HPwlCoQh0ceOVzQhWuofrf/gRsWnZ7HkBjDFhXcgpOPCF
   lEZC1COkfYr22qzNP76ygo60otoFbagSy0ERi1upKMa3EwhPXixSFI4z2
   Q==;
X-CSE-ConnectionGUID: f726PdxmTUa0aDpvzq/xng==
X-CSE-MsgGUID: IzNwfNrBRT2tD8KXsxLGxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36536442"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="36536442"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 21:12:25 -0800
X-CSE-ConnectionGUID: JADy/GT/QZq7i5FZzT1YsA==
X-CSE-MsgGUID: /woguGpQTmm5x3kAMYrn7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="92292864"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Nov 2024 21:12:24 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGALe-0007jX-22;
	Wed, 27 Nov 2024 05:12:22 +0000
Date: Wed, 27 Nov 2024 13:12:13 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:objtool/core 16/16] drivers/misc/ti-st/st_kim.o:
 warning: objtool: validate_firmware_response+0x251: Unkonwn annotation type:
 3
Message-ID: <202411271359.LCCiFrAx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   cd9921a0bc2a79a77a7e1f03f84491760d88b6a8
commit: cd9921a0bc2a79a77a7e1f03f84491760d88b6a8 [16/16] objtool: Warn about unknown annotation types
config: x86_64-randconfig-002-20241127 (https://download.01.org/0day-ci/archive/20241127/202411271359.LCCiFrAx-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271359.LCCiFrAx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411271359.LCCiFrAx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/ti-st/st_kim.c:21:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:40:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/misc/ti-st/st_kim.o: warning: objtool: validate_firmware_response+0x251: Unkonwn annotation type: 3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

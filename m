Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF3815B978;
	Mon,  6 May 2024 22:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715033313; cv=none; b=nYdZSEBNGkDpffg4jEgc6NXqEEz0s+NZVbZwR+8kI58ETZhOBV1GeoNSgwXQbLXPT8o6GB18MqCwNYBjXklZ4bXBsd6gi3+k2XIkL2TOwif5OpL6VW9kK60qTfRCBALz22nBfSOOgzAe7K51N3KHJDMFCQSkGWjUk9+U6nOqIFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715033313; c=relaxed/simple;
	bh=IVR3cD90qV8FJEIJlOYyF0vd8ieS/4RwIrooo0SeCUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kVEI6KS+xsNm9TWoJ0IKHu8p4MwW+H5MJ5y7ihrDjJ/rC7Wbxm2pgJiJfZPq1GxuNvrDFkj9C/HkreT6+yQMJr/B9ZBNvSUy1gp+5uzjeA44uOvXvPxxCSOcHNQRbzYJpyjHnY0VRAd9P8eSaAA4IakCQz+hLmh6ZHLbjn59Dis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuZeWrNI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuZeWrNI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715033312; x=1746569312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IVR3cD90qV8FJEIJlOYyF0vd8ieS/4RwIrooo0SeCUY=;
  b=UuZeWrNIZEGuGhcHkxnXgZ7oP9eBs61TwIW3QsPV2kR5ZJMzY0FpDDky
   PFHrdTqQN9PfKCjHxR768+EyAZJIgWLltA166/ZLtQ03ZjndBirr4tFr0
   eEJnXIC7Av1hTa9w7D6AHWMxX5O0rHGzVt/greSloqFJpkMSoGi8Oz5Z0
   8+lteKiVd1kAUJ7yjZqXMEogl91QR89EyeAjzqpGcR/bpYrvm3pHIobW9
   iKjOMDnvEcSj1zjLu0jdHxXrp4qXajg035M8ouhj3LP7OaOyaGiaqiI7O
   t5YKNVc3aSywWPaiHe1MY7dy5gGI3KvDmFl8K9chiLaoHiyhKytXvLjVT
   g==;
X-CSE-ConnectionGUID: Db9zUysJRQuxM4FCeDrIlQ==
X-CSE-MsgGUID: Gg9AUzWYSiGEJ+bhyEtmew==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21354459"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="21354459"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 15:08:31 -0700
X-CSE-ConnectionGUID: 8lLKxjoKTj+jZEvgvFnETw==
X-CSE-MsgGUID: N8cGphcYQpexCgq8kcrImw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="28293505"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 May 2024 15:08:29 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s46VX-00015G-0N;
	Mon, 06 May 2024 22:08:27 +0000
Date: Tue, 7 May 2024 06:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/syzbot 40/42] ld.lld: error: duplicate symbol:
 __pfx_f2fs_build_fault_attr
Message-ID: <202405070648.GAPbgYby-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   6fd891b7248d0b825dbff6454be21f60c7ba1fb0
commit: 28a4fc03f837d64c67eeeba5ef226dbed4b369dc [40/42] f2fs: check validation of fault attrs in f2fs_build_fault_attr()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240507/202405070648.GAPbgYby-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405070648.GAPbgYby-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405070648.GAPbgYby-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __pfx_f2fs_build_fault_attr
   >>> defined at dir.c
   >>>            fs/f2fs/dir.o:(__pfx_f2fs_build_fault_attr)
   >>> defined at iostat.c
   >>>            fs/f2fs/iostat.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: __pfx_f2fs_build_fault_attr
   >>> defined at dir.c
   >>>            fs/f2fs/dir.o:(__pfx_f2fs_build_fault_attr)
   >>> defined at extent_cache.c
   >>>            fs/f2fs/extent_cache.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: __pfx_f2fs_build_fault_attr
   >>> defined at dir.c
   >>>            fs/f2fs/dir.o:(__pfx_f2fs_build_fault_attr)
   >>> defined at shrinker.c
   >>>            fs/f2fs/shrinker.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: __pfx_f2fs_build_fault_attr
   >>> defined at dir.c
   >>>            fs/f2fs/dir.o:(__pfx_f2fs_build_fault_attr)
   >>> defined at recovery.c
   >>>            fs/f2fs/recovery.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: __pfx_f2fs_build_fault_attr
   >>> defined at dir.c
   >>>            fs/f2fs/dir.o:(__pfx_f2fs_build_fault_attr)
   >>> defined at segment.c
   >>>            fs/f2fs/segment.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: __pfx_f2fs_build_fault_attr
   >>> defined at dir.c
   >>>            fs/f2fs/dir.o:(__pfx_f2fs_build_fault_attr)
   >>> defined at node.c
   >>>            fs/f2fs/node.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: __pfx_f2fs_build_fault_attr
   >>> defined at dir.c
   >>>            fs/f2fs/dir.o:(__pfx_f2fs_build_fault_attr)
   >>> defined at acl.c
   >>>            fs/f2fs/acl.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: __pfx_f2fs_build_fault_attr
   >>> defined at dir.c
   >>>            fs/f2fs/dir.o:(__pfx_f2fs_build_fault_attr)
   >>> defined at xattr.c
   >>>            fs/f2fs/xattr.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: __pfx_f2fs_build_fault_attr
   >>> defined at dir.c
   >>>            fs/f2fs/dir.o:(__pfx_f2fs_build_fault_attr)
   >>> defined at debug.c
   >>>            fs/f2fs/debug.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: __pfx_f2fs_build_fault_attr
   >>> defined at dir.c
   >>>            fs/f2fs/dir.o:(__pfx_f2fs_build_fault_attr)
   >>> defined at sysfs.c
   >>>            fs/f2fs/sysfs.o:(.text+0x0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3462E1E86F;
	Thu,  4 Apr 2024 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712219501; cv=none; b=T4VvNik9WQDb5zQz5oU4qJp1w/NdWUTFysIThECzMVxARhon83QgPhGiGufmwHDuJLZYVnrsSQ1S6DlUbPb6yfGZrhxWrWxKPfFG+yvee6vbSDggos7BnYvJps62uWi66Uktc9/TFftNENz/+Q7cc/YSZtL44f9hJxZ+T4GTNpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712219501; c=relaxed/simple;
	bh=BS/AMbQeMN9w2WwwoWPPyemM6x5yIm3MxJsqcn6g7dI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pwACjrp+WVKwyTr4dhX/EYeXxlO9wa0yM3mmk7e0Zepro02D+sPGtepB+OC9lkZ+WM4TNBFMoU+/UHvOT7CNM0BuoCqPbjecwuT1IA6MyfNyNwjsZPvcsbW/Kj4MN8W/++0GXl36QK8ui62vJ8hpH8XAMQb8+F986GSewAE+y5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjFD2t5F; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjFD2t5F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712219497; x=1743755497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BS/AMbQeMN9w2WwwoWPPyemM6x5yIm3MxJsqcn6g7dI=;
  b=UjFD2t5FMq11aFOIiIO5ebdCk1kMcgp4Y4WwDeXSXuAGaSmIjjjzVX0W
   k6rq8OIbglO7UEHR5dJ6uu5S8EC8ZKEff6TODcXUK0smB+RMIN0OObqdN
   LSajediP9sCBIZowweU1Kshou+qyZT/jlQBhvrF990ppE8AvmN3hN6ntU
   Zuyy8S4P8CMaJkmJ5/5e1tZCtE/QRjycYUwfM/qY/u0cztqziSXy8MJiC
   iC13raNUYzWBFER94x7i7i3ZxjZD2miS83Yd/DH7U3WgDQ9Lr/9OWXf5O
   9Rh5X98VaSjX6LdtCpfeJr4Trfx59kJI7yXngNcn8l3MpPFXzDPY4dMgB
   A==;
X-CSE-ConnectionGUID: mtc7ZB7uSW65pP3PwE+VFQ==
X-CSE-MsgGUID: pcEY/cjvR+SAM5Aps0Qh/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="32874865"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="32874865"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 01:31:37 -0700
X-CSE-ConnectionGUID: 383dFEUXSlmOE8dCmW17EA==
X-CSE-MsgGUID: RQN0kneZROamiD6LeOTxOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="19166019"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Apr 2024 01:31:35 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsIVR-0000mg-0J;
	Thu, 04 Apr 2024 08:31:33 +0000
Date: Thu, 4 Apr 2024 16:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 16/20] fs/libfs.c:1282:42: error: use of
 undeclared identifier 'file'
Message-ID: <202404041633.sPB6V8qR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   434bfd4fff7ae30ffe26a2e330ed50ff5bb34ee4
commit: 3094d40caca196d182c0f820b0d52e0fe7a5bf2f [16/20] security: convert to read/write iterators
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240404/202404041633.sPB6V8qR-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041633.sPB6V8qR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041633.sPB6V8qR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/libfs.c:7:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/libfs.c:1282:42: error: use of undeclared identifier 'file'
    1282 |         struct simple_transaction_argresp *ar = file->private_data;
         |                                                 ^
>> fs/libfs.c:1286:46: error: no member named 'ki_pis' in 'struct kiocb'; did you mean 'ki_pos'?
    1286 |         return simple_copy_to_iter(ar->data, &iocb->ki_pis, ar->size, to);
         |                                                     ^~~~~~
         |                                                     ki_pos
   include/linux/fs.h:364:11: note: 'ki_pos' declared here
     364 |         loff_t                  ki_pos;
         |                                 ^
   1 warning and 2 errors generated.


vim +/file +1282 fs/libfs.c

  1279	
  1280	ssize_t simple_transaction_read_iter(struct kiocb *iocb, struct iov_iter *to)
  1281	{
> 1282		struct simple_transaction_argresp *ar = file->private_data;
  1283	
  1284		if (!ar)
  1285			return 0;
> 1286		return simple_copy_to_iter(ar->data, &iocb->ki_pis, ar->size, to);
  1287	}
  1288	EXPORT_SYMBOL(simple_transaction_read_iter);
  1289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675351D26E7;
	Fri, 25 Oct 2024 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729848957; cv=none; b=QNSkeuPmqJoLyqSgQ3FBXsf+A3dSS66YaNxr6bUYnBP1qIHBiKhNfRJFpJe3y60ldC4bbw4iCUsz1HG08pv1ZrvtPxSiEobqKMw73iwe2FTv8Itdv5XZC6zvO94slHjkldG5BbP7rmiUxPsCHWXc5OUQl1t53UqLNAhLNfUb0cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729848957; c=relaxed/simple;
	bh=Fmtq0gMkr811oR5AsOr2s9yUnbj3lGT3m5+PjVRdoxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RXdLShkZn4NZ7TzNCBL7LP3AkJMeqOkqCH+lmdOfjit7JNBMSdxN3n+jGKdHErp7UaUAvHayW+r+/KnwX9ilQc7sYGVG0pEshRV/Sqaw+rFGdBN0sHr2N8WQiSJEz38Uw0WiMaVzRvEDGx5jLv7Ufid+80vxMA4dMMKPgzdfw5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8KF1Rzn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8KF1Rzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729848956; x=1761384956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fmtq0gMkr811oR5AsOr2s9yUnbj3lGT3m5+PjVRdoxg=;
  b=S8KF1RznC+IGS6oLtLfAL5DPJ33hu+7mjY8rCujja4F/E7OVYzHcGYO+
   ejgZK5YZyJK684eXeOw/7vg80GzG0UfFplm4toYtMDNeiGZHudpPmE8D+
   sKlTxqBKP0mtBCm6oeiOua9E0f9iFjtQzoiVKyn+1Kkek5I4vOz1ZvvsD
   /QMuA6KS5rSJ3BxpqwjQDa/WBPR0hzHkAmuQ6TxGxgeYmswPG99ORY/q8
   hA2LW7QTY1H5wlkFjlRnBZIs+WzGbI7bg6QsJlHQtlDBb1W/NpcqI/R7C
   wzD7fTF4iRgYqrVugH2iZAd2gsrEDTn4Iipdm2/h7AtS5GedlJCHRvApp
   w==;
X-CSE-ConnectionGUID: akGeVYiHR8GkDuqeuDdDzw==
X-CSE-MsgGUID: 6c4dcEydRbeq9jd/5eEkqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33204939"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33204939"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:35:55 -0700
X-CSE-ConnectionGUID: 3CSNPN02RWKAx1eQOslrMA==
X-CSE-MsgGUID: kFQXV+ZRRTmhAwbi6u+28w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85627932"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Oct 2024 02:35:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4GjX-000XzE-2E;
	Fri, 25 Oct 2024 09:35:51 +0000
Date: Fri, 25 Oct 2024 17:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-ring-resize 5/5] io_uring/memmap.c:340:19:
 error: incomplete definition of type 'struct io_uring_ctx'
Message-ID: <202410251733.6jfoIXCQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-ring-resize
head:   a33a9152eb06cc15d20dc9d1def2a33b3ff88d81
commit: a33a9152eb06cc15d20dc9d1def2a33b3ff88d81 [5/5] io_uring/register: add IORING_REGISTER_RESIZE_RINGS
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241025/202410251733.6jfoIXCQ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251733.6jfoIXCQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251733.6jfoIXCQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/memmap.c:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> io_uring/memmap.c:340:19: error: incomplete definition of type 'struct io_uring_ctx'
     340 |         guard(mutex)(&ctx->resize_lock);
         |                       ~~~^
   io_uring/memmap.c:337:9: note: forward declaration of 'struct io_uring_ctx'
     337 |         struct io_uring_ctx *ctx = file->private_data;
         |                ^
   1 warning and 1 error generated.


vim +340 io_uring/memmap.c

   332	
   333	unsigned long io_uring_get_unmapped_area(struct file *file, unsigned long addr,
   334						 unsigned long len, unsigned long pgoff,
   335						 unsigned long flags)
   336	{
   337		struct io_uring_ctx *ctx = file->private_data;
   338		void *ptr;
   339	
 > 340		guard(mutex)(&ctx->resize_lock);
   341	
   342		ptr = io_uring_validate_mmap_request(file, pgoff, len);
   343		if (IS_ERR(ptr))
   344			return PTR_ERR(ptr);
   345	
   346		return (unsigned long) ptr;
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493D03FB87;
	Thu,  6 Jun 2024 04:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717649944; cv=none; b=efDYZPhEsSCLwsyFZqND58jr6lXyKV7mcdZNZ5wFFziLHUN/qXh8z+rpwN5NXyLw224fsY0l1v1Xhm/1h4Nm4OPgzssvrIxKYolj67VkmlVcIFHVjH85hiXA15bgajjC89P/CCwzjPv4pN0pRZvEr/GWVkTVJpvH+VJJrug9qoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717649944; c=relaxed/simple;
	bh=cuvgkfPcqhko2rNaqoaO/WdaJ5XA4m4ov2DN5/fwas4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gLV8zl7NY/O3DvVjyoPyS2sNIKwtGRlxi4ekCPRkeFok81y5xqofyKHEB2/p7m9hFsNGxa/7jYOdC7KotegGOdGWH2ePE+6Eh7FMnhpw9l4jsagfvl8Ce+T3PVZwkU7kqdGIsMIwj4QP+eaYz0wNHyH58e384a/Zd4pRA8qcTIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXFXGqY9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXFXGqY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717649942; x=1749185942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cuvgkfPcqhko2rNaqoaO/WdaJ5XA4m4ov2DN5/fwas4=;
  b=mXFXGqY9LipbFLmz1e4bBKev6B/S/tHK4Z1hNWLXZx3X63piD4nEyPL0
   ZI3HfWwR+JwSFdKmlsPkRHvh/8/J0LrTpuSIO9kRZyCcAooDETp6wStjb
   fKdgMYdXcEmm5FpR7NWydR4BWPXIs05n7stYZfqpu4/aMnil1As2JsuKP
   /H62x5YXYDSbMCylDQnp3/MmiKoUAXY6FavJvN2pUrBre58j2iGIezHeZ
   1d2GHtP5MwDkbbHCCyBt0d3pD1w2pMAoZCU7gEEZnH+6M65L+HAnrxpdy
   Hxg4HkY5DmVjVaSWZbXo9tERF3Kj0syn++DlpgLOv+j3alJKxRXyhULvP
   w==;
X-CSE-ConnectionGUID: 0Gk9PxJ3QJe7RMbJhaX/DQ==
X-CSE-MsgGUID: 5V9lYWAFRKasVTA7SNNtZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14476310"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="14476310"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 21:59:01 -0700
X-CSE-ConnectionGUID: fRMfObciRl+LzmSAJ58YDQ==
X-CSE-MsgGUID: R8l8R+2bS76YF0gDUIE36w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="61036868"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jun 2024 21:59:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF5DG-0002gT-21;
	Thu, 06 Jun 2024 04:58:58 +0000
Date: Thu, 6 Jun 2024 12:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-msg-ring.1 7/9] io_uring/io_uring.c:585:6:
 warning: no previous prototype for function 'io_cq_unlock_post'
Message-ID: <202406061201.htRM9t09-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-msg-ring.1
head:   9c799821c57ae3670fef01abd6746b33685c07d6
commit: 7de82d2e1d5af1210e8f631b7d994957c602a8d4 [7/9] hack
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240606/202406061201.htRM9t09-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061201.htRM9t09-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406061201.htRM9t09-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> io_uring/io_uring.c:585:6: warning: no previous prototype for function 'io_cq_unlock_post' [-Wmissing-prototypes]
     585 | void io_cq_unlock_post(struct io_ring_ctx *ctx)
         |      ^
   io_uring/io_uring.c:585:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     585 | void io_cq_unlock_post(struct io_ring_ctx *ctx)
         | ^
         | static 
   2 warnings generated.


vim +/io_cq_unlock_post +585 io_uring/io_uring.c

   584	
 > 585	void io_cq_unlock_post(struct io_ring_ctx *ctx)
   586		__releases(ctx->completion_lock)
   587	{
   588		io_commit_cqring(ctx);
   589		spin_unlock(&ctx->completion_lock);
   590		io_cqring_wake(ctx);
   591		io_commit_cqring_flush(ctx);
   592	}
   593	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

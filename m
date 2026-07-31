Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8819735E929;
	Fri, 31 Jul 2026 05:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785477419; cv=none; b=H8kKYXKWQJ4dB0+GPEuTJjifXW2jrI3ex6pY6mZkKlFAFYzumEbeSOHDZyk1g5Z8zP7HLpFU7r+p2zk5/Xq0bUlgPxr1I61zdANjmTm0trFoH6nTo/J+iOZDwpOulPw89XAeyODcjPoMOt69ZXPh1DI1nphnaPeUYBT+sae79DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785477419; c=relaxed/simple;
	bh=AljTJV5Ws9V+g5P206WN8LT515CPMgr8kwITomUc758=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tik2TMRTaduRUrcgWa77MHHKjpYz9uD2b5TJCEYXN1zpoDUgK7F/T5L8zqw2MQePrIGgMyWAF/5Dow9I9LIa/V0jdFBb1GmH4WTKm7JedzW/9CbryjwXRniKBVCqowbnTH5bAmM3HCmIsC9FpLhjHIHJh2QYBRPM42enxitNq7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMlOMK/p; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMlOMK/p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785477417; x=1817013417;
  h=date:from:to:cc:subject:message-id;
  bh=AljTJV5Ws9V+g5P206WN8LT515CPMgr8kwITomUc758=;
  b=AMlOMK/pMzMfNhyKbNNZHPXRNCyctPTLGYsAtbrq9VlIlGtjSK8yvBT8
   fV+uVcYM1lNxycjGgZw1MXz/yej0IWEMAc/x/g172LIJYf1uU34a58Q57
   8KIEEMHSOioBuAYbvnfm8pXf6JxddB8n9mKZOnDeDFhlDiYjRxc/mDoBR
   Fyl7HiDL9bYLbkG5iIpQwj4fQ5G3o1f9O2rCQJjOLe1vzA4TRUdG338Fs
   cliwozBZC04RnwsDBBdagQg4e1nGJFbefJ0zilpP2EyfRAXQnFS+YrpGT
   zNaYG1uA/bUAMQAHpd6ccXgzeV7zbDVRrueAkoRZNtmOllp+iLm6sUtj9
   g==;
X-CSE-ConnectionGUID: 72bxKe7QREu4lHZwuVvPtQ==
X-CSE-MsgGUID: nV6Lrfr7Rre2k4CL1KM+ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="111647033"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="111647033"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 22:56:57 -0700
X-CSE-ConnectionGUID: jeBKPaPOSpqb/kUVM/qHNQ==
X-CSE-MsgGUID: DB7ke7KZRFOB/R2hoCNeGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="258705009"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 30 Jul 2026 22:56:56 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpgEn-000000002WY-1Yzv;
	Fri, 31 Jul 2026 05:56:53 +0000
Date: Fri, 31 Jul 2026 07:56:52 +0200
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v5-premap-iova 12/14] Warning:
 block/blk-mq-dma.c:235 cannot understand function prototype: '/*  * Premapped
 path: the buffer is persistently DMA-mapped as one contiguous IOVA  *
 (dma_iova_*), so hand the whole mapping to the iterator as a single segment 
 * instead of allocati...
Message-ID: <202607310722.zfznlplf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v5-premap-iova
head:   912328a605c4767433d483436a2d592d06063095
commit: ca011e66fdccef93bc916c7cf32323ad7b6fe2e2 [12/14] block, io_uring: premap a pool buffer to exceed the dma_opt clamp
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260731/202607310722.zfznlplf-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310722.zfznlplf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310722.zfznlplf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: block/blk-mq-dma.c:235 cannot understand function prototype: '/*  * Premapped path: the buffer is persistently DMA-mapped as one contiguous IOVA  * (dma_iova_*), so hand the whole mapping to the iterator as a single segment  * instead of allocating an IOVA per I/O.  This is what lets a premapped request  * exceed the dma_opt_mapping_size() clamp folded into max_hw_sectors.  The  * completion path must NOT unmap it (see nvme_unmap_data).  *  * NOTE: this emits the mapping from its start, i.e. it assumes the request  * covers the buffer from offset 0.  The whole-buffer fixed-buffer command path  * used by the pool selftest satisfies that; an arbitrary buffer offset needs'
   Warning: block/blk-mq-dma.c:430 Excess function parameter 'state' description in 'blk_rq_integrity_dma_map_iter_next'
   Warning: block/blk-mq-dma.c:430 Excess function parameter 'state' description in 'blk_rq_integrity_dma_map_iter_next'
--
   Warning: block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
>> Warning: block/blk-map.c:516 function parameter 'opts' not described in 'blk_rq_map_user_iov_opts'
>> Warning: block/blk-map.c:516 expecting prototype for blk_rq_map_user_iov(). Prototype was for blk_rq_map_user_iov_opts() instead
   Warning: block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

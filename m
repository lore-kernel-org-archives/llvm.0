Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B90192D97;
	Thu,  7 May 2026 00:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778114467; cv=none; b=QUjx8Yo4FbCwyjpitTTbkb8mBXamLtBswd4sCWe7mxm1J2/QypTOScom/tcVd1iDfRgR7E6DBa06aq96SbNC6AxW4VC+xWurYLeIeb2EeLrZNFQ2QGyZV35wae9NR47KeHXZdQOcKd+4Ussq9dFQ70t06DHKxYka+nkiWoVRV1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778114467; c=relaxed/simple;
	bh=FUspMcyVsbNM6kK3VQ7wq/GsMq068UTly8eJlKfeSts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L7O0hW+Aa6dP/uJVwUeiBf8DqpUiRDbMKNUrAWRnnLEOrtZ/Y/PQq3OB4gPuQS/mpfDjr6ay5z8iFFoN3+BWGjdoK5Mk/zvrBIjUmv+B3qrXW7ey8mNkDUweVWDfA5xno6427Y1MABcCZaZos+udRMwqEfYeKvnR6a7V7piJs60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMstDv3r; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMstDv3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778114466; x=1809650466;
  h=date:from:to:cc:subject:message-id;
  bh=FUspMcyVsbNM6kK3VQ7wq/GsMq068UTly8eJlKfeSts=;
  b=lMstDv3rXl9yPCseSh8Qwjj3yWIFCD4QT/inGJ8lrB1gGEUlxn8NHJ05
   03vkFM/2oP1je21LchorBtPWDBAXzdT2hQoPGPc9PdI3ClycTVyGErQY/
   hsBOlVo5eYrXm2Hq8Ru/ZWXW5WyBZ6aGq2/j47T3orbfWxpt6XAF26Vrb
   raWUqlVpnxBmH2aDNlq6WPmZSe6Jp23bIiLjaTHLK0sw7+Nv7rW8yoBTz
   CiJTpyMntGBwjE2W8MXZDn55pxuEveJtCg4cIGoMUujXZHHA57L/VNJBZ
   YTDrRx1SznFeOn4S7uB2n8DuePw9my6tebqRGv3Pt1zHad7ykqoRadGcI
   Q==;
X-CSE-ConnectionGUID: ZmPcYFcOQ+qlCFoxAmseAQ==
X-CSE-MsgGUID: LVrLrPxoRyu3BIlT9phDfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82902772"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="82902772"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 17:41:06 -0700
X-CSE-ConnectionGUID: XkQJYnZWQTOrw8pknDjqPg==
X-CSE-MsgGUID: Bv5YRQ2ERaievcKaZ7TH4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="233642330"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 May 2026 17:41:03 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKmnV-000000001Mm-2YLp;
	Thu, 07 May 2026 00:41:01 +0000
Date: Thu, 07 May 2026 08:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Anuj Gupta <anuj20.g@samsung.com>
Subject: [axboe:nvme-raw-queues 11/16]
 drivers/nvme/host/pci.c:2635:3: error: field designator 'queue_uring_cmd'
 does not refer to any field in type 'const struct blk_mq_ops'
Message-ID: <202605070800.k8Kf3o4w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git nvme-raw-queues
head:   38cfa7887dc8d403af2baa576d06c438408a192c
commit: 106e34592f22c54533e7fe4ccd8374f5648ab9ca [11/16] pci: implement submission/completion for rawq commands
config: loongarch-randconfig-001 (https://download.01.org/0day-ci/archive/20260507/202605070800.k8Kf3o4w-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605070800.k8Kf3o4w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605070800.k8Kf3o4w-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/pci.c:2633:3: error: field designator 'register_queue' does not refer to any field in type 'const struct blk_mq_ops'
    2633 |         .register_queue = nvme_pci_register_queue,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:2634:3: error: field designator 'unregister_queue' does not refer to any field in type 'const struct blk_mq_ops'
    2634 |         .unregister_queue =  nvme_pci_unregister_queue,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/pci.c:2635:3: error: field designator 'queue_uring_cmd' does not refer to any field in type 'const struct blk_mq_ops'
    2635 |         .queue_uring_cmd = nvme_pci_queue_ucmd,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/pci.c:2636:3: error: field designator 'poll_uring_cmd' does not refer to any field in type 'const struct blk_mq_ops'
    2636 |         .poll_uring_cmd = nvme_poll_uring_cmd,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +2635 drivers/nvme/host/pci.c

  2622	
  2623	static const struct blk_mq_ops nvme_mq_ops = {
  2624		.queue_rq	= nvme_queue_rq,
  2625		.queue_rqs	= nvme_queue_rqs,
  2626		.complete	= nvme_pci_complete_rq,
  2627		.commit_rqs	= nvme_commit_rqs,
  2628		.init_hctx	= nvme_init_hctx,
  2629		.init_request	= nvme_pci_init_request,
  2630		.map_queues	= nvme_pci_map_queues,
  2631		.timeout	= nvme_timeout,
  2632		.poll		= nvme_poll,
  2633		.register_queue	= nvme_pci_register_queue,
  2634		.unregister_queue =  nvme_pci_unregister_queue,
> 2635		.queue_uring_cmd = nvme_pci_queue_ucmd,
> 2636		.poll_uring_cmd	= nvme_poll_uring_cmd,
  2637	};
  2638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

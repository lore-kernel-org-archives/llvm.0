Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C3A30AD1A;
	Wed,  6 May 2026 16:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086043; cv=none; b=UutOEc6FIEC9Z7i5mj3sZF6nWMdgXYkQsVwliEoSIV+hluXpBuzJCYLoZUUmoA7as+4vAIGIudCMKhM0DVycBU/f5hM6i9/XspnBkIaDERjhrv5bDWJOBptQZQOXzhJ/vivO4n+4C0jH4v5V6cTvlZAkWw32AqItmlLVhL2X3FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086043; c=relaxed/simple;
	bh=WwpKtRROmmW1GU9Ha5lIbgruC/01WEia4hXOCIPWiVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DwSrR8nj37ti0B2gmXisq0z5N8oeoqPXevOb3JsGRg98teb2UTqUPdEXA/301USvCe7bGQ4/ADvTz8g73EEKYgq6duCqyQbvn3p/ioHOKJI+0O/jN7Q0ccAy9iTrDM4H9GO4qM4jfzc/jS1vNomEoAQdFdQgow33+yzcvkHS67Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JoFynwBq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JoFynwBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778086041; x=1809622041;
  h=date:from:to:cc:subject:message-id;
  bh=WwpKtRROmmW1GU9Ha5lIbgruC/01WEia4hXOCIPWiVM=;
  b=JoFynwBqQCpaPXcw0ddwG7d15NurlB2veHhwyQcBHVex5K5BMamf8JWM
   6NsB7ZPH4XFvAt9RA5ME2azQt1Yy135vB0mgGUmekDVOXZ5OlwehX5RuQ
   desnU3EmDK82h/vAWCaIIOqx0jvkREUFiuhAwAt4+H+eErDt8a7YmP+LG
   mz/SCiMXX0xn+NhPQ6rH5lqF4nEUNeDzr06z74+fUPJugAYKaSmjXQsD5
   jpeKKR/gAZX61SNpaRK67/KOpEFs/h4z5zONt38p+bJcXoNQmzD/mc72N
   5JY4ThgTmfYBU04FoZOiav2zDwmnN+BolrwZ+TnsgAxJBEFf/ezeQYRnz
   g==;
X-CSE-ConnectionGUID: pFSGOE3cSWKmlOBIqLYlBQ==
X-CSE-MsgGUID: lYi4tz0IRESO8kkiNUNhXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79071588"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="79071588"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 09:47:20 -0700
X-CSE-ConnectionGUID: czGaU8TcSJ6zwBWs+uq1MQ==
X-CSE-MsgGUID: 6t3VgsP5TzOzAE4YRL0i/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259891869"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 May 2026 09:47:19 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKfP1-0000000014j-3Lvm;
	Wed, 06 May 2026 16:47:15 +0000
Date: Thu, 07 May 2026 00:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Anuj Gupta <anuj20.g@samsung.com>
Subject: [axboe:nvme-raw-queues 6/16] drivers/nvme/host/pci.c:2421:3:
 error: field designator 'register_queue' does not refer to any field in type
 'const struct blk_mq_ops'
Message-ID: <202605070041.kByaHcMe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git nvme-raw-queues
head:   38cfa7887dc8d403af2baa576d06c438408a192c
commit: 6c88c997f65b7435f11d31654c1d5007c6f82335 [6/16] pci: implement register/unregister functionality
config: loongarch-randconfig-001 (https://download.01.org/0day-ci/archive/20260507/202605070041.kByaHcMe-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605070041.kByaHcMe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605070041.kByaHcMe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/pci.c:2421:3: error: field designator 'register_queue' does not refer to any field in type 'const struct blk_mq_ops'
    2421 |         .register_queue = nvme_pci_register_queue,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/pci.c:2422:3: error: field designator 'unregister_queue' does not refer to any field in type 'const struct blk_mq_ops'
    2422 |         .unregister_queue =  nvme_pci_unregister_queue,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +2421 drivers/nvme/host/pci.c

  2410	
  2411	static const struct blk_mq_ops nvme_mq_ops = {
  2412		.queue_rq	= nvme_queue_rq,
  2413		.queue_rqs	= nvme_queue_rqs,
  2414		.complete	= nvme_pci_complete_rq,
  2415		.commit_rqs	= nvme_commit_rqs,
  2416		.init_hctx	= nvme_init_hctx,
  2417		.init_request	= nvme_pci_init_request,
  2418		.map_queues	= nvme_pci_map_queues,
  2419		.timeout	= nvme_timeout,
  2420		.poll		= nvme_poll,
> 2421		.register_queue	= nvme_pci_register_queue,
> 2422		.unregister_queue =  nvme_pci_unregister_queue,
  2423	};
  2424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

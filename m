Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9722836BCDE;
	Fri, 30 Jan 2026 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772969; cv=none; b=YWvk19hxjxHK965apOWrWAhqHRESlSn67ihM5dkAofxVZoougyWKubp+vjJEwX+XkaHqpRWLLd1wuSdLb/8TAcdg3tJp9mfRRR3yZic9S2ExoHoh1itbh0jZyTUkP+as7l82AcuLu6lqGritKy8pTFGL5zMKGsbn+AmyadFR2Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772969; c=relaxed/simple;
	bh=hW+r1Ygxd2+vqHd0uylKyFHXc/tTJEPmbGQcmYqAEPA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mYpYu5V7SCPgWAklzWyQdxPiohYiqp/Bvle7D7tS2lESbevqqADT54E0Cdvrlt9sYDuBR2M2swegioIfW58My6mbYVvBJuFZmbiZg7RLK6hZfY5DQpUcc/l1BjTnVlNiOalDAzMIU012HLuUEYOLWBqnaXhkAJUPMpfYuJMwQb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHAD+8/J; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHAD+8/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769772967; x=1801308967;
  h=date:from:to:cc:subject:message-id;
  bh=hW+r1Ygxd2+vqHd0uylKyFHXc/tTJEPmbGQcmYqAEPA=;
  b=IHAD+8/JQ8W4Ng1JwuwAU84LS7fGZVhPbZlZlhtw3Ut7BIe1lR9ThM8H
   mRqNlsdyz04Ss9wxee5NsOU90Q8XsRVmkjRxPZvRPX0Vg+5ZaU8+vLj4N
   PJiURF4h2TnhrRAN8ez74GoJ4Y5cBnZrTxgN/yxg+RHgz/8M12ILStVpu
   ykz8GKBvdvr4N9Bsg4IrowYxOiO3Wb5AyEvPk2cCrmfswn9i04FGGJJ/r
   i6XNPUPoLMlXt1xfzWfjGpXA/kIh6jQqfc6xd6CEVLllLqaPaVSOkfhR6
   8w76L+zY7xSJE342Cwd/+bFkogirpJcPCjAdzPtuJj4ymAQbbOV7och3K
   w==;
X-CSE-ConnectionGUID: n7zJZYR6SJmr1FoZ3nTa5g==
X-CSE-MsgGUID: SsfxU7dzRnuQ2LThod5Tiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70922017"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="70922017"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 03:36:07 -0800
X-CSE-ConnectionGUID: MqzJxf/XRxSAq4wSFb+EfA==
X-CSE-MsgGUID: Oc3NLoRmTpSRU0MZxq0IDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="213326051"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jan 2026 03:36:06 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlmnD-000000002UV-3Nq9;
	Fri, 30 Jan 2026 11:36:03 +0000
Date: Fri, 30 Jan 2026 12:35:36 +0100
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/lock_trace 1/5] fs/f2fs/checkpoint.c:96:3:
 error: expected ')'
Message-ID: <202601301207.oGrOdxmG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   6c41a3391b747e9a5e8c6fe63003d2a8157d2610
commit: ea581585794290038e10ac4f1343bb1f5013cc60 [1/5] f2fs: fix lock priority inversion issue
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260130/202601301207.oGrOdxmG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301207.oGrOdxmG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301207.oGrOdxmG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/checkpoint.c:96:3: error: expected ')'
      96 |                 return false;
         |                 ^
   fs/f2fs/checkpoint.c:95:5: note: to match this '('
      95 |         if (!(sem->sbi->adjust_lock_priority & BIT(sem->name - 1))
         |            ^
   1 error generated.


vim +96 fs/f2fs/checkpoint.c

    92	
    93	static bool need_uplift_priority(struct f2fs_rwsem *sem, bool is_write)
    94	{
    95		if (!(sem->sbi->adjust_lock_priority & BIT(sem->name - 1))
  > 96			return false;
    97	
    98		switch (sem->name) {
    99		/*
   100		 * writer is checkpoint which has high priority, let's just uplift
   101		 * priority for reader
   102		 */
   103		case LOCK_NAME_CP_RWSEM:
   104		case LOCK_NAME_NODE_CHANGE:
   105		case LOCK_NAME_NODE_WRITE:
   106			return !is_write;
   107		case LOCK_NAME_GC_LOCK:
   108		case LOCK_NAME_CP_GLOBAL:
   109		case LOCK_NAME_IO_RWSEM:
   110			return true;
   111		default:
   112			f2fs_bug_on(sem->sbi, 1);
   113		}
   114		return false;
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

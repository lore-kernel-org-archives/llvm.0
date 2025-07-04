Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514DB2571AA;
	Fri,  4 Jul 2025 06:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610564; cv=none; b=WbA+gOxjBWhEg13eU2eJeAq3w5W2NaZovmAyBwnf1gmQ/fivZP/ATSWtED4uHLQKIzhWILO0Cy0g90qfqfxmSDfj/siDQkBqyonEbkW5zyixBSgs65ziVAPUkz84jEpijyM72sLdkIu4arc30BueK9bypSwJWIkbTjsqanJ+S5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610564; c=relaxed/simple;
	bh=ImH06joPL3/qWGacg6dZs1pbwtWp5RCQiR/KBV2V29I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IUONneeydiB/VfDO7uXdAD0ck38WEpXMiMruz27PwdHv8drXwY6fx9oWcfDcFQg8DpRcQhBhf5qdu1CyLddetOxjgRoPNDu1dqk/DHGH9GssxN487dOFZL6jUZl5OuUoNltWm6ovZ3Z6vKgA8rGW3Mu2njiWLYOxl4h9Y/CgfVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTCPrSNE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTCPrSNE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751610562; x=1783146562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ImH06joPL3/qWGacg6dZs1pbwtWp5RCQiR/KBV2V29I=;
  b=YTCPrSNEqARZCcuyXCAV5DRR/fK8Vz+6VZHWsX/96ugCpZbHIS3xGmzn
   /Qqs4zToGkZMQlbml8e3cxPt0Iek3v3li0E8Yipuk7GQwOJeVTSUgEle/
   Sp5QEO+S6uGfi2Wq+GurxdBDD9u5Hs2659chuAoz70j/PVQFNsGZ4zR7r
   YeN6yJ6bc9IvCjwKliX+G8vXyzY4xsFB8WnH2MNxS8vK6K+ArKg+VnFnf
   a9cWewwq7d97FFT8PUr8cGKIG0s9tqN4VY1kvsWmMSyK9r5IzT/XpQpEJ
   l6A0Kf14xTrNb1/P9oHVYdNUcE+DTkwx4xzCRqISIZj3UxNFTDih1ejA2
   A==;
X-CSE-ConnectionGUID: ibFPD6lJTmCnPboGYA1aAA==
X-CSE-MsgGUID: wjGZZ/9XSna88kMqy9kBBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53075025"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="53075025"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 23:29:22 -0700
X-CSE-ConnectionGUID: CPFv5qDxT66SzbrSyBnQrQ==
X-CSE-MsgGUID: dWaxlykQS0uV12Ze89t/eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158840796"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jul 2025 23:29:20 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXZvC-0000dF-0e;
	Fri, 04 Jul 2025 06:29:18 +0000
Date: Fri, 4 Jul 2025 08:28:25 +0200
From: kernel test robot <lkp@intel.com>
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [linux-next:master 2648/7039] Warning:
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:526 function parameter 'f' not
 described in 'vmw_event_fence_action_seq_passed'
Message-ID: <202507040807.jKTxWGVQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d6c58332c7a8ba025fcfa76888b6c37dbce9633
commit: db6a94b263541af5678e520fb3959b03ec88ad2b [2648/7039] drm/vmwgfx: Implement dma_fence_ops properly
config: x86_64-buildonly-randconfig-2004-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040807.jKTxWGVQ-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040807.jKTxWGVQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040807.jKTxWGVQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:526 function parameter 'f' not described in 'vmw_event_fence_action_seq_passed'
>> Warning: drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:526 function parameter 'cb' not described in 'vmw_event_fence_action_seq_passed'
>> Warning: drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:526 Excess function parameter 'action' description in 'vmw_event_fence_action_seq_passed'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

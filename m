Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AACF1371E;
	Fri, 14 Jul 2023 12:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689339277; x=1720875277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XLiIL82FpICXQ5KqSckNu0EsoqO8tnIqPdID4AOO/C8=;
  b=GhM2AtsmaIcWDAlsmfREcgFNda19yEukUrwC1zUsbm8klikoyiRVHoHd
   x4s8QvVArhZ8l9qGa4+AW1pH/XFQKlauW0eFoQ9uw8zC58W+wHyeNBBSs
   5i9oWrM6oWRBdd5bpEPRlKJq7K53Hi960lTyJiBEEQCzm6+5zu4T6xouV
   E35sr+tJUVTLe+6UqGBEyAZezRPXbiB5d19AEzHfMBeaGglDXKyhkl/ie
   AUzEjtIyqFUKuaPNXzNhoZ3yBWH7P2mO0icOY6QaLVoeQBipeOVpe+y9+
   UGrz3jQ5rPcB15EX+nZd0RAoAfHQEWvieRcdOw2U341iIhtCwF+VXUjtq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="396277063"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="396277063"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 05:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787845409"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="787845409"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jul 2023 05:54:35 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKIJe-0007Rn-2E;
	Fri, 14 Jul 2023 12:54:34 +0000
Date: Fri, 14 Jul 2023 20:53:43 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rebase-6.4 96/106] warning: associated function
 `into_raw` is never used
Message-ID: <202307142038.2MXMsQxR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rebase-6.4
head:   56840d01010915de47cd63a7f7cbe7b3652d4286
commit: b104a02e80f54b540cc963d77dc90aa9b3917de7 [96/106] rust: dma_fence: Add DMA Fence abstraction
config: x86_64-buildonly-randconfig-r001-20230713 (https://download.01.org/0day-ci/archive/20230714/202307142038.2MXMsQxR-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307142038.2MXMsQxR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307142038.2MXMsQxR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated function `into_raw` is never used
   --> rust/kernel/dma_fence.rs:517:19
   |
   517 |     pub(crate) fn into_raw(self) -> *mut bindings::dma_fence_chain {
   |                   ^^^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

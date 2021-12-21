Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207D4173
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 05:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640063868; x=1671599868;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TDipzRwcun+yRf13ywC/ArTGnD605mSqL0YvOVSXCB0=;
  b=KmP5TzHeIShJp10O8jGCG0032wRstfw49EHMufCUw9xYKnPTZm3MpwnI
   AE+6KLCxT2gKP63fWa9BQojwWLBxmtGGXsozwN86tWKXXhABw6paNst4n
   aXvAlcsOyUalp8MsLzaky98S+5c5bdxMpS8s20H7IT9hUEQtcXTDSrk+V
   ls5pFgrvj7Kkb6SrLtaNqF7jaHuxzrfxQngGgGY1Ssz1QQsRiCClJdCLG
   P8+bk9qAbBx5/GupaAfCf3VOYGGAsyKJBRBAZ94hD0ZEkEi8XsMgjTpcY
   Hnk0gC6Fe6coRjiuZ87WgMr2VetMLp5p9j0Nzd6qqXbSm5uXRAOVNa9jD
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="240135069"
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; 
   d="scan'208";a="240135069"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 21:17:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; 
   d="scan'208";a="521104199"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 20 Dec 2021 21:17:46 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzXWz-0008iY-FP; Tue, 21 Dec 2021 05:17:45 +0000
Date: Tue, 21 Dec 2021 13:17:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 4140/8898] drivers/gpu/drm/i915/gt/intel_lrc.o:
 warning: objtool: gen12_emit_indirect_ctx_rcs()+0x3e2: unreachable
 instruction
Message-ID: <202112211343.KLfnkA68-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ramalingam C <ramalingam.c@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: Clint Taylor <Clinton.A.Taylor@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   07f8c60fe60f84977dc815ec8a6b1100827c34dd
commit: 4b19f6b728c7ae0cc285d2012d5aa1ab99be9b39 [4140/8898] drm/i915/dg2: Add Wa_16013000631
config: x86_64-randconfig-r026-20211220 (https://download.01.org/0day-ci/archive/20211221/202112211343.KLfnkA68-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4b19f6b728c7ae0cc285d2012d5aa1ab99be9b39
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 4b19f6b728c7ae0cc285d2012d5aa1ab99be9b39
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/ fs// mm//

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/intel_lrc.o: warning: objtool: gen12_emit_indirect_ctx_rcs()+0x3e2: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

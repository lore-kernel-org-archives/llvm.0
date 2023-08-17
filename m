Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD71E20F8;
	Thu, 17 Aug 2023 19:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692301854; x=1723837854;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Lb1p0ROhtllE/Ow4Y+z97jdGKJvSbfo6OaPMGL3OFss=;
  b=GGOeD304okDjEb7yoOY7XeRWjipeRChx0NlM82KzzcfqfxuOImICPCGo
   f+QvnZ8xLUndeobIIUrV1rTespQySs+3Yjomze/5ff1CtCZNwJYDOOFGK
   VQ/e3S6JY4qRw6eSMz/moNStPtJEy+bXuY7hetnYkzEWJVUyGJd1kt90G
   1HXQjbuLtgpa83uBR9izpY4U3GlROARV6cgeRyzzWcj/M9wmORq/V2pH6
   IBhUGt57Z2vUJ8xTszHTnMbuj4trdgjlJXqmOqu3mhg4uJi3T7mwxZGd4
   VoXR7rLPl7FdXn3fCqVCNYcuEJftiE9JdwqXAhnMzAQ/TUhyRLQInlHOk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363073009"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="363073009"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 12:50:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="711661135"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="711661135"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Aug 2023 12:50:53 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWj1A-0001Qp-1u;
	Thu, 17 Aug 2023 19:50:52 +0000
Date: Fri, 18 Aug 2023 03:49:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linusw-gpio:b4/descriptors-asoc-rt 4/20] ld.lld: error:
 vmlinux.a(init/main.o):(function trace_raw_output_initcall_level:
 .text+0x3be): relocation R_RISCV_HI20 out of range: 529271 is not in
 [-524288, 524287]; references .L.str.31
Message-ID: <202308180313.sET8aigh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-gpio@vger.kernel.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git b4/descriptors-asoc-rt
head:   9f4ec4cfd0f1cdd6df96c2cc8922ab0919a0a9ca
commit: 3379efc68bf203967daacbbdecc8a5fb6921b478 [4/20] ASoC: rt1016: Drop GPIO include
config: riscv-randconfig-r042-20230818 (https://download.01.org/0day-ci/archive/20230818/202308180313.sET8aigh-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180313.sET8aigh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180313.sET8aigh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function trace_raw_output_initcall_level: .text+0x3be): relocation R_RISCV_HI20 out of range: 529271 is not in [-524288, 524287]; references .L.str.31
   >>> referenced by main.c:1424 (init/main.c:1424)
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

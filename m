Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A566215D1;
	Tue, 15 Aug 2023 04:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692075077; x=1723611077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1VqDHCLuw6pJT2bWg8jGpIn+y/ZJG9dpG1NYkPTe/WY=;
  b=KRU7pAW3FmaXl9YLFRSKFnJLkeNLX/NoBaGHxRR3yeLZmmnQJDnE1OM8
   df0wYv+cJPP/Fj/L8GwC2HSDQNRBUTKmjnrHI9u2KZ22EXmLCZdWGsOMX
   oSDiu0isvMk4mOlOn8JLR+fI7tRIZ2pRPjDnfQKYr1jwbMxu/oDJ7eSyh
   c6IzJ89212QxY05UhEGxWEs6IQelggFtKVTbPFJqtHEZZ5Ty3ruNl7Z9y
   bpwAYm+lPUWdfzkdOz9FI+b+i3qT0L48MemTwgfXC9o7fuzj1C7b72P0l
   2frlR7XJC1Dww9ho321CTsBPydZ/bAuVR/rPSN8bsdfF9u3ijm+r24tpY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="374971127"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="374971127"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 21:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="799073264"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="799073264"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 14 Aug 2023 21:51:15 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVm1R-0000ep-2K;
	Tue, 15 Aug 2023 04:51:14 +0000
Date: Tue, 15 Aug 2023 12:51:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-peheader-cleanup 2/3] ld.lld: error: section .bstext
 virtual address range overlaps with .bss
Message-ID: <202308151227.HbIBw0ve-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-peheader-cleanup
head:   79e777a4973cf093f881fe5e0b34d2df1a4f4904
commit: a63cd35dcdeacc2fb05dee5634fbbfa7b0182d0e [2/3] x86/boot: Increase section and file alignment to 4k/512
config: x86_64-buildonly-randconfig-r001-20230815 (https://download.01.org/0day-ci/archive/20230815/202308151227.HbIBw0ve-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151227.HbIBw0ve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151227.HbIBw0ve-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: section .bstext virtual address range overlaps with .bss
   >>> .bstext range is [0x0, 0x1EE]
   >>> .bss range is [0x0, 0x132B]
--
>> ld.lld: error: section .bss virtual address range overlaps with .header
   >>> .bss range is [0x0, 0x132B]
   >>> .header range is [0x1EF, 0x26B]
--
>> ld.lld: error: section .bstext load address range overlaps with .bss
   >>> .bstext range is [0x0, 0x1EE]
   >>> .bss range is [0x0, 0x132B]
--
>> ld.lld: error: section .bss load address range overlaps with .header
   >>> .bss range is [0x0, 0x132B]
   >>> .header range is [0x1EF, 0x26B]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

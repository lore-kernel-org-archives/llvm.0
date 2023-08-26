Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFCA7E;
	Sat, 26 Aug 2023 04:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693022447; x=1724558447;
  h=date:from:cc:subject:message-id:mime-version;
  bh=wlOkT1wHpkvrTgb8ZcFgCvxxodZvakmlFE8hJr8t7eY=;
  b=gIlV0F51SD815dZiK1dLnZCWLvwChWudZFEoAavBm9vi+wdlFSLFLqJv
   xLS8vMuHCyzWYEVbCduRXAZmz1kK+SWEQZ9ftovq7GyP4x9JhmHhmNJ7Q
   /VcJlXxTdJenuGumEra+KFgT203bc6roEVzsAV7J7k6XmOpKfdZrbpT4i
   09qAWE66Yl6VKl5d0md6UENY+TBqoLoFzxjQxfAAH1Lee4+l8GZdiusjO
   WIlzKdsBKvO/9mI5vQtKB4IF8EGvxa/NBEvVY1aohLeO1VSPK9lzjcQzi
   42YsIEpdrI71tq1UQmq38LIkGXOGYrRiHFrsLpBJLGTsjam2mmpRvqvX3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373718313"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="373718313"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 21:00:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="1068437842"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="1068437842"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Aug 2023 21:00:44 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZkTc-0004Jt-04;
	Sat, 26 Aug 2023 04:00:44 +0000
Date: Sat, 26 Aug 2023 12:00:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [kvalo-ath:pending 12/37] ld.lld: error:
 vmlinux.a(fs/jfs/super.o):(function jfs_error: .text+0x48): relocation
 R_RISCV_HI20 out of range: 539669 is not in [-524288, 524287]; references
 'jfs_handle_error.__if_trace.0'
Message-ID: <202308261101.1y97PACY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Kalle Valo <kvalo@codeaurora.org>
CC: ath10k@lists.infradead.org
TO: Jeff Johnson <quic_jjohnson@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   d3fba4753be9529617e4373a6e6e58b5cd9d8739
commit: d68a283bfc39aeed2a51c67804e014bf4b35c7e1 [12/37] wifi: ath11k: Fix a few spelling errors
config: riscv-randconfig-r033-20230823 (https://download.01.org/0day-ci/archive/20230826/202308261101.1y97PACY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261101.1y97PACY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261101.1y97PACY-lkp@intel.com/

Note: the kvalo-ath/pending HEAD d3fba4753be9529617e4373a6e6e58b5cd9d8739 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(fs/jfs/super.o):(function jfs_error: .text+0x48): relocation R_RISCV_HI20 out of range: 539669 is not in [-524288, 524287]; references 'jfs_handle_error.__if_trace.0'
   >>> referenced by super.c:84 (fs/jfs/super.c:84)
   >>> defined in vmlinux.a(fs/jfs/super.o)
--
>> ld.lld: error: vmlinux.a(fs/jfs/super.o):(function jfs_error: .text+0x8c): relocation R_RISCV_HI20 out of range: 539669 is not in [-524288, 524287]; references 'jfs_handle_error.__if_trace.3.0'
   >>> referenced by fs.h:1988 (include/linux/fs.h:1988)
   >>> defined in vmlinux.a(fs/jfs/super.o)
--
>> ld.lld: error: vmlinux.a(fs/jfs/super.o):(function jfs_error: .text+0x184): relocation R_RISCV_HI20 out of range: 537115 is not in [-524288, 524287]; references '.L.str.4'
   >>> referenced by super.c:66 (fs/jfs/super.c:66)
   >>> defined in vmlinux.a(fs/jfs/super.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

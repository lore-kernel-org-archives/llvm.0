Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C964730F96;
	Fri,  8 Sep 2023 20:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694203356; x=1725739356;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Z2eRznisfaCGh3sB2nSbxNSb7+xlwh9YF8VD+SQe0So=;
  b=KdORv7AK4Kk2bfZmz4hiACmJlioWWuTx2DXJC0MuHuZP8gpfDSU4GnFO
   i4tZ48WViJ2N4eis7YJaT12ad4qgvrGGKpnnTK1hVD2XpnwcENG7UGqnn
   FY24VLORF3Rqd8looiEYbubeMhSFl+9crORa53NanBz7vKo6zmQnlSyBe
   OyYuH9L1DA7p6npC7BhpFxhsnZqiFgDEWSHbBf7TLc/kspKRypam4glAO
   j5wQwtziSO9NYFHFn9UksXnYL8z5yEDoGWsTB+Gsx2WboJK8N2naTu19P
   wtjpHiSm/ZHJ/5oj4Z6HRC0Vsum2MRa8ipHWueVVdDp2ICGcRHPbApc1F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="358036793"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="358036793"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 13:02:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="777703831"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="777703831"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Sep 2023 13:02:27 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qehgP-0002YZ-0L;
	Fri, 08 Sep 2023 20:02:25 +0000
Date: Sat, 9 Sep 2023 04:02:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_lookup_name: .text+0x7c): relocation R_RISCV_PCREL_HI20 out of
 range: -524527 is not in [-524288, 524287]; references
 kallsyms_seqs_of_names
Message-ID: <202309090319.qinh8x9I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Zhen Lei <thunder.leizhen@huawei.com>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a48fa7efaf1161c1c898931fe4c7f0070964233a
commit: 60443c88f3a89fd303a9e8c0e84895910675c316 kallsyms: Improve the performance of kallsyms_lookup_name()
date:   10 months ago
config: riscv-randconfig-r021-20230908 (https://download.01.org/0day-ci/archive/20230909/202309090319.qinh8x9I-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090319.qinh8x9I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090319.qinh8x9I-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_name: .text+0x7c): relocation R_RISCV_PCREL_HI20 out of range: -524527 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

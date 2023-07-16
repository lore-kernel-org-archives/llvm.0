Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FB715A0;
	Sun, 16 Jul 2023 03:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689476417; x=1721012417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tRzLeNjPO8Q5ebtV6bo7tt+GrxFnWy1NUMOarHLkU1s=;
  b=D5hXkf2b8hoWAefGiqfwguNYgYv9NmGHgV1e5LaXLxFRpzDsmHkTj037
   z3g3nbO8ZhPjxQwtZB4pxcDzzNGebiQePyx9WNG+ODxAC7nK8P/WE7/jN
   aPpQ1t9rYiDQTSo00/JDuCAKx4i/MWJ47P6Yj/rF05Hh7Kz8vrgz+/sdR
   3nhrpSc3BYJQ2zOpSbOY/N/MvHB36NT90dTx8zdUE+EyzpFPCd7wUixt9
   uYmR29YrnjuISEskB1vWGe/IbRaD4v0mLdPB/ZDEZn8HMjwUDBW1yNe8r
   wEO5DlnbrWeyvsGgBthbSt2bYQvspNBQG0eoFnxIDCZcDThh1mmQT0xyS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="364595521"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="364595521"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 20:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="846879214"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="846879214"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Jul 2023 20:00:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKrzW-0008V7-17;
	Sun, 16 Jul 2023 03:00:10 +0000
Date: Sun, 16 Jul 2023 11:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 347/365]
 include/linux/hugetlb.h:475:9: error: declaration of 'struct hstate' will
 not be visible outside of this function
Message-ID: <202307161034.oNdMkEfv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   da8c3aa0cbb638a0dff13401bc17f817272110e6
commit: 9e8a1c802ea25a508f001252830b3e5a5cf907d1 [347/365] mm: hugetlb: Move and expose hugetlbfs_zero_partial_page
config: powerpc-mpc832x_rdb_defconfig (https://download.01.org/0day-ci/archive/20230716/202307161034.oNdMkEfv-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161034.oNdMkEfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161034.oNdMkEfv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/setup-common.c:37:
>> include/linux/hugetlb.h:475:9: error: declaration of 'struct hstate' will not be visible outside of this function [-Werror,-Wvisibility]
           struct hstate *h, struct address_space *mapping, loff_t start, loff_t end) {}
                  ^
   1 error generated.


vim +475 include/linux/hugetlb.h

   473	
   474	static inline void hugetlb_zero_partial_page(
 > 475		struct hstate *h, struct address_space *mapping, loff_t start, loff_t end) {}
   476	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

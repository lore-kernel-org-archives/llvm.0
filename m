Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC9B15A0;
	Sun, 16 Jul 2023 03:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689479655; x=1721015655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zcdPr//9b6Nj96L+3kNscZhFmJ3GpRU6DH37HvRN6RI=;
  b=foLGi44M0yWny24P61dvz0Xq+ifdQamXVtyVrdQ4ikJp+pXaekRAlRQe
   FmbM4vx0GccBH2phW8uaBEtTT1jsKkC+1kSL91xuBGIywAbk0bR8FTOkw
   LrLBOPBnCJxFnPYNKbM7yb7f9oUKV84+K0uuRkgBq+bcjoZFXiEQAtDa7
   16KwN5FiFtyecz20Rd2S7NnDpCQo+LRE/qf0x3FQMWcjAlgbsfc9D5cPo
   /YHaE0+Ik1borJnhenJJAyhSinLwunOOVoh3jslaZUNNuGBXrx9sM0dG9
   G0h86PW9XOm2GyggZxJ9+3HY20SRTV27i5k326Dj4/OyFbOY5v8VjUBdT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="365769381"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="365769381"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 20:54:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="758006680"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="758006680"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Jul 2023 20:54:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKspo-0008YB-0A;
	Sun, 16 Jul 2023 03:54:12 +0000
Date: Sun, 16 Jul 2023 11:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 349/365]
 include/linux/hugetlb.h:485:58: error: declaration of 'struct
 hugepage_subpool' will not be visible outside of this function
Message-ID: <202307161139.ZT9ASRbC-lkp@intel.com>
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
commit: c8c40c9db949fdf0d8844aaf62ddd4a02febdb42 [349/365] mm: hugetlb: Decouple hstate, subpool from inode
config: powerpc-mpc832x_rdb_defconfig (https://download.01.org/0day-ci/archive/20230716/202307161139.ZT9ASRbC-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161139.ZT9ASRbC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161139.ZT9ASRbC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/setup-common.c:37:
   include/linux/hugetlb.h:482:9: error: declaration of 'struct hstate' will not be visible outside of this function [-Werror,-Wvisibility]
           struct hstate *h, struct address_space *mapping, loff_t start, loff_t end) {}
                  ^
   include/linux/hugetlb.h:485:40: error: declaration of 'struct hstate' will not be visible outside of this function [-Werror,-Wvisibility]
           struct address_space *mapping, struct hstate *h, struct hugepage_subpool *spool,
                                                 ^
>> include/linux/hugetlb.h:485:58: error: declaration of 'struct hugepage_subpool' will not be visible outside of this function [-Werror,-Wvisibility]
           struct address_space *mapping, struct hstate *h, struct hugepage_subpool *spool,
                                                                   ^
   3 errors generated.


vim +485 include/linux/hugetlb.h

   480	
   481	static inline void hugetlb_zero_partial_page(
   482		struct hstate *h, struct address_space *mapping, loff_t start, loff_t end) {}
   483	
   484	static inline void remove_mapping_hugepages(
 > 485		struct address_space *mapping, struct hstate *h, struct hugepage_subpool *spool,
   486		struct inode *inode, loff_t lstart, loff_t lend) {}
   487	static inline void remove_inode_hugepages(struct inode *inode, loff_t lstart, loff_t lend) {}
   488	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

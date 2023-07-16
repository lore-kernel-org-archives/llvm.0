Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95611187B;
	Sun, 16 Jul 2023 05:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689485418; x=1721021418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LbSwiC+Zpszuc64RPFZyx+BlJ4mHM338V26HzLxJKcw=;
  b=nrvRvFMsNIdyRyRTGXZC+MlUD8rXtUHCENboEDMPo5l9EONrj9xzM+1h
   JwnrYoV9OuxETtZTMIk4sD+TliHwpvV++N5FGC1UK9wkDKwKdKZfvUqZt
   RA1vjp466XCP3HIvKjUezt1Pn3fwWRU4EMryjs/A3KetdO6bf/ChEh5pw
   TA/1FCZ+76upXFzwSFm7YIbdLC+t65E4lG6wg+BPFEGG13NktHFZHJqD/
   J2zMiWFr+/55H5PTKgpbizkqDpKQ7m9pR1XkSRCdzHSo0M8Ly1YurB7/a
   hlpkaJLV9lqJZpmghH2xJ3hNa+6IpGKlT2NYl+W+KYRudUV2qknWu/iX1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="368372501"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="368372501"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 22:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="896831427"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="896831427"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Jul 2023 22:30:16 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKuKl-0008cw-21;
	Sun, 16 Jul 2023 05:30:15 +0000
Date: Sun, 16 Jul 2023 13:29:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 356/365]
 include/linux/hugetlb.h:488:9: error: declaration of 'struct resv_map' will
 not be visible outside of this function
Message-ID: <202307161345.FRaEH9gV-lkp@intel.com>
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
commit: f896a70f60673d612d27d0a8c2a3f37f4c1a6338 [356/365] mm: hugetlb: Parametrize hugetlb functions by resv_map
config: powerpc-mpc832x_rdb_defconfig (https://download.01.org/0day-ci/archive/20230716/202307161345.FRaEH9gV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161345.FRaEH9gV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161345.FRaEH9gV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/setup-common.c:37:
   include/linux/hugetlb.h:484:9: error: declaration of 'struct hstate' will not be visible outside of this function [-Werror,-Wvisibility]
           struct hstate *h, struct address_space *mapping, loff_t start, loff_t end) {}
                  ^
   include/linux/hugetlb.h:487:40: error: declaration of 'struct hstate' will not be visible outside of this function [-Werror,-Wvisibility]
           struct address_space *mapping, struct hstate *h, struct hugepage_subpool *spool,
                                                 ^
   include/linux/hugetlb.h:487:58: error: declaration of 'struct hugepage_subpool' will not be visible outside of this function [-Werror,-Wvisibility]
           struct address_space *mapping, struct hstate *h, struct hugepage_subpool *spool,
                                                                   ^
>> include/linux/hugetlb.h:488:9: error: declaration of 'struct resv_map' will not be visible outside of this function [-Werror,-Wvisibility]
           struct resv_map *resv_map, struct inode *inode, loff_t lstart, loff_t lend) {}
                  ^
   4 errors generated.


vim +488 include/linux/hugetlb.h

   482	
   483	static inline void hugetlb_zero_partial_page(
   484		struct hstate *h, struct address_space *mapping, loff_t start, loff_t end) {}
   485	
   486	static inline void remove_mapping_hugepages(
   487		struct address_space *mapping, struct hstate *h, struct hugepage_subpool *spool,
 > 488		struct resv_map *resv_map, struct inode *inode, loff_t lstart, loff_t lend) {}
   489	static inline void remove_inode_hugepages(struct inode *inode, loff_t lstart, loff_t lend) {}
   490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
